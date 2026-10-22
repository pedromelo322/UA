"""M5 - Cliente com descoberta: sem --host, procura servidores na LAN por UDP.

  python3 client.py --nick ana              descobre e liga (pergunta se houver vários)
  python3 client.py --discover              só lista os servidores encontrados
  python3 client.py --host 10.0.0.5         liga diretamente, sem descoberta

Comandos:
  /list               utilizadores ligados
  /msg <nick> <texto> mensagem privada
  /quit               sair
  /help               ajuda
  qualquer outra linha é enviada a todos
"""
import argparse
import socket
import threading

from discovery import DISCOVERY_PORT, discover
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


def choose_server(args):
    """Devolve (host, port) a usar, ou None se não houver servidor."""
    print(f"a procurar servidores (UDP {args.discovery_port})...")
    try:
        servers = discover(args.discovery_port, args.discover_timeout)
    except OSError as e:  # ex.: sem rede para enviar broadcast
        print(f"descoberta falhou: {e}")
        servers = []
    if args.discover:
        for ip, info in servers:
            print(f"  {info.get('name')}  {ip}:{info['port']}  ({info.get('users')} ligados)")
        return None
    if not servers:
        print("nenhum servidor encontrado. Usa --host <ip>, ou verifica a firewall (UDP 5001).")
        return None
    if len(servers) == 1:
        ip, info = servers[0]
        print(f"encontrado {info.get('name')} em {ip}:{info['port']}")
        return ip, info["port"]
    for i, (ip, info) in enumerate(servers, 1):
        print(f"  {i}) {info.get('name')}  {ip}:{info['port']}  ({info.get('users')} ligados)")
    while True:
        choice = input("escolhe: ").strip()
        if choice.isdigit() and 1 <= int(choice) <= len(servers):
            ip, info = servers[int(choice) - 1]
            return ip, info["port"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", help="IP do servidor (sem isto, usa descoberta UDP)")
    ap.add_argument("--port", type=int, default=5000)
    ap.add_argument("--nick")
    ap.add_argument("--discover", action="store_true", help="só listar servidores e sair")
    ap.add_argument("--discovery-port", type=int, default=DISCOVERY_PORT)
    ap.add_argument("--discover-timeout", type=float, default=1.0)
    args = ap.parse_args()

    if args.host and not args.discover:
        addr = (args.host, args.port)
    else:
        addr = choose_server(args)
        if addr is None:
            return
    nick = args.nick or input("nick: ").strip()
    try:
        sock = socket.create_connection(addr, timeout=5)
    except OSError as e:
        print(f"não foi possível ligar a {addr[0]}:{addr[1]}: {e}")
        return
    sock.settimeout(None)
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
