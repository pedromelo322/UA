"""M5 - Servidor com descoberta UDP.

Em relação ao M4: uma thread extra escuta DISCOVER em UDP (porta 5001 por
omissão) e responde com a porta TCP do chat, para os clientes encontrarem o
servidor na LAN sem escrever o endereço.

Herdado do M4:
- tudo numa classe ChatServer (permite arrancar vários servidores em testes,
  em porta efémera, e desligá-los de forma limpa);
- idle timeout por cliente (ERROR 408);
- linhas demasiado longas (ERROR 413) e JSON inválido nunca rebentam o servidor;
- cada cliente tem uma fila de envio e uma thread de escrita, para que um
  cliente lento não bloqueie os outros (fila cheia -> cliente desligado);
- Ctrl+C avisa e fecha todos os sockets;
- logging em vez de print.

Ver PROTOCOL.md para a especificação completa.
"""
import argparse
import json
import logging
import queue
import re
import socket
import threading

from discovery import DISCOVERY_PORT
from protocol import LineReader, LineTooLong, encode

log = logging.getLogger("chat")

NICK_RE = re.compile(r"[A-Za-z0-9_-]{1,16}")


def error(code, reason):
    return {"type": "ERROR", "code": code, "reason": reason}


class Client:
    """Uma ligação. Só a thread de escrita usa sendall() neste socket."""

    def __init__(self, sock, addr, queue_size):
        self.sock = sock
        self.addr = addr
        self.nick = None
        self.queue = queue.Queue(maxsize=queue_size)
        self.closing = False
        self.close_lock = threading.Lock()
        self.writer = threading.Thread(target=self._write_loop, daemon=True)

    def __str__(self):
        return f"{self.nick or '?'}@{self.addr[0]}:{self.addr[1]}"

    def send(self, msg):
        if self.closing:
            return
        try:
            self.queue.put_nowait(encode(msg))
        except queue.Full:
            log.warning("%s: fila de envio cheia, cliente lento desligado", self)
            self.close(flush=False)

    def close(self, flush=True):
        """Fecha a ligação (pode ser chamado várias vezes, de qualquer thread).

        Com flush, a thread de escrita envia primeiro o que já está na fila
        (ex.: o OK de um QUIT ou o ERROR 408) e só depois fecha o socket.
        """
        with self.close_lock:
            if self.closing:
                return
            self.closing = True
        if flush:
            try:
                self.queue.put(None, timeout=1)  # sentinela: "fecha quando chegares aqui"
                return
            except queue.Full:
                pass
        self._hard_close()

    def _hard_close(self):
        try:
            # shutdown acorda a thread que está bloqueada em recv() neste socket
            self.sock.shutdown(socket.SHUT_RDWR)
        except OSError:
            pass
        self.sock.close()

    def _write_loop(self):
        while True:
            data = self.queue.get()
            if data is None:
                break
            try:
                self.sock.sendall(data)
            except OSError as e:  # inclui timeout de envio e BrokenPipe
                log.info("%s: erro a enviar (%s)", self, e)
                self.closing = True
                break
        self._hard_close()


class ChatServer:
    def __init__(self, host="0.0.0.0", port=5000, idle_timeout=300.0, queue_size=1000,
                 discovery_port=DISCOVERY_PORT, name=None):
        self.host = host
        self.port = port
        self.discovery_port = discovery_port  # None desliga a descoberta
        self.name = name or socket.gethostname()
        self.udp = None
        self.idle_timeout = idle_timeout
        self.queue_size = queue_size
        self.clients: dict[str, Client] = {}  # nick -> cliente registado
        self.conns: set[Client] = set()       # todas as ligações, mesmo sem NICK
        self.lock = threading.Lock()
        self.stopping = threading.Event()
        self.srv = None
        self.handlers = {
            "NICK": self.do_nick,
            "MSG": self.do_msg,
            "PRIV": self.do_priv,
            "LIST": self.do_list,
        }

    # ---------- ciclo de vida ----------

    def start(self):
        srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        srv.bind((self.host, self.port))
        srv.listen()
        # accept() com timeout para o ciclo poder verificar se deve parar
        srv.settimeout(0.5)
        self.srv = srv
        self.port = srv.getsockname()[1]  # porta real se foi pedida a 0
        log.info("a escutar em %s:%d", self.host, self.port)
        if self.discovery_port is not None:
            self.start_discovery()

    def start_discovery(self):
        udp = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        udp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        # Sempre 0.0.0.0: um socket ligado a um IP concreto não recebe broadcasts em Linux
        udp.bind(("0.0.0.0", self.discovery_port))
        udp.settimeout(0.5)
        self.udp = udp
        self.discovery_port = udp.getsockname()[1]
        log.info("descoberta UDP na porta %d", self.discovery_port)
        threading.Thread(target=self.discovery_loop, daemon=True).start()

    def discovery_loop(self):
        while not self.stopping.is_set():
            try:
                data, addr = self.udp.recvfrom(2048)
            except socket.timeout:
                continue
            except OSError:
                break  # socket fechado no shutdown
            try:
                msg = json.loads(data.decode("utf-8"))
            except (UnicodeDecodeError, ValueError):
                msg = None
            if not isinstance(msg, dict) or msg.get("type") != "DISCOVER":
                log.debug("datagrama ignorado de %s:%d", *addr)
                continue
            with self.lock:
                users = len(self.clients)
            reply = {"type": "SERVER", "port": self.port, "name": self.name, "users": users}
            try:
                self.udp.sendto(json.dumps(reply).encode(), addr)
                log.debug("DISCOVER de %s:%d respondido", *addr)
            except OSError as e:
                log.debug("erro a responder a %s: %s", addr, e)

    def serve_forever(self):
        while not self.stopping.is_set():
            try:
                sock, addr = self.srv.accept()
            except socket.timeout:
                continue
            except OSError:
                break  # socket de escuta fechado
            sock.settimeout(self.idle_timeout)
            client = Client(sock, addr, self.queue_size)
            with self.lock:
                self.conns.add(client)
            client.writer.start()
            log.info("ligação de %s:%d", *addr)
            threading.Thread(target=self.client_thread, args=(client,), daemon=True).start()

    def shutdown(self):
        if self.stopping.is_set():
            return
        self.stopping.set()
        log.info("a terminar")
        if self.srv:
            self.srv.close()
        if self.udp:
            self.udp.close()
        with self.lock:
            conns = list(self.conns)
        for c in conns:
            c.send({"type": "EVENT", "text": "server shutting down"})
            c.close()
        for c in conns:
            c.writer.join(timeout=1)

    # ---------- envio ----------

    def broadcast(self, msg, exclude=None):
        with self.lock:
            targets = [c for c in self.clients.values() if c is not exclude]
        for c in targets:
            c.send(msg)

    # ---------- receção ----------

    def client_thread(self, client):
        reader = LineReader()
        try:
            while not client.closing:
                try:
                    data = client.sock.recv(4096)
                except socket.timeout:
                    log.info("%s: idle timeout", client)
                    client.send(error(408, "idle timeout"))
                    return
                if not data:
                    return
                for msg in reader.feed(data):
                    if not self.handle(client, msg):
                        return
        except OSError as e:  # ConnectionResetError, socket fechado por outra thread, ...
            log.debug("%s: %s", client, e)
        finally:
            self.cleanup(client)

    def cleanup(self, client):
        with self.lock:
            self.conns.discard(client)
            registered = client.nick is not None and self.clients.get(client.nick) is client
            if registered:
                del self.clients[client.nick]
        client.close()
        log.info("%s desligou", client)
        if registered:
            self.broadcast({"type": "EVENT", "text": f"{client.nick} left"})

    def handle(self, client, msg):
        """Processa uma mensagem. Devolve False se a ligação deve ser fechada."""
        if isinstance(msg, LineTooLong):
            client.send(error(413, "line too long"))
            return False
        if isinstance(msg, Exception):
            client.send(error(400, "bad json"))
            return True
        mtype = msg.get("type")
        if mtype == "QUIT":
            client.send({"type": "OK"})
            return False
        handler = self.handlers.get(mtype)
        if handler is None:
            client.send(error(400, "unknown type"))
        elif client.nick is None and mtype != "NICK":
            client.send(error(401, "NICK required"))
        else:
            handler(client, msg)
        return True

    # ---------- comandos ----------

    def do_nick(self, client, msg):
        if client.nick is not None:
            return client.send(error(400, "already registered"))
        nick = text_field(msg, "nick")
        if nick is None:
            return client.send(error(400, "missing nick"))
        if not NICK_RE.fullmatch(nick):
            return client.send(error(422, "invalid nick"))
        # Verificar e registar sob o mesmo lock, senão dois clientes podiam
        # registar o mesmo nick ao mesmo tempo.
        with self.lock:
            taken = nick in self.clients
            if not taken:
                self.clients[nick] = client
                client.nick = nick
        if taken:
            return client.send(error(409, "nick taken"))
        client.send({"type": "OK"})
        self.broadcast({"type": "EVENT", "text": f"{nick} joined"})
        log.info("%s registado", client)

    def do_msg(self, client, msg):
        text = text_field(msg, "text")
        if text is None:
            return client.send(error(400, "missing text"))
        self.broadcast({"type": "CHAT", "from": client.nick, "text": text, "private": False})

    def do_priv(self, client, msg):
        to, text = text_field(msg, "to"), text_field(msg, "text")
        if to is None or text is None:
            return client.send(error(400, "missing to/text"))
        with self.lock:
            target = self.clients.get(to)
        if target is None:
            return client.send(error(404, "no such user"))
        target.send({"type": "CHAT", "from": client.nick, "text": text, "private": True})
        client.send({"type": "OK"})

    def do_list(self, client, msg):
        with self.lock:
            nicks = sorted(self.clients)
        client.send({"type": "USERS", "nicks": nicks})


def text_field(msg, name):
    value = msg.get(name)
    return value if isinstance(value, str) else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="0.0.0.0")
    ap.add_argument("--port", type=int, default=5000)
    ap.add_argument("--idle-timeout", type=float, default=300.0, help="segundos sem receber nada")
    ap.add_argument("--discovery-port", type=int, default=DISCOVERY_PORT)
    ap.add_argument("--no-discovery", action="store_true", help="não responder a DISCOVER")
    ap.add_argument("--name", help="nome anunciado na descoberta (default: hostname)")
    ap.add_argument("--log-level", default="INFO")
    args = ap.parse_args()

    logging.basicConfig(level=args.log_level.upper(),
                        format="%(asctime)s %(levelname)-7s %(message)s")
    server = ChatServer(args.host, args.port, args.idle_timeout,
                        discovery_port=None if args.no_discovery else args.discovery_port,
                        name=args.name)
    server.start()
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.shutdown()


if __name__ == "__main__":
    main()
