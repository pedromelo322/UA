# Configuração de Layer 2 VPN com VXLAN e BGP EVPN

## Criar VRFs para isolamento de tráfego

Para isolar o tráfego de diferentes clientes, criamos VRFs (Virtual Routing and Forwarding) no Linux.

```bash
# 1. Criar a VRF para o Cliente 1 (Tabela ID 1001 - número arbitrário)
ip link add vrf_cl1 type vrf table 1001
ip link set vrf_cl1 up

# 2. Criar a VRF para o Cliente 2 (Tabela ID 1002)
ip link add vrf_cl2 type vrf table 1002
ip link set vrf_cl2 up
```

## Criar bridges e VXLAN tunnels para cada cliente

### Para o Cliente 1 (usando VLAN tags)

```bash
# A. Criar o Túnel VXLAN para a VLAN 10
# ID 10010: É o VNI (o identificador que viaja na rede da operadora)
# Local: O IP de Loopback DESTE Leaf (ex: 10.0.0.21)
# 4789: Porta standard VXLAN
ip link add vxlan10010 type vxlan id 10010 local 10.0.0.21 dstport 4790 nolearning

# B. Criar a Bridge (O "Switch Virtual" para a VLAN 10)
ip link add br_v10 type bridge

# C. Associar a Bridge à VRF do Cliente 1 (CRUCIAL para o isolamento)
ip link set br_v10 master vrf_cl1

# D. Ligar o Túnel à Bridge
ip link set vxlan10010 master br_v10

# E. Tratar da interface física (eth1)
# Como o cliente envia TAGGED frames, criamos uma sub-interface.
ip link add link eth1 name eth1.10 type vlan id 10
# Ligamos a sub-interface à Bridge
ip link set eth1.10 master br_v10

# F. Ligar tudo
ip link set vxlan10010 up
ip link set br_v10 up
ip link set eth1.10 up
```

### Para o Cliente 2 (não usa VLAN tags)

```bash
# A. Criar o Túnel VXLAN para o Cliente 2
# ID 20000: VNI diferente para o Cliente 2
ip link add vxlan20000 type vxlan id 20000 local 10.0.0.21 dstport 4789 nolearning

# B. Criar a Bridge do Cliente 2
ip link add br_cl2 type bridge

# C. Associar à VRF do Cliente 2
ip link set br_cl2 master vrf_cl2

# D. Ligar o Túnel à Bridge
ip link set vxlan20000 master br_cl2

# E. Tratar da interface física
# Ligamos a interface física DIRETA à bridge (sem sub-interfaces)
ip link set eth1 master br_cl2

# F. Ligar tudo
ip link set vxlan20000 up
ip link set br_cl2 up
ip link set eth1 up
```

## Configuração do BGP EVPN para anunciar e aprender remote VXLAN tunnel endpoints addresses

### Spine

```bash
conf t
router bgp 22900
 bgp router-id 10.0.0.11
 no bgp default ipv4-unicast

 ! 1. Criar um grupo para os clientes EVPN (Leafs)
 neighbor EVPN peer-group
 neighbor EVPN remote-as 22900
 neighbor EVPN update-source 10.0.0.11 ! A Loopback do Spine

 ! 2. Adicionar os Leafs a esse grupo
 neighbor 10.0.0.21 peer-group EVPN
 neighbor 10.0.0.22 peer-group EVPN
 neighbor 10.0.0.23 peer-group EVPN

 ! 3. Adicionar o Spine do Porto como vizinho
 neighbor 10.0.0.12 remote-as 22900
 neighbor 10.0.0.12 update-source lo


 ! 4. Configurar a família EVPN
 address-family l2vpn evpn
  ! Ativar o grupo
  neighbor EVPN activate
  ! Definir o grupo como cliente do Route Reflector
  neighbor EVPN route-reflector-client
  ! Anunciar todas as VNIs (caso o Spine tivesse alguma, o que não é o caso, mas é boa prática)
  advertise-all-vni
  ! Ativar a troca de rotas EVPN com o Porto
  neighbor 10.0.0.12 activate
  ! Garantir que o S1 não se põe no meio do caminho de dados (o túnel deve ser Leaf-Leaf)
  neighbor 10.0.0.12 next-hop-unchanged
 exit-address-family
exit
```

### Leaf

```bash
conf t
router bgp 22900
 bgp router-id 10.0.0.21
 no bgp default ipv4-unicast

 ! O Leaf não precisa de grupos, pois só fala com o Spine
 neighbor 10.0.0.11 remote-as 22900
 neighbor 10.0.0.11 update-source 10.0.0.21 ! A Loopback do Leaf

 address-family l2vpn evpn
  neighbor 10.0.0.11 activate
  ! O comando mágico que injeta as VNIs do Linux no BGP
  advertise-all-vni
 exit-address-family
exit
```
