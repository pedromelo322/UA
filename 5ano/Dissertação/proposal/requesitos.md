# Proposta

## CRD - Requisitos de Serviço

### Requesitos Temporais

- Periodo: De quanto em quanto tempo o serviço executa
- WCET: Tempo máximo de execução do serviço (Depende do nó). É conhecido à priori, com um valor por tipo de nó (ECU zonal e HPC). Os tipos de nó que não têm WCET no CRD são aqueles onde o serviço não pode correr.
- Deadline: Tempo máximo entre o serviço ser ativado e terminar (pode ser menor que o período)
- Tempo máximo de indisponibilidade: quanto tempo o serviço pode estar parado quando é recolocado (definido no CRD)

### Requisitos de Criticidade

- Nível de criticidade do serviço, com os níveis ASIL da ISO 26262 (QM, A, B, C, D), declarado diretamente no CRD de cada serviço (sem mapeamento por domínio).
- Regra: um serviço só pode depender de serviços com ASIL igual ou maior (ideia da ISO 26262: um elemento com ASIL alto não depende de um com ASIL mais baixo). Assim, uma expulsão nunca deixa sem dados um serviço mais crítico.

Uso: quando não há recursos para colocar um serviço, um serviço menos crítico pode ser expulso.

### Expulsão

- Só podem ser expulsos serviços **stateless** e **menos críticos** do que o serviço a colocar.
- O serviço expulso é **recolocado noutro nó**, se houver espaço. Se não houver, fica à espera de recursos.
- Os serviços que dependem do expulso **continuam a correr sem dados** até ele voltar.

Ordem de escolha (checklist):

1. Os de menor criticidade.
2. Destes, só os stateless.
3. Destes, preferir os que não têm ninguém dependente deles.
4. Se todos tiverem dependentes, escolher um deles (critério de desempate em aberto).

## Dependencias

O serviço declara no CRD do que precisa; o sistema sabe à priori o que cada nó tem (interfaces, sensores, aceleradores).

```text
D - Restrição Dura
F - Restrição Flexível
```

### Dependencias de serviço

- Interface de I/O (D)
- Proximidade a sensores/atuadores (F)
- Proximidade a outros serviços (F)

### Dependências de comunicação

Se o serviço x depende do serviço y, o y envia dados ao x. Para cada dependência, o CRD do x define:

- Serviço de que depende (D)
- Tamanho da mensagem / payload (D)
- Período da comunicação (D)
- Latência máxima (D)

O jitter máximo fica de fora por agora: com TAS deve ser pequeno, e basta a latência máxima (a confirmar com o colega da rede).

### Recursos

- Memória (D)
- Armazenamento (D)
- CPU RT (D)

### Plataforma

- SO de tempo real, ex.: PREEMPT_RT (D). Como no RT-Kube e no k4.0s, os nós sem SO RT ficam excluídos para serviços RT.
- Aceleradores, ex.: GPU (D). Como no k4.0s, cada nó tem uma lista de aceleradores; um serviço que precisa de um só pode ir para um nó que o tenha.

## Restrições do sistema

- **Mapa de I/O conhecido à priori:** que nó tem cada interface (ex.: CAN) e que sensores/atuadores estão em cada zona (ex.: como labels nos nós).
- **CPU RT:** cada nó dá todo o CPU a serviços RT.
- **Rede:** por agora, o lado do scheduler só precisa da topologia e de saber se a rede aceita um fluxo (verificado pelo colega da rede).

## Restrições do orquestrador

- Os serviços podem ser colocados **durante a condução** (atualizações OTA, falha de uma ECU), e não só no arranque do veículo. Por isso o tempo que o scheduler demora a decidir e a pôr o serviço a correr é um requisito.
- Quando um nó falha, os seus serviços são **recolocados automaticamente**. A fila de espera é ordenada por criticidade e, dentro do mesmo nível, por tempo de espera. Isto pode causar starvation dos menos críticos (fica para ver depois, por exemplo com aging).
- Se não houver espaço para recolocar um serviço dentro do seu tempo máximo de indisponibilidade, **expulsa-se logo um menos crítico** (segundo a checklist de expulsão).
- Por agora não há réplicas: um serviço só corre num nó de cada vez.
- Colocar um serviço novo **nunca pode pôr em risco os prazos dos que já estão a correr**, a não ser por expulsão. É isto que torna obrigatório um teste de admissão.
- Se um serviço depende de outro que ainda não está a correr, é colocado à mesma e **fica sem dados** até a dependência arrancar.
- Os serviços são colocados **um a um**, mesmo os que só fazem sentido juntos.

## Para pensar depois

- Colocar grupos de serviços que só fazem sentido juntos (ex.: a cadeia de perceção) **tudo ou nada**, como no FabOS, em vez de um a um.
- Evitar a starvation dos serviços menos críticos na fila de espera (ex.: aging).
- Critério de desempate no último passo da checklist de expulsão.
- Margem de CPU por nó para o SO e o Kubernetes (ex.: 1 − δ no REACT, 95% no RT-Kube), em vez de dar todo o CPU a serviços RT.

## Notas / perguntas para os orientadores

- Faz sentido um serviço crítico ter uma réplica já a correr noutro nó, pronta a assumir se o nó falhar?
- Há diferenças de SO entre os nós (ex.: uns com PREEMPT_RT e outros não)?
- Há aceleradores (GPU, NPU) em algum dos nós? Em quais?
