"""M2 - Servidor multi-cliente: uma thread por cliente.

A lista de clientes é partilhada entre threads, por isso é protegida por um
lock. O broadcast copia a lista sob o lock e envia fora dele, para que um
cliente lento não bloqueie quem quer entrar/sair.
"""
import argparse
import socket
import threading

from protocol import LineReader, encode


class Client:
    def __init__(self, sock, addr):
        self.sock = sock
        self.addr = addr
        self.nick = None
        # Duas threads podem enviar para o mesmo socket (a do próprio e um broadcast);
        # o lock impede que os bytes de duas mensagens se misturem.
        self.send_lock = threading.Lock()

    def send(self, msg):
        try:
            with self.send_lock:
                self.sock.sendall(encode(msg))
        except OSError:
            # Falha a enviar: fechar o socket faz o recv() da thread dele
            # falhar, e essa thread trata da limpeza.
            self.close()

    def close(self):
        try:
            self.sock.shutdown(socket.SHUT_RDWR)
        except OSError:
            pass
        self.sock.close()


clients: list[Client] = []  # apenas clientes que já enviaram NICK
clients_lock = threading.Lock()


def broadcast(msg, exclude=None):
    with clients_lock:
        targets = [c for c in clients if c is not exclude]
    for c in targets:
        c.send(msg)


def handle_msg(client, msg):
    mtype = msg.get("type")
    if client.nick is None and mtype != "NICK":
        client.send({"type": "ERROR", "code": 401, "reason": "NICK required"})
    elif mtype == "NICK":
        if client.nick is not None:
            client.send({"type": "ERROR", "code": 400, "reason": "already registered"})
        elif not isinstance(msg.get("nick"), str) or not msg["nick"]:
            client.send({"type": "ERROR", "code": 400, "reason": "missing nick"})
        else:
            client.nick = msg["nick"]
            with clients_lock:
                clients.append(client)
            client.send({"type": "OK"})
            broadcast({"type": "EVENT", "text": f"{client.nick} joined"})
            print(f"[m2] {client.addr} é '{client.nick}'")
    elif mtype == "MSG":
        if not isinstance(msg.get("text"), str):
            client.send({"type": "ERROR", "code": 400, "reason": "missing text"})
        else:
            broadcast({"type": "CHAT", "from": client.nick, "text": msg["text"], "private": False})
    else:
        client.send({"type": "ERROR", "code": 400, "reason": "unknown type"})


def client_thread(client):
    reader = LineReader()
    try:
        while True:
            data = client.sock.recv(4096)
            if not data:
                break
            for msg in reader.feed(data):
                if isinstance(msg, Exception):
                    client.send({"type": "ERROR", "code": 400, "reason": "bad json"})
                else:
                    handle_msg(client, msg)
    except OSError:
        pass
    finally:
        with clients_lock:
            was_registered = client in clients
            if was_registered:
                clients.remove(client)
        client.close()
        print(f"[m2] {client.addr} desligou")
        if was_registered:
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
    print(f"[m2] a escutar em {args.host}:{args.port}")
    try:
        while True:
            sock, addr = srv.accept()
            print(f"[m2] ligação de {addr}")
            threading.Thread(target=client_thread, args=(Client(sock, addr),), daemon=True).start()
    except KeyboardInterrupt:
        print("\n[m2] a terminar")
    finally:
        srv.close()


if __name__ == "__main__":
    main()
