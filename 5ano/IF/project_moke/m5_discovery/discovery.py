"""Descoberta de servidores na LAN por broadcast UDP (lado do cliente).

O cliente envia {"type":"DISCOVER"} em broadcast para a porta de descoberta;
cada servidor responde em unicast com {"type":"SERVER","port":...,"name":...,"users":...}.
O IP do servidor é o endereço de origem da resposta.
"""
import json
import socket
import time

DISCOVERY_PORT = 5001
BROADCAST = "255.255.255.255"


def discover(port=DISCOVERY_PORT, timeout=1.0, addr=BROADCAST):
    """Devolve [(ip, info), ...] dos servidores que responderam dentro do timeout."""
    found = {}
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as s:
        s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        s.sendto(json.dumps({"type": "DISCOVER"}).encode(), (addr, port))
        deadline = time.monotonic() + timeout
        while (left := deadline - time.monotonic()) > 0:
            s.settimeout(left)
            try:
                data, (ip, _) = s.recvfrom(2048)
            except socket.timeout:
                break
            try:
                info = json.loads(data.decode("utf-8"))
            except (UnicodeDecodeError, ValueError):
                continue
            if isinstance(info, dict) and info.get("type") == "SERVER" and type(info.get("port")) is int:
                found[(ip, info["port"])] = info  # o mesmo servidor pode responder mais do que uma vez
    return [(ip, info) for (ip, _), info in found.items()]
