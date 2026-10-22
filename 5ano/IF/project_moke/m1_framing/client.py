"""M1 - Cliente: envia NICK e depois cada linha do stdin como MSG.

Uma thread recebe e mostra mensagens; a thread principal lê o teclado.
"""
import argparse
import socket
import threading

from protocol import LineReader, send_msg


def show(msg):
    t = msg.get("type")
    if t == "CHAT":
        print(f"<{msg.get('from')}> {msg.get('text')}")
    elif t == "ERROR":
        print(f"! erro {msg.get('code')}: {msg.get('reason')}")
    elif t == "OK":
        pass
    else:
        print(f"? {msg}")


def receiver(sock):
    reader = LineReader()
    try:
        while True:
            data = sock.recv(4096)
            if not data:
                print("servidor fechou a ligação")
                break
            for msg in reader.feed(data):
                if isinstance(msg, Exception):
                    print(f"! mensagem inválida do servidor: {msg}")
                else:
                    show(msg)
    except OSError:
        pass


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=5000)
    ap.add_argument("--nick")
    args = ap.parse_args()

    nick = args.nick or input("nick: ").strip()
    sock = socket.create_connection((args.host, args.port))
    threading.Thread(target=receiver, args=(sock,), daemon=True).start()
    send_msg(sock, {"type": "NICK", "nick": nick})
    try:
        while True:
            line = input()
            if line:
                send_msg(sock, {"type": "MSG", "text": line})
    except (EOFError, KeyboardInterrupt):
        pass
    finally:
        sock.close()


if __name__ == "__main__":
    main()
