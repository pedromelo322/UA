"""M4 - Cliente com comandos (igual ao M3; a robustez nova está no servidor).

  /list               utilizadores ligados
  /msg <nick> <texto> mensagem privada
  /quit               sair
  /help               ajuda
  qualquer outra linha é enviada a todos
"""
import argparse
import socket
import threading

from protocol import LineReader, send_msg

HELP = "comandos: /list | /msg <nick> <texto> | /quit | /help"


def show(msg):
    t = msg.get("type")
    if t == "CHAT":
        tag = "[priv] " if msg.get("private") else ""
        print(f"{tag}<{msg.get('from')}> {msg.get('text')}")
    elif t == "EVENT":
        print(f"* {msg.get('text')}")
    elif t == "USERS":
        print(f"* ligados: {', '.join(msg.get('nicks', []))}")
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
                print("servidor fechou a ligação (Enter para sair)")
                break
            for msg in reader.feed(data):
                if isinstance(msg, Exception):
                    print(f"! mensagem inválida do servidor: {msg}")
                else:
                    show(msg)
    except OSError:
        pass


def parse_input(line):
    """Converte uma linha do utilizador numa mensagem do protocolo (ou None)."""
    if not line.startswith("/"):
        return {"type": "MSG", "text": line}
    cmd, _, rest = line.partition(" ")
    if cmd == "/list":
        return {"type": "LIST"}
    if cmd == "/quit":
        return {"type": "QUIT"}
    if cmd == "/msg":
        to, _, text = rest.strip().partition(" ")
        if to and text:
            return {"type": "PRIV", "to": to, "text": text}
        print("uso: /msg <nick> <texto>")
        return None
    print(HELP)
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=5000)
    ap.add_argument("--nick")
    args = ap.parse_args()

    nick = args.nick or input("nick: ").strip()
    sock = socket.create_connection((args.host, args.port))
    rx = threading.Thread(target=receiver, args=(sock,), daemon=True)
    rx.start()
    send_msg(sock, {"type": "NICK", "nick": nick})
    print(HELP)
    try:
        while rx.is_alive():
            line = input()
            if not line:
                continue
            msg = parse_input(line)
            if msg is None:
                continue
            send_msg(sock, msg)
            if msg["type"] == "QUIT":
                rx.join(timeout=2)  # esperar pelo OK e pelo fecho
                break
    except (EOFError, KeyboardInterrupt):
        try:
            send_msg(sock, {"type": "QUIT"})
        except OSError:
            pass
    except OSError:
        print("ligação perdida")
    finally:
        sock.close()


if __name__ == "__main__":
    main()
