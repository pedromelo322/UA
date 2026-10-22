# Orchestrating Mixed-Criticality Cloud Workloads in Reconfigurable Manufacturing Systems

## Problema

A Indústria 4.0 está a levar tecnologias de cloud e virtualização para o chão de fábrica, permitindo Sistemas de Manufatura Reconfiguráveis (RMS). Nestes sistemas, PLCs virtuais, sistemas SCADA e interfaces de gestão podem correr lado a lado no mesmo hardware, rompendo a hierarquia rígida da pirâmide CIM. Isto cria um cenário de mixed-criticality: cargas com requisitos de tempo real e de segurança muito diferentes a partilhar recursos. Orquestradores como o Kubernetes não têm noção de criticidade das cargas nem do nível de garantia (assurance) que cada nó oferece.

## Proposta

Os autores estendem o seu trabalho anterior (K4.0s) com um modelo de escalonamento e um algoritmo para colocar cargas de criticidade mista em nós com diferentes níveis de garantia:

- **Nós** são caracterizados pelos recursos (CPU, disco, memória), pela capacidade de tempo real e por um nível de garantia entre 0 e 1, que depende do hardware, do software e da carga atual (quanto mais carregado, menor a garantia).
- **Jobs** têm recursos mínimos e máximos, requisito de tempo real e um nível de criticidade (NENHUMA, BAIXA, ALTA). Há limiares mínimos de garantia que um nó tem de manter para continuar a alojar jobs críticos.

O escalonamento é formulado como um problema multiobjetivo, com uma soma ponderada de três objetivos:

1. **Taxa de aceitação** – fração de jobs efetivamente atribuídos.
2. **Garantia média dos nós de tempo real** – evita degradar nós já carregados e preserva espaço para jobs críticos futuros.
3. **Capacidade residual (ao quadrado)** – concentra a carga em alguns nós, deixando outros livres para jobs pesados, à semelhança da estratégia MostAllocated do Kubernetes.

Como a taxa de aceitação cresce cada vez menos com cada job aceite, o algoritmo acabaria por rejeitar jobs; por isso, a função objetivo final é a soma ponderada multiplicada pela taxa de aceitação.

O algoritmo é guloso e do tipo what-if: para cada novo job, avalia a pontuação que se obteria em cada nó elegível e escolhe o melhor. Também suporta reescalonamento, movendo o par (nó, job) que mais melhore a pontuação global. Os filtros de elegibilidade do Kubernetes são estendidos com conformidade de garantia (nenhum job no nó pode ficar abaixo do seu limiar) e conformidade de tempo real (jobs de tempo real só em nós de tempo real).

## Resultados

Numa simulação (4–10 nós iniciais, 300–1000 jobs, com nós a entrar e jobs a terminar aleatoriamente), o K4.0s foi comparado com três configurações do Kubernetes: LeastAllocated, MostAllocated e RequestedToCapacityRatio. O K4.0s alcança maior garantia média para jobs críticos sem penalizar a taxa de aceitação face aos escalonadores padrão (pesos usados: 52,5 / 42,5 / 5).

## Resumo

Os autores propõem um algoritmo de escalonamento para cargas de criticidade mista, estendendo o k4.0s com um modelo de escalonamento multiobjetivo. O algoritmo é guloso e do tipo what-if, escolhendo o nó que maximiza a pontuação global para cada job. A simulação mostra que o K4.0s consegue maior garantia média para jobs críticos sem penalizar a taxa de aceitação face aos escalonadores padrão do Kubernetes.
