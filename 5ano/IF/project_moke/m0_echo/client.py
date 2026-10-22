"""M0 - Cliente de eco: envia cada linha do stdin e mostra a resposta."""
import argparse
import socket


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="127.0.0.1")
    ap.add_argument("--port", type=int, default=5000)
    args = ap.parse_args()

    with socket.create_connection((args.host, args.port)) as sock:
        print(f"ligado a {args.host}:{args.port} (Ctrl+D para sair)")
        try:
            while True:
                line = input("> ")
                if not line:
                    continue
                data = line.encode("utf-8")
                sock.sendall(data)
                # Sem framing: lê até ter recebido tantos bytes quantos enviou
                received = b""
                while len(received) < len(data):
                    chunk = sock.recv(4096)
                    if not chunk:
                        print("servidor fechou a ligação")
                        return
                    received += chunk
                print(received.decode("utf-8"))
        except (EOFError, KeyboardInterrupt):
            print()


if __name__ == "__main__":
    main()
