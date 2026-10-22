"""M0 - Servidor TCP de eco (um cliente de cada vez).

Wireshark: capturar na interface 'lo' com o filtro 'tcp.port == 5000'
para ver o 3-way handshake (SYN, SYN-ACK, ACK), os dados e o FIN.
"""
import argparse
import socket


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", default="0.0.0.0")
    ap.add_argument("--port", type=int, default=5000)
    args = ap.parse_args()

    srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Evita "Address already in use" ao reiniciar o servidor
    srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    srv.bind((args.host, args.port))
    srv.listen()
    print(f"[echo] a escutar em {args.host}:{args.port}")

    try:
        while True:
            conn, addr = srv.accept()
            print(f"[echo] ligação de {addr}")
            with conn:
                while True:
                    data = conn.recv(4096)
                    if not data:  # recv() == b"" -> o peer fechou a ligação
                        break
                    conn.sendall(data)  # sendall repete send() até enviar tudo
            print(f"[echo] {addr} desligou")
    except KeyboardInterrupt:
        print("\n[echo] a terminar")
    finally:
        srv.close()


if __name__ == "__main__":
    main()
