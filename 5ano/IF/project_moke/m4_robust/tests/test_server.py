import socket
import struct
import time

from conftest import CLOSED, Conn
from protocol import MAX_LINE


def err(code, reason):
    return {"type": "ERROR", "code": code, "reason": reason}


# ---------- NICK ----------

def test_nick_ok(connect):
    connect("ana")


def test_request_before_nick_is_401(connect):
    c = connect()
    c.send({"type": "MSG", "text": "x"}, {"type": "LIST"})
    assert c.recv_all() == [err(401, "NICK required")] * 2


def test_nick_taken_is_409(connect):
    connect("ana")
    c = connect()
    c.send({"type": "NICK", "nick": "ana"})
    assert c.recv() == err(409, "nick taken")


def test_invalid_nick_is_422(connect):
    c = connect()
    for bad in ["", "tem espaço", "x" * 17, "ã"]:
        c.send({"type": "NICK", "nick": bad})
    # "" é tratado como formato inválido, não como campo em falta
    assert c.recv_all() == [err(422, "invalid nick")] * 4


def test_second_nick_is_400(connect):
    c = connect("ana")
    c.send({"type": "NICK", "nick": "outra"})
    assert c.recv() == err(400, "already registered")


def test_join_is_announced_to_others(connect):
    a = connect("ana")
    connect("rui")
    assert a.recv() == {"type": "EVENT", "text": "rui joined"}


# ---------- MSG / PRIV / LIST ----------

def test_msg_goes_to_everyone_including_sender(connect):
    a, b = connect("ana"), connect("rui")
    a.recv_all()
    a.send({"type": "MSG", "text": "olá"})
    chat = {"type": "CHAT", "from": "ana", "text": "olá", "private": False}
    assert a.recv() == chat
    assert b.recv() == chat


def test_priv(connect):
    a, b, c = connect("ana"), connect("rui"), connect("ze_")
    a.recv_all(), b.recv_all()
    a.send({"type": "PRIV", "to": "rui", "text": "psst"})
    assert a.recv() == {"type": "OK"}
    assert b.recv() == {"type": "CHAT", "from": "ana", "text": "psst", "private": True}
    assert c.recv_all() == []


def test_priv_unknown_user_is_404(connect):
    a = connect("ana")
    a.send({"type": "PRIV", "to": "ninguem", "text": "?"})
    assert a.recv() == err(404, "no such user")


def test_list(connect):
    connect("rui")
    a = connect("ana")
    a.send({"type": "LIST"})
    assert a.recv() == {"type": "USERS", "nicks": ["ana", "rui"]}


def test_bad_requests_are_400_and_keep_connection(connect):
    a = connect("ana")
    a.send_raw(b'{bad\n[1]\n{"type":"FOO"}\n{"type":"MSG"}\n{"type":"PRIV","to":"x"}\n')
    assert a.recv_all() == [
        err(400, "bad json"), err(400, "bad json"), err(400, "unknown type"),
        err(400, "missing text"), err(400, "missing to/text"),
    ]
    a.send({"type": "LIST"})
    assert a.recv()["type"] == "USERS"


# ---------- saídas ----------

def test_quit(connect):
    a, b = connect("ana"), connect("rui")
    a.recv_all()
    b.send({"type": "QUIT"})
    assert b.recv_all() == [{"type": "OK"}, CLOSED]
    assert a.recv() == {"type": "EVENT", "text": "rui left"}


def test_abrupt_disconnect_rst(connect):
    a, b = connect("ana"), connect("rui")
    a.recv_all()
    # SO_LINGER com timeout 0 faz o close() enviar RST em vez de FIN
    b.sock.setsockopt(socket.SOL_SOCKET, socket.SO_LINGER, struct.pack("ii", 1, 0))
    b.close()
    assert a.recv() == {"type": "EVENT", "text": "rui left"}
    a.send({"type": "LIST"})
    assert a.recv() == {"type": "USERS", "nicks": ["ana"]}


def test_nick_is_freed_after_leaving(connect):
    connect("ana").send({"type": "QUIT"})
    time.sleep(0.2)
    connect("ana")


# ---------- robustez ----------

def test_idle_timeout_is_408(make_server):
    s = make_server(idle_timeout=0.5)
    c = Conn(s.port)
    assert c.recv() == err(408, "idle timeout")
    assert c.recv() == CLOSED


def test_line_too_long_is_413_and_closes(connect):
    a = connect("ana")
    a.send_raw(b"x" * (MAX_LINE + 10))
    assert a.recv_all(timeout=1) == [err(413, "line too long"), CLOSED]


def test_shutdown_warns_and_closes_clients(make_server):
    s = make_server()
    a = Conn(s.port).login("ana")
    s.shutdown()
    assert a.recv_all(timeout=1) == [{"type": "EVENT", "text": "server shutting down"}, CLOSED]


def test_slow_consumer_is_disconnected(make_server):
    s = make_server(queue_size=5)
    slow = socket.socket()
    slow.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, 1024)
    slow.connect(("127.0.0.1", s.port))
    slow.sendall(b'{"type":"NICK","nick":"lento"}\n')
    a = Conn(s.port).login("ana")
    a.recv_all()
    # o 'lento' nunca lê: os buffers do kernel enchem, depois a fila, e o servidor desliga-o
    text = "x" * 60000
    left = None
    for _ in range(400):
        a.send({"type": "PRIV", "to": "lento", "text": text})
        msg = a.recv()
        if msg != {"type": "OK"}:
            left = msg
            break
    # conforme a corrida, vê-se primeiro o aviso de saída ou o 404 do PRIV seguinte
    assert left in ({"type": "EVENT", "text": "lento left"}, err(404, "no such user"))
    slow.close()
