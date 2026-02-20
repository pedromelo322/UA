from snimpy.manager import Manager as M
from snimpy.manager import load
import time
import argparse

def main():
    mib.path("./mibs/cisco/:./mibs/iana/:./mibs/ietf/")
    load("SNMPv2-MIB")
    load("IF-MIB")
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-r', '--router', required=True, help='IP do Router Cisco (Lisbon)')
    parser.add_argument('-c', '--community', default='public', help='Comunidade SNMP')
    parser.add_argument('-s', '--sinterval', type=int, default=2, help='Intervalo de sleep desejado')
    args = parser.parse_args()

    print(f"[*] A monitorizar {args.router}...")
    m = M(args.router, args.community, 2) 

    # Mapear Index -> Nome
    ifNames = {}
    for i, name in m.ifDescr.items():
        ifNames[i] = str(name)

    last_stats = {}
    
    # Guardar o tempo da primeira leitura
    last_check_time = time.time()

    print(f"{'Interface':<25} | {'TX (Mbps)':<12} | {'RX (Mbps)':<12}")
    print("-" * 55)

    try:
        while True:
            # Tentar ler High Capacity (64-bit), fallback para 32-bit
            try:
                current_out = m.ifHCOutOctets
                current_in = m.ifHCInOctets
            except:
                current_out = m.ifOutOctets
                current_in = m.ifInOctets
            
            # Capturar o tempo ATUAL exato após receber os dados
            current_check_time = time.time()
            
            # Calcular quanto tempo passou realmente (ex: 2.5s, 5s, etc.)
            time_delta = current_check_time - last_check_time

            # Evitar divisão por zero na primeira execução ou se for muito rápido
            if time_delta > 0:
                for idx in current_out:
                    if idx in last_stats:
                        if_name = ifNames.get(idx, f"Interface {idx}")

                        # Filtro para limpar a saída
                        if "Tunnel" not in if_name and "FastEthernet" not in if_name:
                            continue

                        delta_out = int(current_out[idx]) - int(last_stats[idx]['out'])
                        delta_in = int(current_in[idx]) - int(last_stats[idx]['in'])

                        if delta_out < 0: delta_out = 0
                        if delta_in < 0: delta_in = 0

                        # USAR O time_delta REAL NA FÓRMULA
                        mbps_out = (delta_out * 8) / (time_delta * 1000000)
                        mbps_in = (delta_in * 8) / (time_delta * 1000000)

                        # Só mostrar se houver tráfego relevante (> 0.1 Mbps) para limpar a tela
                        if mbps_out > 0.1 or mbps_in > 0.1:
                            print(f"{if_name:<25} | {mbps_out:<12.3f} | {mbps_in:<12.3f}")

                print("-" * 55)

            # Atualizar estado e tempo
            for idx in current_out:
                last_stats[idx] = {
                    'out': int(current_out[idx]), 
                    'in': int(current_in[idx])
                }
            last_check_time = current_check_time

            time.sleep(args.sinterval)

    except KeyboardInterrupt:
        print("\nFim.")

if __name__ == "__main__":
    from snimpy import mib
    main()
