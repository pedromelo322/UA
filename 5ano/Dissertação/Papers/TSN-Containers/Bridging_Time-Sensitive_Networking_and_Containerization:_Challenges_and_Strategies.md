# Bringing Time-Sensitive Networking and Containerization Together: Challenges and Strategies

## Problema

Aplicações com requisitos apertados de latência e jitter precisam de determinismo na rede. O TSN oferece-o em Ethernet, mas quase não foi estudado em ambientes containerizados, onde a investigação se concentra na otimização de recursos e na orquestração.

## Desafios identificados nos containers

- **Funcionalidades de hardware ocultas**: o LaunchTime das NICs Intel I210 (driver igb) e o timestamping por hardware dependem de acesso à interface física, que a abstração de rede do container esconde.
- **Sincronização de tempo**: não é problema, porque os containers partilham o relógio do host, sincronizado por gPTP.
- **Conflitos de escalonamento**: várias aplicações a configurar o mesmo TAS/GCL podem bloquear-se mutuamente. Os autores propõem uma entidade central de gestão de fluxos.
- **Redes Docker**: a latência aumenta com a complexidade do driver (host < ipvlan < macvlan < bridge < overlay). O modo host é necessário para configurar a NIC, mas expõe a aplicação à rede do host e levanta questões de segurança e escalabilidade.

## Tipos de Deployment

! [Tipos de deployment](images/deployment.png)

Os autores propõem três tipos de deployment, com diferentes níveis de abstração e isolamento:

1. Tudo na rede bridge por defeito: as aplicações BE e a aplicação TSN partilham a mesma bridge Docker. Como os containers ficam isolados da rede do host, a aplicação TSN não consegue aplicar as regras de Traffic Control (TC) na porta Ethernet física, e acaba em conflito com o tráfego das outras aplicações.

2. Redes mistas: as aplicações BE ficam na rede bridge e a aplicação TSN usa a rede host. Assim a TSN acede à NIC do host e faz as configurações necessárias (shapers, LaunchTime). O custo é expor a aplicação à rede do host, com riscos de segurança, e deixar em aberto o efeito de outros tipos de rede e a escalabilidade.

3. Conflito entre containers: duas aplicações TSN, ambas em modo host, precisam de configurar a mesma NIC. Por estarem isoladas, podem surgir dois problemas: os escalonamentos de transmissão (ST) das duas serem incompatíveis, ou não haver recursos físicos suficientes para ambas. Em qualquer caso não podem correr no mesmo nó e o desempenho degrada-se. Isto motiva a proposta de uma entidade central que gira os fluxos e evite colocar containers em nós sem recursos adequados.

Para os testes foi usada a opção 2.

## Setup experimental

Dois APUs (talker e listener) ligados por três switches TSN, com um terceiro APU a gerar tráfego best-effort real (TRex, captura da smart city de Aveiro). Usaram Debian 11, kernel PREEMPT_RT, LinuxPTP e modo de rede host. Testaram três configurações: sem nada, só com shaper, e shaper mais LaunchTime. Fizeram-no com dois shapers:

1. TAS, com um sensor crítico e ciclos de 1 ms.
2. CBS, com vídeo a 8000 pkt/s, o que dá um idleSlope de 80 Mb/s (~8% do link).

## Resultados principais

### TAS

- *Só com o shaper*, o intervalo de transmissão passa a ser respeitado, e o container chega a ter desvio-padrão inferior ao nativo (0,08–0,10 ms contra 0,21–0,27 ms).
- *Com shaper e LaunchTime*, o resultado é quase perfeito. No nativo, o desvio-padrão desce para 0,003–0,005 ms e o P99 é de 0,501 ms (redução de ~42× face ao shaper sozinho). No container o desvio-padrão fica abaixo de 0,2 ms, com cerca de 0,1% de perdas, ligeiramente pior.
- *Sem qualquer mecanismo*, o container degrada muito: desvio-padrão 7,4× maior, P99 2,5× maior e perdas de 0,01% para 7,77%.

### CBS

- *Sem shaper*, o débito fica em ~6420 pkt/s e o alvo de 8000 não é atingido. 
- *Com CBS*, chega-se a ~8000 pkt/s com variação mínima, tanto nativo como em container. 
- O *LaunchTime* traz pouco aqui, porque é útil para temporização precisa de pacotes e não para débito estável.

## Resumo

Propoem estratégias para integrar TSN e containers, com foco em:
Em que o tráfego BE vai para a rede bridge e o tráfego TSN para a rede host, permitindo que a aplicação TSN configure a NIC do host.
Para resolver problemas de conflito entre containers com tráfego TSN, propõem uma entidade central de gestão de fluxos que evite colocar containers em nós sem recursos adequados.
Fez testes com TAS e CBS, mostrando que o container pode ter desempenho quase idêntico ao nativo, desde que se usem shapers e LaunchTime. Sem eles, o desempenho degrada-se muito.
