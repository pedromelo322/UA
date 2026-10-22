"""Framing: uma mensagem = um objeto JSON em UTF-8 terminado por '\n'.

TCP é um fluxo de bytes: um recv() pode trazer meia mensagem ou várias
mensagens juntas. O LineReader acumula bytes e só devolve linhas completas.

M4: as linhas têm tamanho máximo. Sem limite, um peer que nunca envie '\n'
fazia o buffer crescer até esgotar a memória.
"""
import json

MAX_LINE = 64 * 1024


class LineTooLong(Exception):
    """Linha acima de MAX_LINE: o fluxo deixa de ser fiável e deve ser fechado."""


def encode(msg: dict) -> bytes:
    # json.dumps nunca produz '\n' literal (escapa-o como \\n), logo é seguro como delimitador
    return (json.dumps(msg, ensure_ascii=False) + "\n").encode("utf-8")


def send_msg(sock, msg: dict) -> None:
    # sendall repete send() até todos os bytes serem aceites
    sock.sendall(encode(msg))


class LineReader:
    def __init__(self):
        self.buf = b""

    def feed(self, data: bytes) -> list:
        """Recebe bytes e devolve a lista de mensagens completas.

        Cada elemento é um dict, uma ValueError se a linha não for JSON
        válido (para o chamador responder com ERROR em vez de rebentar), ou
        uma LineTooLong, que é sempre o último elemento da lista.
        """
        self.buf += data
        out = []
        while True:
            line, sep, rest = self.buf.partition(b"\n")
            if not sep:
                break
            self.buf = rest
            if len(line) > MAX_LINE:
                return self._too_long(out)
            line = line.strip()
            if not line:
                continue
            try:
                msg = json.loads(line.decode("utf-8"))
                if not isinstance(msg, dict):
                    raise ValueError("message is not a JSON object")
                out.append(msg)
            except (UnicodeDecodeError, ValueError) as e:
                out.append(ValueError(str(e)))
        if len(self.buf) > MAX_LINE:
            return self._too_long(out)
        return out

    def _too_long(self, out):
        self.buf = b""
        out.append(LineTooLong(f"line longer than {MAX_LINE} bytes"))
        return out
