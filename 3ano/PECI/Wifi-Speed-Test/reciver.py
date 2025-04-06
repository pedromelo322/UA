import socket
import struct
import matplotlib.pyplot as plt
from collections import defaultdict

# Configurações
LISTEN_PORT = 5000

def main():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(("0.0.0.0", LISTEN_PORT))
    
    current_speed = None
    received_packets = set()
    losses = defaultdict(list)
    total_packets_received = 0
    out_of_order_count = 0
    last_seq = -1
    plt.switch_backend('TkAgg')  # Usar backend interativo

    try:
        while True:
            data, addr = sock.recvfrom(1024 + 8)  # Ajuste do buffer
            
            if data == b"START":
                sock.sendto(b"ACK", addr)
                current_speed = None  # Reseta até receber o primeiro pacote
                received_packets.clear()
                total_packets_received = 0
                out_of_order_count = 0
                last_seq = -1
                print("Iniciando teste...")

            elif data == b"END":
                # Processar dados finais
                if current_speed is not None:
                    loss = 1000 - len(received_packets)
                    losses[current_speed].append(loss)
                break

            else:
                # Extrai speed_level e sequência
                speed_level, seq = struct.unpack("!II", data[:8])
                print(f"\rspeed_level = {speed_level} - seq = {seq}",end="")
                if current_speed is None:
                    current_speed = speed_level  # Define a velocidade atual
                received_packets.add(seq)
                total_packets_received += 1
                if seq < last_seq:
                    out_of_order_count += 1
                else:
                    last_seq = seq
                print(f"\rPacotes recebidos: {total_packets_received} - Fora de ordem: {out_of_order_count}", end="")

        print("\nTeste finalizado.")
        print(f"Total pacotes recebidos: {total_packets_received}")
        print(f"Pacotes fora de ordem: {out_of_order_count}")

        # Gerar gráfico
        speeds = sorted(losses.keys())
        avg_losses = [sum(losses[s])/len(losses[s]) for s in speeds]
        
        plt.figure()
        plt.plot(speeds, avg_losses, marker="o")
        plt.xlabel("Nível de Velocidade")
        plt.ylabel("Pacotes Perdidos (Média)")
        plt.title("Perda de Pacotes por Nível de Velocidade")
        plt.grid(True)
        plt.show()

        # (Opcional) Gerar gráfico simples
        plt.figure()
        plt.bar(["Recebidos", "Fora de Ordem"], [total_packets_received, out_of_order_count])
        plt.title("Estatísticas de Recepção")
        plt.show()

    finally:
        sock.close()

if __name__ == "__main__":
    main()