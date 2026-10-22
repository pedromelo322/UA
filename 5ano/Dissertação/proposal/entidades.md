# Entidades da arquitetura

Base: `proposta.md` (requisitos e restrições do serviço, do sistema e do orquestrador). Aqui interessam as **entidades funcionais** (quem é responsável por quê), não o formato dos CRDs.

Estado: **8 entidades do orquestrador** (as 7 centrais mais o agente de nó), decididas com o Pedro (ver "Decisões" no fim). Há ainda duas **entidades externas** que entram na arquitetura mas não são parte do Pedro: o gestor da rede TSN e o Kubernetes.

## Visão geral

```text
         pedido (serviço novo / OTA)
                    │
                    ▼                          [9] Agentes de nó (ECU/HPC)
          [1] Registo de serviços                          │ heartbeats, reports
                    │                                      ▼
                    │                            [3] Monitorização
                    │                                      │ falha de nó
                    └──────────►[4] Fila de espera◄────────┘
                                       │
                                       ▼
   [2] Modelo do sistema ────►  [5] Decisor de colocação ◄──── [3] Monitorização
                                 5.1 Filtragem   5.3 Admissão
                                 5.2 Pontuação   5.4 Ligação
                                   │    │            │  ▲
                                   │    │            ▼  │
                                   │    │     [6] Gestor de expulsão
                                   │    │        (devolve vítimas à fila)
                                   │    ▼
                                   │  [7] Interface com a rede ◄──► [8] Gestor da rede TSN ──► switches
                                   │                                  (externa)
                                   ▼
                              Kubernetes (externa): bind do pod ao nó, kubelet arranca o container
```

## Entidades

### 1. Registo de serviços
- Recebe e guarda os requisitos que cada serviço declara (temporais, criticidade, dependências, recursos, plataforma).
- Valida-os (ex.: deadline ≤ período, há pelo menos um tipo de nó com WCET).
- Valida a regra de criticidade: um serviço só pode depender de serviços com ASIL igual ou maior (o ASIL é declarado pelo próprio serviço).
- Sabe se o serviço é stateless ou stateful.
- O CPU RT não é declarado: o decisor calcula-o como WCET / período, com o WCET do tipo de nó candidato.

### 2. Modelo do sistema
Uma entidade com duas funções separadas. Tudo o que tem é conhecido à priori e não muda durante a condução.

**2.1 Inventário de nós**
- Sabe o que cada nó **tem**: tipo (ECU zonal / HPC), zona, interfaces (ex.: CAN), SO RT, aceleradores, memória, armazenamento, CPU RT.

**2.2 Mapeamento da topologia**
- Sabe como a rede está ligada: switches, ligações, que nó está ligado a que switch e em que zona (reutiliza o `NetworkTopology` do Rodrigo).
- Sabe onde estão os sensores/atuadores (mapa de I/O).
- Responde a perguntas de **proximidade**: quantos saltos entre dois nós, ou entre um nó e um sensor. É o que alimenta as restrições flexíveis.

### 3. Monitorização
Uma entidade com duas funções separadas.

**3.1 Estado do sistema**
- Mantém o estado **vivo**: que nós estão vivos, que serviço corre em cada nó, utilização RT atual de cada nó (Σ C/P).
- É a fonte do estado que o decisor usa no teste de admissão.
- Regista o tempo desde o pedido até o serviço estar a correr (sabe-o pelo agente de nó). É um requisito do orquestrador.

**3.2 Deteção de falhas**
- Deteta a falha de um nó e põe os serviços dele na fila de espera, marcados como recolocação (com o tempo máximo de indisponibilidade a contar).
- Tem de detetar a falha bem mais depressa que o Kubernetes por omissão (~5 min), senão o tempo máximo de indisponibilidade não se cumpre.

### 4. Fila de espera
- Recebe pedidos de colocação: serviços novos, atualizações OTA, recolocações após falha, serviços expulsos.
- Ordena por criticidade e, dentro do mesmo nível, por tempo de espera.
- Entrega os serviços um a um ao decisor.

### 5. Decisor de colocação (scheduler)
Uma entidade com quatro funções separadas, aplicadas por esta ordem ao serviço à cabeça da fila.

**5.1 Filtragem (restrições duras)**
- Elimina os nós que não servem: sem WCET para o tipo de nó, sem SO RT, sem o acelerador, sem a interface de I/O, sem memória ou armazenamento.

**5.2 Pontuação (restrições flexíveis)**
- Ordena os nós que sobram pela proximidade a sensores/atuadores e a outros serviços, usando o mapeamento da topologia.

**5.3 Teste de admissão**
- Para cada candidato, pela ordem da pontuação, responde a "este serviço cabe neste nó **sem pôr em risco os prazos dos que já lá estão**?".
- Lado do nó: utilização RT / análise de escalonabilidade com os WCET desse tipo de nó.
- Lado da rede (só se o lado do nó passar): manda à rede, pela interface com a rede, **um só pedido**:
  - *apaga estes fluxos: [...]*: os fluxos inativos (de serviços expulsos, movidos ou de nós que falharam);
  - *este fluxo é possível: [...]*: os fluxos das dependências do serviço, para este nó.
- A rede verifica e, se for possível, **configura logo os switches** e só depois responde sim. Se responder não, nada fica configurado e passa-se ao candidato seguinte.
- O primeiro candidato com sim dos dois lados ganha, e nesse momento a rede já está pronta.

Se nenhum candidato passa: chama o gestor de expulsão (se for uma recolocação que vai perder o tempo máximo de indisponibilidade) ou deixa o serviço à espera na fila.

**5.4 Ligação**
- Corresponde à fase Bind do scheduler do Kubernetes: diz ao Kubernetes "este pod vai para este nó". A partir daí é o Kubernetes que faz o deployment real.
- Não fala com a rede: como o "sim" do 5.3 só chega com os switches já configurados, o serviço arranca sempre com a rede pronta (princípio do FabOS).

### 6. Gestor de expulsão
- Escolhe a vítima pela checklist do `proposta.md`: menos crítico, stateless, de preferência sem dependentes.
- Liberta o lugar e devolve o serviço expulso à fila de espera, para ser recolocado noutro nó.
- Graças à regra de ASIL das dependências, quem fica sem dados por causa de uma expulsão é sempre um serviço de ASIL igual ou menor que o expulso, nunca um mais crítico.

### 7. Interface com a rede
- Traduz cada dependência de comunicação do serviço num **pedido de fluxo**: nó do produtor, nó do consumidor, payload, período, latência máxima.
- Junta num só pedido os fluxos inativos a apagar e os fluxos novos a verificar, como no FabOS. A resposta é **sim ou não**; o orquestrador não sabe nem precisa de saber como a rede decide.
- Usada só pelo teste de admissão (5.3). É o único ponto do orquestrador que adiciona ou apaga fluxos na rede.

### 8. Gestor da rede TSN *(externa, fora do âmbito do Pedro: lado do colega da rede)*
Entra na arquitetura porque o teste de admissão depende dela, mas não é implementada nesta dissertação. Para o orquestrador é uma **caixa preta**, como o controlador de rede no FabOS: só fala com ela pela interface com a rede (7).

**Contrato com o orquestrador**

| Pergunta do orquestrador | Resposta da rede |
|---|---|
| Apaga estes fluxos: [...]. Este fluxo é possível: [...] (produtor, consumidor, payload, período, latência máx.) | **sim**: já configurado nos switches / **não**: nada configurado |

Os fluxos inativos são apagados sempre, mesmo que a resposta seja não, porque já não servem a ninguém.

**O que faz por dentro** (só para constar na arquitetura)
- Encaminhamento: encontra o caminho entre o nó do produtor e o do consumidor, a partir da topologia.
- Escalonamento TAS: tenta encaixar o payload, com o seu período, nas janelas do TAS de cada porta do caminho sem estragar os fluxos já admitidos, e verifica a latência máxima. Daqui sai o sim ou não.
- Configuração dos switches: escreve os `TsnApp` / `TsnFlow` do operador do Rodrigo (que hoje são escritos à mão) e o operador aplica as gate control lists por NETCONF/YANG.

Se o bind (5.4) falhar depois de a rede já estar configurada, os fluxos desse serviço passam a inativos e são apagados no pedido seguinte.

### 9. Agente de nó
Corre em cada ECU/HPC e reporta à monitorização (3). Três funções separadas:

**9.1 Heartbeat**
- Envia um sinal de vida curto e frequente. Quando os heartbeats param, a deteção de falhas (3.2) conclui que o nó falhou, muito mais depressa que os ~5 min do Kubernetes por omissão.

**9.2 Serviços no nó**
- Reporta que serviços estão de facto a correr no nó, para o estado do sistema (3.1) confirmar que o pod arrancou onde o decisor o ligou.

**9.3 Prazos falhados**
- Reporta quando um serviço passa do deadline. Serve para validar o teste de admissão e para as métricas da avaliação.

A utilização RT (Σ C/P) não vem do agente: a monitorização calcula-a a partir dos WCET declarados, como no REACT e no RT-Kube.

### Kubernetes *(externa)*
- Recebe o bind feito pela ligação (5.4) e faz o deployment real: o kubelet do nó puxa a imagem e arranca o container.
- O orquestrador não o reimplementa: estende o scheduler (Filter, Score, Bind) e usa o resto tal como está.

## Decisões

1. Inventário de nós e mapeamento da topologia são **uma só entidade** (modelo do sistema), com as duas funções separadas.
2. A deteção de falhas fica **dentro da monitorização**, como função separada do estado do sistema.
3. O teste de admissão fica **dentro do decisor de colocação**, como função separada da filtragem e da pontuação.
4. A parte da rede (encaminhamento, escalonamento TAS, configuração dos switches) entra na arquitetura como **entidade própria, fora do âmbito** do Pedro; o orquestrador só fala com ela pela interface com a rede.
5. A rede é uma **caixa preta, como no FabOS**: o orquestrador pergunta se um fluxo é possível e ela responde sim ou não.
6. Cada ECU/HPC tem um **agente de nó** que reporta à monitorização (heartbeat, serviços a correr, prazos falhados).
7. Não há executor próprio: quem faz o deployment real é o **Kubernetes** (entidade externa). O decisor ganha a função **5.4 Ligação** (Bind: atribui o pod ao nó), e o tempo até o serviço correr passa a ser medido pela monitorização.
8. A comunicação com a rede fica **só no teste de admissão (5.3)**, num único pedido: "apaga estes fluxos: [...]; este fluxo é possível: [...]". Se for possível, a rede configura logo os switches e só depois responde sim, por isso a ligação (5.4) já não fala com a rede. Os `TsnApp` / `TsnFlow` passam a ser escritos pelo lado da rede (8), não pela interface com a rede (7).
