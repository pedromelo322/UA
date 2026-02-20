# Configuração MPLS e RSVP-TE

## OSPF-TE

```bash

mpls traffic-eng area 0
mpls traffic-eng router-id Loopback0

```

## Configuração de Bandwidth RSVP

Para configurar a bandwidth disponível, definimos 100 000, o que significa que quando ficarem usadas 10 000, sobram 90 000. Foi feito porque o default é 0, então não ia dar para reservar a bandwidth.

## Ativar MPLS (RSVP-TE) Geral e nas Interfaces em Todos os Routers

```bash

mpls traffic-eng tunnels

```

## Criar Tunnel em Lisboa e no Porto (Exemplo Lisboa)

```bash

interface Tunnel1
description Tunel_Cliente_L1
ip unnumbered Loopback0 ! Usa o IP do router como origem
tunnel destination 10.0.0.2 ! IP Loopback0 do Router Porto
tunnel mode mpls traffic-eng
#
#O Requisito: Garantir 10 Mbps (10000 kbps)
tunnel mpls traffic-eng bandwidth 10000

# O Requisito: Resiliência (Caminho dinâmico)
tunnel mpls traffic-eng path-option 1 dynamic
exit

```




## Policy Based Routing (PBR) para forçar o tráfego do cliente1 a usar o túnel MPLS

```bash
# 1. Definir o tráfego do Cliente 1 (Baseado na porta UDP customizada)
access-list 101 permit udp any any eq 4790

# 2. Criar o Route-Map para PBR
route-map CLIENTE1_TO_TE permit 10
 match ip address 101
 set interface Tunnel1

# 3. Aplicar na interface virada para o Datacenter (ex: f1/0)
interface FastEthernet1/0
 ip policy route-map CLIENTE1_TO_TE
 ```