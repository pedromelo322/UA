# DIFFSERV no cliente2:

```bash
#1. Classificar tráfego VXLAN do Cliente 2
access-list 102 permit udp any any eq 4789

class-map match-all CLIENTE2_AF
 match access-group 102

# 2. Definir a Política (Garantir 10Mbps)
policy-map QOS_POLICY
 class CLIENTE2_AF
  bandwidth 10000
  # Opcional: Marcar DSCP para que os Cores saibam tratar o pacote
  set ip dscp af31 
 class class-default
  fair-queue

# 3. Aplicar na interface de SAÍDA para o Core
interface FastEthernet0/0
 service-policy output QOS_POLICY

 ```