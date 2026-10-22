"""M1 - Servidor com framing JSON por linha e mensagens NICK/MSG.

Ainda só atende um cliente de cada vez. MSG é devolvido como CHAT ao próprio.
"""
import argparse
import socket

from protocol import LineReader, send_msg


def handle(conn):
    reader = LineReader()
    nick = None
    while True:
        data = conn.recv(4096)
        if not data:
            return
        for msg in reader.feed(data):
            if isinstance(msg, Exception):
                send_msg(conn, {"type": "ERROR", "code": 400, "reason": "bad json"})
                continue
            mtype = msg.get("type")
            if nick is None and mtype != "NICK":
                send_msg(conn, {"type": "ERROR", "code": 401, "reason": "NICK required"})
            elif mtype == "NICK":
                if not isinstance(msg.get("nick"), str) or not msg["nick"]:
                    send_msg(conn, {"type": "ERROR", "code": 400, "reason": "missing nick"})
                else:
                    nick = msg["nick"]
                    send_msg(conn, {"type": "OK"})
            elif mtype == "MSG":
                if not isinstance(msg.get("text"), str):
                    send_msg(conn, {"type": "ERROR", "code": 400, "reason": "missing text"})
                else:
                    send_msg(conn, {"type": "CHAT", "from": nick, "text": msg["text"], "private": False})
            else:
                send_msg(conn, {"type": "ERROR", "code": 400, "reason": "unknown type"})


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="0.0.0.0")
    ap.add_argument("--port", type=int, default=5000)
    args = ap.parse_args()

    srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    srv.bind((args.host, args.port))
    srv.listen()
    print(f"[m1] a escutar em {args.host}:{args.port}")
    try:
        while True:
            conn, addr = srv.accept()
            print(f"[m1] ligação de {addr}")
            with conn:
                try:
                    handle(conn)
                except OSError as e:
                    print(f"[m1] erro com {addr}: {e}")
            print(f"[m1] {addr} desligou")
    except KeyboardInterrupt:
        print("\n[m1] a terminar")
    finally:
        srv.close()


if __name__ == "__main__":
    main()
