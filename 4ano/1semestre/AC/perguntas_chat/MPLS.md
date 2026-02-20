I. Fundamentos e Engenharia de Tráfego (TE)

    Qual é a principal limitação dos protocolos de roteamento IGP (como OSPF/IS-IS) que motiva o uso de Engenharia de Tráfego? (Dica: Caminho mais curto vs. Congestionamento).

    O que é a Engenharia de Tráfego (TE) e como se distingue do "Network Engineering" tradicional?

    Onde é inserido o cabeçalho MPLS (Shim Header) no pacote? (Entre L2 e L3).

    Quais são os 4 campos do cabeçalho MPLS e para que servem (Label, EXP/TC, S, TTL)?

    Para que serve o bit S (Bottom of Stack)?

    Como é que o MPLS processa o TTL? Ele é independente do TTL do IP?

II. Mecânica do MPLS (Data Plane)

    O que é uma FEC (Forwarding Equivalence Class)?

    Qual a diferença entre um LER (Label Edge Router) e um LSR (Label Switch Router)?

    Explique as três operações básicas de etiquetas: PUSH, SWAP e POP. Onde ocorre cada uma?

    O que é um LSP (Label Switched Path)? É bidirecional ou unidirecional?

    O que é o PHP (Penultimate Hop Popping) e qual a sua grande vantagem para o router de saída (Egress LER)?

    No mecanismo de LSP Merge, o que acontece às etiquetas de fluxos diferentes que vão para o mesmo destino?

    O que é o Label Stacking (Empilhamento de Etiquetas) e em que cenários é essencial (ex: VPNs, TE)?

III. Protocolos de Distribuição de Etiquetas (Control Plane)

    Qual é a diferença fundamental entre "Unconstrained Routing" e "Constrained Routing" na distribuição de etiquetas?

    O protocolo LDP (Label Distribution Protocol) segue que métrica para criar os LSPs? (IGP Shortest Path).

    O protocolo RSVP-TE adiciona que funcionalidades ao RSVP original? (Dica: Distribuição de labels e reserva de largura de banda).

    Numa arquitetura moderna, qual é a escolha padrão para criar túneis de Engenharia de Tráfego: LDP ou RSVP-TE?

    O que aconteceu ao protocolo CR-LDP?

    Como é que o OSPF-TE difere do OSPF normal? (Uso de Opaque LSAs Tipo 10).

    Que informações adicionais transportam os TLVs do OSPF-TE? (Largura de banda máxima, reservável, etc.).

IV. MPLS Layer 3 VPNs (Tópico Crítico)

    Numa MPLS L3 VPN, o router do núcleo (P Router) precisa de conhecer as rotas dos clientes (VPNs)? Porquê?

    Defina VRF (Virtual Routing and Forwarding). O que contém?

    Qual a diferença entre a tabela de roteamento Global e a tabela VRF num router PE?

    O que é o RD (Route Distinguisher) e porque é necessário? (Transformar IPv4 em VPNv4 único).

    O RD ajuda a decidir para que VRF vai uma rota? (Não, apenas garante unicidade).

    O que é o RT (Route Target) e como difere do RD? (Controlo de importação/exportação de rotas e topologia da VPN).

    Qual é o papel do MP-BGP (Multi-Protocol BGP) nas MPLS VPNs?

    Numa MPLS VPN, o pacote de dados transporta quantas etiquetas? Qual a função de cada uma?

        Etiqueta de Topo (Outer): Transporte (IGP/RSVP/LDP) até ao Egress PE.

        Etiqueta de Fundo (Inner): Identificação da VPN/VRF no Egress PE.

    Como é que o router de entrada (Ingress PE) sabe qual a etiqueta interna a usar? (Via MP-BGP).

    Como é que o router de entrada sabe qual a etiqueta externa a usar? (Via LDP ou RSVP-TE para o Loopback do Egress PE).

V. Integração e Cenários

    Se um router CE (Customer Edge) usa OSPF para falar com o PE, esse OSPF mistura-se com o OSPF do núcleo da operadora?

    O que significa o conceito de "BGP-free core"?

    Numa arquitetura MPLS VPN, os pacotes entre dois clientes de VPNs diferentes podem cruzar-se?

    Como é evitado o loop de roteamento quando se usa BGP como protocolo de transporte de VPNs?

    É possível ter endereços IP privados iguais (overlapping) em clientes diferentes numa rede MPLS? Qual o mecanismo que permite isso? (RD + VRF).
