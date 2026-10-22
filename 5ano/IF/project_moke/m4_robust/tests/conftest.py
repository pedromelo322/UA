"""Fixtures partilhadas: servidor em porta efémera e um cliente de teste simples."""
import json
import pathlib
import socket
import sys
import threading

import pytest

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent.parent))

from protocol import LineReader  # noqa: E402
from server import ChatServer  # noqa: E402

CLOSED = "CLOSED"


class Conn:
    """Cliente de teste: fala o protocolo diretamente sobre o socket."""

    def __init__(self, port):
        self.sock = socket.create_connection(("127.0.0.1", port), timeout=2)
        self.reader = LineReader()
        self.pending = []
        self.closed = False

    def send(self, *msgs):
        self.sock.sendall(b"".join((json.dumps(m) + "\n").encode() for m in msgs))

    def send_raw(self, data):
        self.sock.sendall(data)

    def recv(self, timeout=2.0):
        """Próxima mensagem, ou CLOSED se o servidor fechou. Falha com timeout."""
        while not self.pending:
            if self.closed:
                return CLOSED
            self.sock.settimeout(timeout)
            try:
                data = self.sock.recv(65536)
            except ConnectionResetError:
                data = b""
            if not data:
                self.closed = True
                return CLOSED
            self.pending.extend(self.reader.feed(data))
        return self.pending.pop(0)

    def recv_all(self, timeout=0.3):
        """Tudo o que chegar até haver `timeout` segundos de silêncio."""
        out = []
        while True:
            try:
                msg = self.recv(timeout)
            except socket.timeout:
                return out
            out.append(msg)
            if msg == CLOSED:
                return out

    def login(self, nick):
        self.send({"type": "NICK", "nick": nick})
        assert self.recv() == {"type": "OK"}
        assert self.recv() == {"type": "EVENT", "text": f"{nick} joined"}
        return self

    def close(self):
        self.sock.close()


@pytest.fixture
def make_server():
    servers = []

    def _make(**kwargs):
        s = ChatServer(host="127.0.0.1", port=0, **kwargs)
        s.start()
        threading.Thread(target=s.serve_forever, daemon=True).start()
        servers.append(s)
        return s

    yield _make
    for s in servers:
        s.shutdown()


@pytest.fixture
def server(make_server):
    return make_server()


@pytest.fixture
def connect(server):
    """connect() -> Conn sem nick; connect("ana") -> Conn já registado."""
    conns = []

    def _connect(nick=None, port=None):
        c = Conn(port or server.port)
        conns.append(c)
        return c.login(nick) if nick else c

    yield _connect
    for c in conns:
        c.close()
