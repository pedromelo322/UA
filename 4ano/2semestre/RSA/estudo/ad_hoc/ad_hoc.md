# Redes Ad-hoc

São redes sem infraestrutura, onde os dispositivos se comunicam diretamente entre si, sem a necessidade de um ponto de acesso central.

Essas redes são formadas dinamicamente e podem ser usadas em situações onde a infraestrutura tradicional não está disponível, como em áreas remotas ou durante desastres naturais. 
As redes ad-hoc são caracterizadas por sua flexibilidade e capacidade de auto-organização, permitindo que os dispositivos se conectem e se comuniquem de forma eficiente.
Os nós funcionam tanto como routers e termianis de comunicação, ou seja, eles podem encaminhar pacotes para outros nós na rede, além de enviar e receber dados.
Tem largura de banda limitada, energia limitada e baixa segurança fisica.

## Limitações das Redes Ad-hoc

### Limitações das redes wireless

- Falta de entidade centralizada para gerenciar a rede.
- Alcance limitado de comunicação devido à natureza sem fio.
- Perda de pacotes devido a erros de tranmissão.
- Desconcções frequentes devido à mobilidade dos nós.
- Largura de banda limitada.
- As comunicações são broadcast, o que pode levar a interferências e colisões de dados.

### Limitações da mobilidade

- topologias contantemente a mudarem, o que pode levar a rotas instáveis e perda de pacotes.
- falta de noção por parte do systema/aplicação sobre a mobilidade dos nós.

### Limitações do equipamento

- Bateria de curta duração.
- Capacidades limitadas.

## Vantagens das Redes Ad-hoc

- Não precisa de uma infraestrutura pré-existente, o que as torna ideais para situações de emergência ou em áreas remotas.
- Fácil de implementar e configurar, pois os dispositivos podem se conectar diretamente entre si.
- Auto-organização, permitindo que os dispositivos se conectem e se comuniquem de forma eficiente.
- Redes que requerem mobilidade.
  
## Desafios de Routing em Redes Ad-hoc

- Mobilidade - caminhos quebram-se, pacotes colidem, loops durante atualizações de rota.
- Restrições de largura de banda - canal partilhado por todos os nós, o que pode levar a congestionamento e perda de pacotes.
- Error-prone - Large BERs.

## Requesitos de Routing em Redes Ad-hoc

- Aquisição de uma rota deve ser rápida.
- Reconfiguração de rota deve ser rápida.
- Sem loops.
- Reduzir consumo de largura de banda.
- Minimizar pacotes de controlo (largura de banda e colisões).
- Escalavel.
- Fornecer QOS.
- Segurança e privacidade.

## Proactive protocols

- Mantêm rotas para todos os destinos, mesmo que não sejam necessários.
- Pouco ou nenhum diley para determinar uma rota.
- Consome largura de banda para manter as rotas.
- Mantém rotas que podem não ser usadas.

## Reactive protocols

- Determina uma rota apenas quando necessário, baixo consumo de largura de banda.
- Delay para determinar uma rota.
- Usa flooding para determinar uma rota (conseme muita largura de banda).
- Tráfego de controlo é baixo, mas pode ser alto durante a descoberta de rota.