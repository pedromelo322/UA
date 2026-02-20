O **DSCP** (Differentiated Services Code Point) é um mecanismo usado em redes de computadores para classificar e gerenciar o tráfego de dados. Ele funciona como uma "etiqueta de prioridade" colocada no cabeçalho de cada pacote IP, permitindo que os roteadores saibam quais dados são urgentes e quais podem esperar.

Ele é a peça fundamental do **QoS** (Quality of Service) na Camada 3 (Rede) do modelo OSI.

Aqui está uma explicação detalhada de como ele funciona, do conceito básico aos detalhes técnicos.

---

### 1. A Analogia do Aeroporto

Imagine um aeroporto movimentado (o roteador) com várias filas de segurança:

* **Fila VIP/Diplomata:** Ninguém para aqui, passa direto. (Voz/Vídeo em tempo real)
* **Fila Prioritária (Executiva):** Tem prioridade, mas se lotar, algumas pessoas podem ser movidas para a fila comum. (Sistemas críticos de empresas)
* **Fila Econômica:** A maioria das pessoas. Esperam a vez e, se o aeroporto estiver lotado demais, podem sofrer atrasos. (Navegação Web, YouTube)

O **DSCP** é o carimbo no cartão de embarque que diz ao segurança em qual fila o passageiro (pacote de dados) deve entrar.

---

### 2. Onde ele fica? (O Cabeçalho IP)

Tecnicamente, o DSCP utiliza o campo **DS (Differentiated Services)** dentro do cabeçalho do pacote IP (IPv4 ou IPv6).

* Antigamente, esse campo era chamado de *ToS (Type of Service)*.
* O DSCP usa **6 bits** desse campo, permitindo até **64 valores diferentes** (de 0 a 63).
* Os 2 bits restantes são usados para ECN (Notificação Explícita de Congestionamento).

---

### 3. As Classes de DSCP (Os Valores)

Embora existam 64 valores possíveis, a indústria padronizou os mais importantes para garantir compatibilidade. Eles são agrupados em comportamentos chamados **PHB** (Per-Hop Behavior):

#### A. Best Effort (BE) - O Padrão

* **Valor DSCP:** 0
* **Uso:** Internet comum, e-mail, navegação web.
* **Comportamento:** O roteador faz o melhor que pode, mas não garante nada. Se houver congestionamento, estes são os primeiros pacotes a serem descartados.

#### B. Expedited Forwarding (EF) - A Urgência Máxima

* **Valor DSCP:** 46 (binário `101110`)
* **Uso:** Voz sobre IP (VoIP), Vídeo em tempo real crítico.
* **Comportamento:** Exige baixa latência, baixo *jitter* (variação) e baixa perda. É colocado numa "fila expressa" que é esvaziada antes de qualquer outra.

#### C. Assured Forwarding (AF) - A Garantia Flexível

Esta é uma categoria mais complexa, usada para dados empresariais importantes. Ela divide o tráfego em **4 Classes** (prioridade) e **3 Níveis de Descarte** (probabilidade de ser jogado fora se a fila encher).

Pense nisso como uma tabela:

* **Classe 1 a 4:** A Classe 4 tem a maior prioridade de largura de banda.
* **Descarte (Low, Medium, High):** Se a rede engarrafar, pacotes com "High Drop" são sacrificados primeiro para salvar os "Low Drop".

|  | Baixa Prob. Descarte | Média Prob. Descarte | Alta Prob. Descarte |
| --- | --- | --- | --- |
| **Classe 4 (Maior Prio)** | **AF41** (34) | **AF42** (36) | **AF43** (38) |
| **Classe 3** | **AF31** (26) | **AF32** (28) | **AF33** (30) |
| **Classe 2** | **AF21** (18) | **AF22** (20) | **AF23** (22) |
| **Classe 1 (Menor Prio)** | **AF11** (10) | **AF12** (12) | **AF13** (14) |

#### D. Class Selector (CS)

* **Valores:** CS1 a CS7.
* **Uso:** Mantido para retrocompatibilidade com equipamentos muito antigos que ainda usam o padrão "IP Precedence". O CS6 e CS7 são geralmente usados para tráfego de rede (como protocolos de roteamento OSPF, BGP) para garantir que a rede em si não caia.

---

### 4. Como o processo funciona na prática?

O funcionamento do DSCP depende de três etapas na rede:

1. **Classificação e Marcação (Na borda):**
O telefone IP, o computador ou o primeiro switch da rede analisa o tráfego e "carimba" o pacote.
* *Exemplo:* O telefone IP marca o áudio da chamada como **EF (46)**.


2. **Confiança (Trust):**
Quando esse pacote chega no roteador principal, o roteador precisa decidir se "confia" nessa marcação.
* *Segurança:* Se o roteador não confiar (estado *untrusted*), ele apaga o DSCP e reescreve como 0 (Best Effort). Isso impede que um usuário mal-intencionado marque seus downloads de torrent como "Voz" para roubar banda.


3. **Enfileiramento (Queuing):**
Se o roteador confia na marcação, ele olha para o valor (ex: 46) e coloca o pacote na fila de prioridade alta, enviando-o antes dos e-mails que estão na fila comum.

### Resumo

O DSCP não "acelera" a internet magicamente. Ele é um sistema de gestão de escassez. Ele só entra em ação quando a rede está cheia (congestionada), garantindo que o tráfego inútil seja atrasado ou descartado para que o tráfego crítico passe livremente.

---

### Próximo passo

Gostaria de saber como configurar o DSCP em um equipamento específico (como um roteador Cisco ou um Switch) ou como verificar se os pacotes na sua rede estão sendo marcados corretamente?

... [Qual a diferença entre CoS, DSCP e QoS?](https://www.youtube.com/watch?v=6-KYwWYXKmI) ...

Este vídeo é relevante pois explica de forma didática, em português, a distinção entre as marcações de Camada 2 (CoS) e Camada 3 (DSCP), complementando o conceito de como a priorização ocorre na prática.
