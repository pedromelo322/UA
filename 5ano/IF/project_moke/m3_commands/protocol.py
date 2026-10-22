"""Framing: uma mensagem = um objeto JSON em UTF-8 terminado por '\n'.

TCP é um fluxo de bytes: um recv() pode trazer meia mensagem ou várias
mensagens juntas. O LineReader acumula bytes e só devolve linhas completas.
"""
import json


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

        Cada elemento é um dict, ou uma ValueError se a linha não for JSON
        válido (para o chamador responder com ERROR em vez de rebentar).
        """
        self.buf += data
        out = []
        while b"\n" in self.buf:
            line, self.buf = self.buf.split(b"\n", 1)
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
        return out
