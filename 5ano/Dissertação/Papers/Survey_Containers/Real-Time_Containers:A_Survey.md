# Real-Time Containers: A Survey

## Contexto e objetivo

A virtualização baseada em containers (Docker, LXC) tornou-se popular na cloud por ser leve: não precisa de hipervisor, tem desempenho quase nativo e implanta-se rapidamente. Os autores, da Universidade de Mälardalen, defendem que esta tecnologia interessa também a domínios industriais (automação, automóvel, aviação, robótica), onde permitiria consolidar hardware e correr aplicações de diferentes fornecedores e níveis de criticidade na mesma máquina. Estes domínios exigem, porém, comportamento de tempo real (cumprir prazos garantidos), algo que os containers ainda não suportam bem. O artigo é uma revisão sistemática da literatura sobre o tema.

## Metodologia

Pesquisaram artigos com revisão por pares publicados entre 2008 e 2019 no Scopus e no IEEE (um pouco desatualizado), complementados por snowballing. Dos cerca de 2 460 resultados iniciais ficaram 14 artigos. O estudo responde a três perguntas:

Porquê e em que contextos se usam containers de tempo real?
Que abordagens os tornam possíveis?
Que limitações impedem a sua adoção na indústria?

## Fundamentos técnicos

Um container é um conjunto de processos isolados através de namespaces e com recursos limitados por cgroups. Como o Linux padrão não dá garantias temporais, o determinismo tem de vir do kernel. As opções são o patch PREEMPT_RT, os co-kernels (RTAI, Xenomai) ou os escalonadores existentes (CFS, RT de prioridade fixa e EDF).

### As quatro abordagens identificadas:

- **Patch PREEMPT_RT** (a mais comum). Torna o kernel mais preemptível sem exigir APIs especiais. Os estudos mostram que funciona para PLCs com ciclos de 100 ms a 1 s, que o Docker praticamente não acrescenta overhead e que a escolha do kernel importa mais do que o container. Num caso de redes de acesso rádio por software, o patch reduziu a latência 13,9 vezes face ao kernel padrão.
- **Co-kernel (RTAI/Xenomai)**. Um micro-kernel de tempo real corre ao lado do Linux. Oferece menor latência e jitter, mas obriga a usar APIs próprias e escala mal em plataformas com muitos núcleos. Um dos trabalhos propõe ainda um sistema de mensagens de tempo real entre containers baseado em ZeroMQ.
- **Escalonamento hierárquico**. Cucinotta, Abeni et al. modificaram o kernel com dois níveis: EDF para escolher o container e prioridade fixa para escolher a tarefa dentro dele, com reserva de CPU por container. O caso de aplicação é a virtualização de funções de rede (NFV).
- **Métodos personalizados**. Um escalonador garante CPU aos containers de tempo real e redistribui a capacidade não usada pelos restantes. Outro trabalho (RT-CASEs) usa RTAI com módulos de monitorização que impõem políticas de proteção temporal, por exemplo suspender ou terminar tarefas que excedam o seu tempo.