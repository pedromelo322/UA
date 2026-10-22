"""M3 - Servidor com comandos: LIST, PRIV, QUIT, nicks únicos e códigos de erro.

Ver PROTOCOL.md para a especificação completa.
"""
import argparse
import re
import socket
import threading

from protocol import LineReader, encode

NICK_RE = re.compile(r"[A-Za-z0-9_-]{1,16}")


def error(code, reason):
    return {"type": "ERROR", "code": code, "reason": reason}


class Client:
    def __init__(self, sock, addr):
        self.sock = sock
        self.addr = addr
        self.nick = None
        self.send_lock = threading.Lock()

    def send(self, msg):
        try:
            with self.send_lock:
                self.sock.sendall(encode(msg))
        except OSError:
            self.close()

    def close(self):
        try:
            self.sock.shutdown(socket.SHUT_RDWR)
        except OSError:
            pass
        self.sock.close()


clients: dict[str, Client] = {}  # nick -> cliente registado
clients_lock = threading.Lock()


def broadcast(msg, exclude=None):
    with clients_lock:
        targets = [c for c in clients.values() if c is not exclude]
    for c in targets:
        c.send(msg)


def text_field(msg, name):
    value = msg.get(name)
    return value if isinstance(value, str) else None


def do_nick(client, msg):
    if client.nick is not None:
        return client.send(error(400, "already registered"))
    nick = text_field(msg, "nick")
    if nick is None:
        return client.send(error(400, "missing nick"))
    if not NICK_RE.fullmatch(nick):
        return client.send(error(422, "invalid nick"))
    # Verificar e registar sob o mesmo lock, senão dois clientes podiam
    # registar o mesmo nick ao mesmo tempo.
    with clients_lock:
        if nick in clients:
            taken = True
        else:
            taken = False
            clients[nick] = client
            client.nick = nick
    if taken:
        return client.send(error(409, "nick taken"))
    client.send({"type": "OK"})
    broadcast({"type": "EVENT", "text": f"{nick} joined"})
    print(f"[m3] {client.addr} é '{nick}'")


def do_msg(client, msg):
    text = text_field(msg, "text")
    if text is None:
        return client.send(error(400, "missing text"))
    broadcast({"type": "CHAT", "from": client.nick, "text": text, "private": False})


def do_priv(client, msg):
    to, text = text_field(msg, "to"), text_field(msg, "text")
    if to is None or text is None:
        return client.send(error(400, "missing to/text"))
    with clients_lock:
        target = clients.get(to)
    if target is None:
        return client.send(error(404, "no such user"))
    target.send({"type": "CHAT", "from": client.nick, "text": text, "private": True})
    client.send({"type": "OK"})


def do_list(client, msg):
    with clients_lock:
        nicks = sorted(clients)
    client.send({"type": "USERS", "nicks": nicks})


HANDLERS = {"NICK": do_nick, "MSG": do_msg, "PRIV": do_priv, "LIST": do_list}


def client_thread(client):
    reader = LineReader()
    try:
        while True:
            data = client.sock.recv(4096)
            if not data:
                break
            for msg in reader.feed(data):
                if isinstance(msg, Exception):
                    client.send(error(400, "bad json"))
                    continue
                mtype = msg.get("type")
                if mtype == "QUIT":
                    client.send({"type": "OK"})
                    return  # o finally trata da limpeza
                if mtype not in HANDLERS:
                    client.send(error(400, "unknown type"))
                elif client.nick is None and mtype != "NICK":
                    client.send(error(401, "NICK required"))
                else:
                    HANDLERS[mtype](client, msg)
    except OSError:
        pass
    finally:
        with clients_lock:
            registered = client.nick is not None and clients.get(client.nick) is client
            if registered:
                del clients[client.nick]
        client.close()
        print(f"[m3] {client.addr} desligou")
        if registered:
            broadcast({"type": "EVENT", "text": f"{client.nick} left"})


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="0.0.0.0")
    ap.add_argument("--port", type=int, default=5000)
    args = ap.parse_args()

    srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    srv.bind((args.host, args.port))
    srv.listen()
    print(f"[m3] a escutar em {args.host}:{args.port}")
    try:
        while True:
            sock, addr = srv.accept()
            print(f"[m3] ligação de {addr}")
            threading.Thread(target=client_thread, args=(Client(sock, addr),), daemon=True).start()
    except KeyboardInterrupt:
        print("\n[m3] a terminar")
    finally:
        srv.close()


if __name__ == "__main__":
    main()
