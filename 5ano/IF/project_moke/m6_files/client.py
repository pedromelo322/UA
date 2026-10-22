"""M6 - Cliente com transferência de ficheiros.

  python3 client.py --nick ana              descobre o servidor e liga
  python3 client.py --host 10.0.0.5         liga diretamente, sem descoberta
  python3 client.py --discover              só lista os servidores encontrados

Comandos:
  /list                  utilizadores ligados
  /msg <nick> <texto>    mensagem privada
  /send <nick> <ficheiro> enviar um ficheiro
  /quit                  sair
  /help                  ajuda
  qualquer outra linha é enviada a todos

Os ficheiros recebidos são aceites automaticamente e gravados em --download-dir
(por omissão ./downloads), primeiro como <nome>.part e, depois de verificado
o SHA-256, com o nome final.
"""
import argparse
import hashlib
import os
import socket
import threading
import time
import uuid

from discovery import DISCOVERY_PORT, discover
from protocol import FrameReader, send_msg

HELP = "comandos: /list | /msg <nick> <texto> | /send <nick> <ficheiro> | /quit | /help"
CHUNK_SIZE = 32 * 1024
OFFER_TIMEOUT = 10.0


def human(n):
    for unit in ("B", "KB", "MB", "GB"):
        if n < 1024 or unit == "GB":
            return f"{n:.0f} {unit}" if unit == "B" else f"{n:.1f} {unit}"
        n /= 1024


def safe_name(name):
    """Nome de ficheiro seguro: sem diretórios (evita '../../etc/passwd') nem
    caracteres que o Windows não aceita."""
    name = name.replace("\\", "/").rsplit("/", 1)[-1]
    name = "".join("_" if ch in '<>:"|?*' else ch for ch in name if ch.isprintable()).strip()
    if name in ("", ".", ".."):
        name = "ficheiro"
    return name[:200]


def unique_path(directory, name):
    """directory/name, ou 'name (1).ext', 'name (2).ext'... se já existir."""
    stem, ext = os.path.splitext(name)
    candidate, i = name, 0
    while True:
        path = os.path.join(directory, candidate)
        if not os.path.exists(path) and not os.path.exists(path + ".part"):
            return path
        i += 1
        candidate = f"{stem} ({i}){ext}"


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


class Incoming:
    def __init__(self, sender, name, size, path):
        self.sender, self.name, self.size, self.path = sender, name, size, path
        self.part = path + ".part"
        self.file = open(self.part, "wb")  # binário: em modo texto o Windows estragava os bytes
        self.hash = hashlib.sha256()
        self.received = 0

    def discard(self):
        self.file.close()
        try:
            os.remove(self.part)
        except OSError:
            pass


class Outgoing:
    def __init__(self, tid, to, path, size):
        self.id, self.to, self.path, self.size = tid, to, path, size
        self.name = os.path.basename(path)
        self.state = "offered"  # offered -> sending -> ending
        self.answered = threading.Event()  # resposta ao FILE_OFFER (OK ou erro)
        self.aborted = threading.Event()


class ChatClient:
    def __init__(self, sock, download_dir):
        self.sock = sock
        self.download_dir = download_dir
        # o envio de ficheiros corre noutra thread: o lock impede que um chunk
        # e uma mensagem de chat se misturem no socket
        self.send_lock = threading.Lock()
        self.incoming: dict[tuple[str, str], Incoming] = {}
        self.outgoing: dict[str, Outgoing] = {}

    def send(self, msg):
        with self.send_lock:
            send_msg(self.sock, msg)

    # ---------- receção ----------

    def receive_loop(self):
        reader = FrameReader()
        try:
            while True:
                data = self.sock.recv(65536)
                if not data:
                    print("servidor fechou a ligação (Enter para sair)")
                    break
                for msg in reader.feed(data):
                    if isinstance(msg, Exception):
                        print(f"! mensagem inválida do servidor: {msg}")
                    else:
                        self.handle(msg)
        except OSError:
            pass
        finally:
            for inc in self.incoming.values():
                inc.discard()
            self.incoming.clear()
            for out in self.outgoing.values():
                out.aborted.set()
                out.answered.set()

    def handle(self, msg):
        t = msg.get("type")
        if t == "FILE_OFFER":
            self.on_offer(msg)
        elif t == "FILE_CHUNK":
            self.on_chunk(msg)
        elif t == "FILE_END":
            self.on_end(msg)
        elif t == "FILE_ABORT":
            self.on_abort(msg)
        elif t in ("OK", "ERROR") and msg.get("id") in self.outgoing:
            self.on_reply(msg)
        else:
            show(msg)

    def on_offer(self, msg):
        sender, tid, name, size = msg.get("from"), msg.get("id"), msg.get("name"), msg.get("size")
        if not isinstance(name, str) or type(size) is not int:
            return print(f"! FILE_OFFER inválido de {sender}")
        try:
            os.makedirs(self.download_dir, exist_ok=True)
            inc = Incoming(sender, name, size, unique_path(self.download_dir, safe_name(name)))
        except OSError as e:
            return print(f"! não foi possível gravar {name!r}: {e}")
        self.incoming[(sender, tid)] = inc
        print(f"* {sender} está a enviar {name} ({human(size)}) -> {inc.path}")

    def on_chunk(self, msg):
        inc = self.incoming.get((msg.get("from"), msg.get("id")))
        if inc is None:
            return
        inc.file.write(msg["data"])
        inc.hash.update(msg["data"])
        inc.received += len(msg["data"])

    def on_end(self, msg):
        inc = self.incoming.pop((msg.get("from"), msg.get("id")), None)
        if inc is None:
            return
        if inc.received != inc.size or inc.hash.hexdigest() != msg.get("sha256"):
            inc.discard()
            return print(f"! {inc.name} de {inc.sender} chegou corrompido e foi apagado")
        inc.file.close()
        os.replace(inc.part, inc.path)
        print(f"* recebido {os.path.basename(inc.path)} de {inc.sender} ({human(inc.size)}) ✓")

    def on_abort(self, msg):
        reason = msg.get("reason", "")
        if "from" in msg:  # quem estava a enviar para mim desistiu
            inc = self.incoming.pop((msg["from"], msg.get("id")), None)
            if inc:
                inc.discard()
                print(f"! receção de {inc.name} de {inc.sender} cancelada ({reason})")
        else:  # o destino de um envio meu saiu
            out = self.outgoing.pop(msg.get("id"), None)
            if out:
                out.aborted.set()
                out.answered.set()
                print(f"! envio de {out.name} para {out.to} cancelado ({reason})")

    def on_reply(self, msg):
        out = self.outgoing[msg["id"]]
        if msg["type"] == "ERROR":
            del self.outgoing[out.id]
            out.aborted.set()
            out.answered.set()
            print(f"! envio de {out.name} para {out.to} recusado: erro {msg.get('code')}: {msg.get('reason')}")
        elif out.state == "offered":
            out.state = "sending"
            out.answered.set()
        elif out.state == "ending":
            del self.outgoing[out.id]
            print(f"* {out.name} enviado para {out.to} ✓")

    # ---------- envio de ficheiros ----------

    def wait_transfers(self, timeout=300):
        """Espera que os envios em curso terminem (antes de sair)."""
        deadline = time.monotonic() + timeout
        if self.outgoing:
            print("* à espera que os envios terminem (Ctrl+C para cancelar)...")
        while self.outgoing and time.monotonic() < deadline:
            time.sleep(0.1)

    def send_file(self, to, path):
        path = os.path.expanduser(path)
        if not os.path.isfile(path):
            return print(f"! ficheiro não encontrado: {path}")
        out = Outgoing(uuid.uuid4().hex[:12], to, path, os.path.getsize(path))
        self.outgoing[out.id] = out
        threading.Thread(target=self._send_file, args=(out,), daemon=True).start()

    def _send_file(self, out):
        try:
            self.send({"type": "FILE_OFFER", "to": out.to, "id": out.id,
                       "name": out.name, "size": out.size})
            if not out.answered.wait(OFFER_TIMEOUT):
                self.outgoing.pop(out.id, None)
                return print(f"! sem resposta do servidor ao envio de {out.name}")
            if out.aborted.is_set():
                return
            print(f"* a enviar {out.name} ({human(out.size)}) para {out.to}...")
            digest = hashlib.sha256()
            sent, mark = 0, 25
            with open(out.path, "rb") as f:
                while chunk := f.read(CHUNK_SIZE):
                    if out.aborted.is_set():
                        return
                    self.send({"type": "FILE_CHUNK", "id": out.id, "data": chunk})
                    digest.update(chunk)
                    sent += len(chunk)
                    while out.size and sent * 100 >= mark * out.size and mark < 100:
                        print(f"  {out.name}: {mark}%")
                        mark += 25
            if sent != out.size:  # o ficheiro mudou enquanto era lido
                print(f"! {out.name} mudou durante o envio")
            out.state = "ending"
            self.send({"type": "FILE_END", "id": out.id, "sha256": digest.hexdigest()})
        except OSError as e:
            self.outgoing.pop(out.id, None)
            print(f"! erro a enviar {out.name}: {e}")


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
    ap.add_argument("--download-dir", default="downloads")
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
    client = ChatClient(sock, args.download_dir)
    rx = threading.Thread(target=client.receive_loop, daemon=True)
    rx.start()
    client.send({"type": "NICK", "nick": nick})
    print(HELP)
    try:
        while rx.is_alive():
            line = input()
            if not line:
                continue
            if line.startswith("/send"):
                _, to, path = (line.split(" ", 2) + ["", ""])[:3]
                if to and path.strip():
                    client.send_file(to, path.strip())
                else:
                    print("uso: /send <nick> <ficheiro>")
                continue
            msg = parse_input(line)
            if msg is None:
                continue
            if msg["type"] == "QUIT":
                client.wait_transfers()
            client.send(msg)
            if msg["type"] == "QUIT":
                rx.join(timeout=2)  # esperar pelo OK e pelo fecho
                break
    except (EOFError, KeyboardInterrupt) as e:
        try:
            if isinstance(e, EOFError):
                client.wait_transfers()
            client.send({"type": "QUIT"})
        except OSError:
            pass
    except OSError:
        print("ligação perdida")
    finally:
        sock.close()


if __name__ == "__main__":
    main()
