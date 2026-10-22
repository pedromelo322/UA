import socket

from discovery import discover


def test_discover_unicast(make_server):
    s = make_server(discovery_port=0, name="teste")
    found = discover(port=s.discovery_port, timeout=0.5, addr="127.0.0.1")
    assert found == [("127.0.0.1", {"type": "SERVER", "port": s.port, "name": "teste", "users": 0})]


def test_discover_broadcast(make_server):
    s = make_server(discovery_port=0)
    found = discover(port=s.discovery_port, timeout=0.5)
    assert any(info["port"] == s.port for _, info in found)


def test_users_count(make_server):
    from conftest import Conn
    s = make_server(discovery_port=0)
    a = Conn(s.port).login("ana")
    (_, info), = discover(port=s.discovery_port, timeout=0.5, addr="127.0.0.1")
    assert info["users"] == 1
    a.close()


def test_garbage_datagrams_are_ignored(make_server):
    s = make_server(discovery_port=0)
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as u:
        for junk in [b"lixo", b"\xff\xfe", b"[1,2]", b'{"type":"OUTRO"}']:
            u.sendto(junk, ("127.0.0.1", s.discovery_port))
        u.settimeout(0.3)
        try:
            data = u.recvfrom(2048)
        except socket.timeout:
            data = None
        assert data is None  # nada disto recebe resposta
    assert len(discover(port=s.discovery_port, timeout=0.5, addr="127.0.0.1")) == 1


def test_no_server_returns_empty():
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as u:
        u.bind(("127.0.0.1", 0))
        free_port = u.getsockname()[1]  # ninguém responde nesta porta
    assert discover(port=free_port, timeout=0.3, addr="127.0.0.1") == []
