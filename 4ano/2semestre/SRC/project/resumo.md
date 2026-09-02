#SRC RESUMO

## Estrutura

- FW7/FW8: Firewalls stateless, responsaveis pela seeparação da internet do coree
- FW1/FW2: Firewalls Statefull, responsaveis pela separação CORE-UPPER, CORE-LOWER, DMZ
- FW3/FW4: Firewalls Statefull, responsaveis pela sepração das vlans(individualmente) e do Core
- FW5/FW6: Firewalls Statefull, responsaveis pela separação do Datacenter e do Core.
- 

## Politica1 (Anti DDOS)

### Regras aplicadas na FW7/FW8:

Anti-Spoofing: Não deixa vir da internet IPs privados, loopback, broadcast ou IPS da DMZ
DDOS: Aplicação de RateLimiting, a regras com limite tem accept até um certo limite depois passa para a proxima regra que dropa os pacotes (TCP, UDP,ICMP)

## Politica2 (Acesso á Internet por TCP/UDP ports 80 e 443)

### Regras aplicadas na FW7/FW8:

Deixa passa de CORE->OUTSIDE e OUTSIDE->CORE tráfego TCP/UDP para as portas 80/443

### Regras aplicas na FW3/FW4:

Para cada VLAN->CORE deixa passar tráfego TCP/UDP para as portas 80/443
Do CORE->VLAN deixa só passar tráfego já estabelecido

### Regras aplicadas na FW1/FW2:

De LOWER->UPPER deixa passar tudo
De UPPER->LOWER deixa só passar o já estabelecido

## Politica3 (VLAN10 acess VOIP UDP 5060)

### Regras aplicadas na FW7/FW8:

Deixa passa de CORE->OUTSIDE e OUTSIDE->CORE tráfego UDP para as portas 5060

### Regras aplicas na FW3/FW4:

Para VLAN10->CORE deixa passar tráfego UDP para as portas 5060 - regra para cada ip
Do CORE->VLAN10 deixa só passar tráfego já estabelecido

### Regras aplicadas na FW1/FW2:

De LOWER->UPPER deixa passar tudo
De UPPER->LOWER deixa só passar o já estabelecido

## Politica4 (serviços do DMZ acessivel da Internet e do interior)

### Regras aplicadas na FW7/FW8:

Deixa passa de CORE->OUTSIDE e OUTSIDE->CORE tráfego com as caracteristicas do tráfego do DMZ

### Regras aplicas na FW3/FW4:

Das VLANs->CORE deixa passar tráfego com as caracteristicas do tráfego do DMZ
Do CORE->VLANs deixa só passar tráfego já estabelecido

### Regras aplicadas na FW1/FW2:

Deixa passa de UPPER->DMZ e LOWER->DMZ tráfego com as caracteristicas do tráfego do DMZ
De DMZ->LOWER e DMZ->UPPER só deixa passar tráfego já estabelecido

## Politica5 (storage e DNS só VLAN10 e VLAN20)

### Regras aplicas na FW3/FW4:

Para VLAN10->CORE e VLAN20->CORE deixa passar tráfego com as caracteristicas do tráfego de storage e DNS
Do CORE->VLAN10 e CORE->VLAN20 deixa só passar tráfego já estabelecido

### Regras aplicadas na FW5/FW6:

Deixa passar do CORE->DATACENTER tráfego quem vem das networks da VLAN10 e VLAN20 e com as caracteristicas do tráfego de storage e DNS

Do Datacenter para o Core deixa passar já estabelecidas

## Politica6 (Internal Databases só da VLAN20)

### Regras aplicas na FW3/FW4:

Para VLAN20->CORE deixa passar tráfego com as caracteristicas do tráfego de Internal Databases
Do CORE->VLAN20 deixa só passar tráfego já estabelecido

### Regras aplicadas na FW5/FW6:

Deixa passar do CORE->DATACENTER tráfego quem vem das networks da VLAN20 e com as caracteristicas do tráfego de Internal Databases

Do Datacenter para o Core deixa passar já estabelecidas

## Politica7 (1 Dispositivo na VLAN1 pode pingar tudo)

```text
Tenho de ver como é do de Gestão para a Internet
```

### Regras aplicas na FW7/FW8:

Do CORE->OUTSIDE deixa passar ICMPs do de Gestão

Do OUTSIDE->CODE deixa passar respostas de ICMPs para o de gestão

### Regras aplicas na FW1/FW2:

Do LOWER->DMZ deixa passar ICMPs e TCPs do de Gestão

Do DMZ->LOWER deixa passar ligações já estabelecidas

De LOWER->UPPER deixa passar tudo
De UPPER->LOWER deixa só passar o já estabelecido

### Regras aplicas na FW3/FW4:

Do VLAN1->CORE deixa passar ICMPs e TCPs do de Gestão

Do CORE->VLAN1 deixa passar ligações já estabelecidas

### Regras aplicadas na FW5/FW6:

Do CORE->DATACENTER deixa passar ICMPs e TCPs do de Gestão

Do DATACENTER->CORE deixa passar ligações já estabelecidas

## Politica8 (VLAN10 ↔ VLAN20 Samba TCP 139 e 445)

### Regras aplicas na FW3/FW4:

Do VLAN10 -> VLAN20, já estabelecido ou TCP 139 e TCP 445

Do VLAN20 -> VLAN10, já estabelecido ou TCP 139 e TCP 445
