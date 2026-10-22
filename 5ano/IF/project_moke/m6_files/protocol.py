"""Framing do M6: linhas JSON + frames binários com prefixo de comprimento.

Tudo continua a ser um objeto JSON em UTF-8 terminado por '\n', exceto que
uma linha com "type": "FILE_CHUNK" é SEMPRE seguida de um frame binário:

    {"type":"FILE_CHUNK","id":"..."}\n  <len: 4 bytes big-endian> <len bytes>

Os bytes do ficheiro nunca passam por JSON (não há base64 nem problemas com
'\n' ou UTF-8 no meio dos dados). Do lado do programa, o payload aparece no
campo "data" (bytes) da mensagem.
"""
import json
import struct

MAX_LINE = 64 * 1024
MAX_FRAME = 64 * 1024
BINARY_TYPES = {"FILE_CHUNK"}
LENGTH = struct.Struct("!I")  # unsigned int de 32 bits, ordem de rede (big-endian)


class ProtocolViolation(Exception):
    """Erro de framing: o fluxo deixa de ser fiável e deve ser fechado."""


class LineTooLong(ProtocolViolation):
    pass


class FrameTooLarge(ProtocolViolation):
    pass


def encode(msg: dict) -> bytes:
    """Serializa uma mensagem. Se for binária, msg["data"] vai no frame."""
    if msg.get("type") in BINARY_TYPES:
        header = {k: v for k, v in msg.items() if k != "data"}
        data = msg.get("data", b"")
        return _line(header) + LENGTH.pack(len(data)) + data
    return _line(msg)


def _line(msg):
    # json.dumps nunca produz '\n' literal (escapa-o como \\n), logo é seguro como delimitador
    return (json.dumps(msg, ensure_ascii=False) + "\n").encode("utf-8")


def send_msg(sock, msg: dict) -> None:
    # sendall repete send() até todos os bytes serem aceites
    sock.sendall(encode(msg))


class FrameReader:
    """Acumula bytes e devolve mensagens completas (máquina de estados).

    Estado "linha": procura '\n'. Se a linha for um FILE_CHUNK, passa ao
    estado "frame": espera 4 bytes de comprimento e depois esses bytes todos.
    """

    def __init__(self):
        self.buf = bytearray()
        self.header = None  # cabeçalho FILE_CHUNK à espera do seu frame

    def feed(self, data: bytes) -> list:
        """Devolve uma lista de dicts, ValueError (linha inválida, a ligação
        continua) ou ProtocolViolation (sempre o último elemento)."""
        self.buf += data
        out = []
        while True:
            if self.header is not None:
                if len(self.buf) < LENGTH.size:
                    break
                (n,) = LENGTH.unpack_from(self.buf)
                if n > MAX_FRAME:
                    return self._violation(out, FrameTooLarge("frame too large"))
                if len(self.buf) < LENGTH.size + n:
                    break
                self.header["data"] = bytes(self.buf[LENGTH.size:LENGTH.size + n])
                del self.buf[:LENGTH.size + n]
                out.append(self.header)
                self.header = None
                continue

            i = self.buf.find(b"\n")
            if i < 0:
                if len(self.buf) > MAX_LINE:
                    return self._violation(out, LineTooLong("line too long"))
                break
            line = bytes(self.buf[:i]).strip()
            del self.buf[:i + 1]
            if i > MAX_LINE:
                return self._violation(out, LineTooLong("line too long"))
            if not line:
                continue
            try:
                msg = json.loads(line.decode("utf-8"))
                if not isinstance(msg, dict):
                    raise ValueError("message is not a JSON object")
            except (UnicodeDecodeError, ValueError) as e:
                out.append(ValueError(str(e)))
                continue
            if msg.get("type") in BINARY_TYPES:
                self.header = msg
            else:
                out.append(msg)
        return out

    def _violation(self, out, exc):
        self.buf.clear()
        self.header = None
        out.append(exc)
        return out

