import hashlib
import os
import random
import threading
import time

import pytest

from client import ChatClient, safe_name, unique_path
from conftest import CLOSED, Conn
from protocol import LENGTH, MAX_FRAME


def err(code, reason, tid):
    return {"type": "ERROR", "code": code, "reason": reason, "id": tid}


def offer(to, tid, size, name="f.bin"):
    return {"type": "FILE_OFFER", "to": to, "id": tid, "name": name, "size": size}


def chunk(tid, data):
    return {"type": "FILE_CHUNK", "id": tid, "data": data}


@pytest.fixture
def pair(connect):
    a, b = connect("ana"), connect("rui")
    a.recv_all()
    return a, b


def test_transfer_relays_bytes_exactly(pair):
    a, b = pair
    data = bytes(range(256)) + random.randbytes(200_000)
    a.send(offer("rui", "t1", len(data), "foto.png"))
    assert a.recv() == {"type": "OK", "id": "t1"}
    assert b.recv() == {"type": "FILE_OFFER", "from": "ana", "id": "t1", "name": "foto.png", "size": len(data)}
    for i in range(0, len(data), 32768):
        a.send(chunk("t1", data[i:i + 32768]))
    digest = hashlib.sha256(data).hexdigest()
    a.send({"type": "FILE_END", "id": "t1", "sha256": digest})
    assert a.recv() == {"type": "OK", "id": "t1"}

    got = b""
    while (msg := b.recv())["type"] == "FILE_CHUNK":
        assert msg["from"] == "ana" and msg["id"] == "t1"
        got += msg["data"]
    assert msg == {"type": "FILE_END", "from": "ana", "id": "t1", "sha256": digest}
    assert got == data


def test_chat_keeps_flowing_during_transfer(pair):
    a, b = pair
    a.send(offer("rui", "t1", 6))
    a.recv(), b.recv()
    a.send(chunk("t1", b"abc"), {"type": "MSG", "text": "entretanto"}, chunk("t1", b"def"))
    types = [m["type"] for m in b.recv_all()]
    assert types == ["FILE_CHUNK", "CHAT", "FILE_CHUNK"]


def test_empty_file(pair):
    a, b = pair
    a.send(offer("rui", "t0", 0))
    a.send({"type": "FILE_END", "id": "t0", "sha256": hashlib.sha256(b"").hexdigest()})
    assert [m["type"] for m in b.recv_all()] == ["FILE_OFFER", "FILE_END"]


def test_offer_to_unknown_user_is_404(connect):
    a = connect("ana")
    a.send(offer("ninguem", "t1", 10))
    assert a.recv() == err(404, "no such user", "t1")


def test_offer_too_large_is_413(make_server):
    s = make_server(max_file=1000)
    a, _ = Conn(s.port).login("ana"), Conn(s.port).login("rui")
    a.send(offer("rui", "t1", 1001))
    assert a.recv_all()[-1] == err(413, "file too large", "t1")


def test_bad_offer_is_400(pair):
    a, _ = pair
    a.send({"type": "FILE_OFFER", "to": "rui", "id": "t1", "name": "x", "size": -1})
    assert a.recv() == err(400, "bad FILE_OFFER", "t1")


def test_chunk_for_unknown_transfer_is_400(pair):
    a, _ = pair
    a.send(chunk("nope", b"x"))
    assert a.recv() == err(400, "unknown transfer", "nope")


def test_more_data_than_announced_aborts(pair):
    a, b = pair
    a.send(offer("rui", "t1", 2))
    a.recv(), b.recv()
    a.send(chunk("t1", b"abc"))
    assert a.recv() == err(413, "more data than announced", "t1")
    assert b.recv() == {"type": "FILE_ABORT", "from": "ana", "id": "t1", "reason": "too much data"}


def test_sender_leaving_aborts_for_receiver(pair):
    a, b = pair
    a.send(offer("rui", "t1", 100), chunk("t1", b"x" * 10))
    a.recv(), b.recv(), b.recv()
    a.close()
    assert b.recv_all() == [
        {"type": "FILE_ABORT", "from": "ana", "id": "t1", "reason": "sender left"},
        {"type": "EVENT", "text": "ana left"},
    ]


def test_receiver_leaving_aborts_for_sender(pair):
    a, b = pair
    a.send(offer("rui", "t1", 100))
    a.recv(), b.recv()
    b.close()
    assert a.recv_all() == [
        {"type": "FILE_ABORT", "to": "rui", "id": "t1", "reason": "receiver left"},
        {"type": "EVENT", "text": "rui left"},
    ]


def test_frame_too_large_is_413_and_closes(pair):
    a, _ = pair
    a.send_raw(b'{"type":"FILE_CHUNK","id":"x"}\n' + LENGTH.pack(MAX_FRAME + 1))
    assert a.recv_all(timeout=1) == [{"type": "ERROR", "code": 413, "reason": "frame too large"}, CLOSED]


def test_chunk_before_nick_is_401_and_stream_stays_in_sync(connect):
    c = connect()
    c.send(chunk("t1", b"\n{garbage}\n"), {"type": "LIST"})
    assert c.recv_all() == [{"type": "ERROR", "code": 401, "reason": "NICK required"}] * 2


# ---------- cliente real (classe ChatClient) ----------

def test_safe_name():
    assert safe_name("../../etc/passwd") == "passwd"
    assert safe_name("C:\\Users\\x\\a.txt") == "a.txt"
    assert safe_name("..") == "ficheiro"
    assert safe_name('a<b>:"c|?*.txt') == "a_b___c___.txt"


def test_unique_path(tmp_path):
    (tmp_path / "a.txt").write_bytes(b"")
    (tmp_path / "a (1).txt.part").write_bytes(b"")
    assert unique_path(str(tmp_path), "a.txt") == str(tmp_path / "a (2).txt")


def test_client_end_to_end(server, tmp_path):
    src = tmp_path / "origem.bin"
    data = random.randbytes(300_000)
    src.write_bytes(data)
    downloads = tmp_path / "downloads"

    clients = {}
    for nick in ("ana", "rui"):
        c = Conn(server.port)
        cl = ChatClient(c.sock, str(downloads))
        c.sock.settimeout(None)
        threading.Thread(target=cl.receive_loop, daemon=True).start()
        cl.send({"type": "NICK", "nick": nick})
        clients[nick] = cl
    time.sleep(0.2)

    clients["ana"].send_file("rui", str(src))
    dest = downloads / "origem.bin"
    deadline = time.monotonic() + 5
    while not dest.exists() and time.monotonic() < deadline:
        time.sleep(0.05)
    assert dest.read_bytes() == data
    assert not os.path.exists(str(dest) + ".part")
    deadline = time.monotonic() + 2
    while clients["ana"].outgoing and time.monotonic() < deadline:
        time.sleep(0.05)
    assert clients["ana"].outgoing == {}  # o OK final do FILE_END chegou
