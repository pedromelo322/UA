
# SNMP Configuration

## Ativar interface ligado à VM de gestão

```bash
! 1. Configurar a interface f1/1 para a rede de gestão
interface FastEthernet1/1
 description LIGACAO_VM_GESTAO
 ip address 192.168.1.1 255.255.255.0
 no shutdown
```

## OSPF na rede

```bash
! 2. Anunciar esta rede no OSPF (para os outros routers responderem à VM)
router ospf 1
 network 192.168.1.0 0.0.0.255 area 0
```

## Ativar SNMP e traps

```bash
! 3. Configurar o SNMP (Essencial para o projeto)
snmp-server community public RO
! (Opcional) Enviar traps para a VM
snmp-server host 192.168.1.100 version 2c public
```

## Número da interface do túnel 1

`iso.3.6.1.2.1.2.2.1.2.7 STRING:"Tunnel1"`

## Correr código de monitorização

`python3 monitor_projeto.py -r 192.168.1.1 -c public -s 2`


## Teste de SNMP

### No recetor
```bash
iperf3 -s
```

### No cliente1:
```bash
iperf3 -c 10.10.0.2 -u -b 10M -t 30
```

### Resultados cliente1:
```plaintext
Connecting to host 10.10.0.2, port 5201
[  5] local 10.10.0.1 port 50827 connected to 10.10.0.2 port 5201
[ ID] Interval           Transfer     Bitrate         Total Datagrams
[  5]   0.00-1.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   1.00-2.00   sec  1.19 MBytes  9.93 Mbits/sec  891  
[  5]   2.00-3.06   sec  1.16 MBytes  9.23 Mbits/sec  870  
[  5]   3.06-4.00   sec  1.21 MBytes  10.7 Mbits/sec  906  
[  5]   4.00-5.00   sec  1.21 MBytes  10.2 Mbits/sec  909  
[  5]   5.00-6.00   sec  1.19 MBytes  10.0 Mbits/sec  895  
[  5]   6.00-7.00   sec  1.19 MBytes  9.97 Mbits/sec  893  
[  5]   7.00-8.00   sec  1.19 MBytes  9.93 Mbits/sec  892  
[  5]   8.00-9.00   sec  1.20 MBytes  10.0 Mbits/sec  897  
[  5]   9.00-10.01  sec  1.19 MBytes  9.92 Mbits/sec  892  
[  5]  10.01-11.06  sec  1.17 MBytes  9.28 Mbits/sec  876  
[  5]  11.06-12.00  sec  1.21 MBytes  10.8 Mbits/sec  911  
[  5]  12.00-13.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  13.00-14.01  sec  1.19 MBytes  9.92 Mbits/sec  894  
[  5]  14.01-15.00  sec  1.20 MBytes  10.1 Mbits/sec  898  
[  5]  15.00-16.00  sec  1.18 MBytes  9.91 Mbits/sec  885  
[  5]  16.00-17.00  sec  1.21 MBytes  10.1 Mbits/sec  903  
[  5]  17.00-18.01  sec  1.19 MBytes  9.95 Mbits/sec  895  
[  5]  18.01-19.00  sec  1.19 MBytes  10.0 Mbits/sec  893  
[  5]  19.00-20.00  sec  1.19 MBytes  9.93 Mbits/sec  893  
[  5]  20.00-21.00  sec  1.19 MBytes  10.0 Mbits/sec  891  
[  5]  21.00-22.00  sec  1.20 MBytes  10.1 Mbits/sec  899  
[  5]  22.00-23.00  sec  1.16 MBytes  9.67 Mbits/sec  868  
[  5]  23.00-24.00  sec  1.23 MBytes  10.3 Mbits/sec  920  
[  5]  24.00-25.05  sec  1.18 MBytes  9.37 Mbits/sec  883  
[  5]  25.05-26.01  sec  1.20 MBytes  10.6 Mbits/sec  904  
[  5]  26.01-27.01  sec  1.19 MBytes  9.93 Mbits/sec  891  
[  5]  27.01-28.00  sec  1.20 MBytes  10.1 Mbits/sec  898  
[  5]  28.00-29.01  sec  1.18 MBytes  9.89 Mbits/sec  887  
[  5]  29.01-30.00  sec  1.20 MBytes  10.1 Mbits/sec  902  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-30.00  sec  35.8 MBytes  10.0 Mbits/sec  0.000 ms  0/26824 (0%)  sender
[  5]   0.00-30.04  sec  34.4 MBytes  9.60 Mbits/sec  1.157 ms  1042/26821 (3.9%)  receiver

iperf Done.
```

```plaintext
[*] A monitorizar 192.168.1.1...
Interface                 | TX (Mbps)    | RX (Mbps)   
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
Tunnel1                   | 19.841       | 0.000       
-------------------------------------------------------
-------------------------------------------------------
Tunnel1                   | 21.860       | 0.000       
-------------------------------------------------------
FastEthernet0/0-mpls layer | 39.281       | 0.000       
-------------------------------------------------------
Tunnel1                   | 21.800       | 0.000       
-------------------------------------------------------
FastEthernet0/0           | 42.887       | 0.001       
FastEthernet1/0           | 0.001        | 43.401      
-------------------------------------------------------
Tunnel1                   | 21.692       | 0.000       
-------------------------------------------------------
FastEthernet0/0-mpls layer | 41.988       | 0.000       
-------------------------------------------------------
Tunnel1                   | 21.959       | 0.000       
-------------------------------------------------------
FastEthernet0/0           | 43.071       | 0.001       
FastEthernet1/0           | 0.001        | 43.493      
-------------------------------------------------------
Tunnel1                   | 21.183       | 0.000       
-------------------------------------------------------
FastEthernet0/0-mpls layer | 30.497       | 0.000       
-------------------------------------------------------
Tunnel1                   | 1.025        | 0.000       
-------------------------------------------------------
FastEthernet0/0           | 14.355       | 0.005       
FastEthernet1/0           | 0.004        | 14.666      
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

```


### No cliente2:
```bash
iperf3 -c 10.40.0.4 -u -b 10M -t 30
```

### Resultados cliente2:
```plaintext
Connecting to host 10.40.0.4, port 5201
[  5] local 10.40.0.1 port 34922 connected to 10.40.0.4 port 5201
[ ID] Interval           Transfer     Bitrate         Total Datagrams
[  5]   0.00-1.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   1.00-2.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   2.00-3.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   3.00-4.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   4.00-5.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   5.00-6.00   sec  1.19 MBytes  10.0 Mbits/sec  895  
[  5]   6.00-7.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   7.00-8.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   8.00-9.00   sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]   9.00-10.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  10.00-11.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  11.00-12.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  12.00-13.00  sec  1.19 MBytes  10.0 Mbits/sec  895  
[  5]  13.00-14.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  14.00-15.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  15.00-16.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  16.00-17.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  17.00-18.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  18.00-19.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  19.00-20.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  20.00-21.00  sec  1.19 MBytes  10.0 Mbits/sec  895  
[  5]  21.00-22.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  22.00-23.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  23.00-24.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  24.00-25.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  25.00-26.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  26.00-27.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  27.00-28.00  sec  1.19 MBytes  10.0 Mbits/sec  895  
[  5]  28.00-29.00  sec  1.19 MBytes  10.0 Mbits/sec  894  
[  5]  29.00-30.00  sec  1.19 MBytes  9.99 Mbits/sec  894  
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter    Lost/Total Datagrams
[  5]   0.00-30.00  sec  35.8 MBytes  10.0 Mbits/sec  0.000 ms  0/26824 (0%)  sender
[  5]   0.00-30.03  sec  35.8 MBytes  9.99 Mbits/sec  1.748 ms  0/26817 (0%)  receiver

iperf Done.

```

```plaintext
[*] A monitorizar 192.168.1.1...
Interface                 | TX (Mbps)    | RX (Mbps)   
-------------------------------------------------------
-------------------------------------------------------
FastEthernet0/1           | 0.315        | 0.001       
FastEthernet1/0           | 0.007        | 0.314       
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
FastEthernet0/1           | 44.019       | 0.001       
FastEthernet1/0           | 0.002        | 44.017      
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
FastEthernet0/1           | 44.132       | 0.002       
FastEthernet1/0           | 0.002        | 44.131      
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
FastEthernet0/1           | 44.210       | 0.001       
FastEthernet1/0           | 0.004        | 44.210      
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

```

