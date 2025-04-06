import socket
import time
import struct
import matplotlib.pyplot as plt

# Configurações
RECEIVER_IP = "192.168.0.196"  # Substitua pelo IP do recetor
RECEIVER_PORT = 5000

BROADCAST_IP = "255.255.255.255"  # Endereço de broadcast
BROADCAST_PORT = 5000

SPEED_LEVELS = [0.01]  # Intervalos em segundos
PACKET_SIZE = 1024  # Tamanho de cada pacote
TOTAL_PACKETS = 1000  # Pacotes por velocidade

def send_packets(speed_level, delay):
    # Cria socket UDP
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1) #Broadcast
    
    # Envia pacote de inicialização e aguarda ACK
    sock.sendto(b"START", (BROADCAST_IP, BROADCAST_PORT))
    sock.settimeout(2)
    try:
        ack, _ = sock.recvfrom(1024)
        if ack != b"ACK":
            return
    except socket.timeout:
        print("Timeout ao iniciar. Pulando teste.")
        return

    # Envia 1000 pacotes de dados
    for seq in range(TOTAL_PACKETS):
        # Formato: velocidade (4 bytes), sequência (4 bytes), dados (1024 bytes)
        data = struct.pack("!II", speed_level, seq) + b"x" * PACKET_SIZE
        sock.sendto(data, (BROADCAST_IP, BROADCAST_PORT))
        time.sleep(delay)
    
    sock.close()

def main():
    # Utiliza apenas o primeiro nível de velocidade
    print(f"Testando velocidade única (delay: {SPEED_LEVELS[0]}s)...")
    send_packets(1, SPEED_LEVELS[0])
    
    # Corrigir criação do socket para enviar o sinal de término
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)  # ...existing code...
    sock.sendto(b"END", (BROADCAST_IP, BROADCAST_PORT))
    sock.close()

if __name__ == "__main__":
    main()