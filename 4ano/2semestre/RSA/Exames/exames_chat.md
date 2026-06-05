Com base no conteúdo dos três PDFs fornecidos (Sistemas P2P/CDNs, Redes Ad-Hoc e Sistemas de Aprendizagem/Federated Learning) e seguindo a formatação e o estilo dos testes da Universidade de Aveiro que partilhaste, elaborei **6 propostas de testes diferentes**. 

Todas as perguntas exigem justificação e avaliam a compreensão profunda dos conceitos, tal como pedido.

---

### Teste de Modelo 1

**Universidade de Aveiro**
Mestrado em Engenharia de Computadores e Telemática
Teste de Redes e Sistemas Autónomos

Duração: 1:00 hora. Sem consulta. Justifique cuidadosamente todas as respostas.

___________________________________________________________________________________

1. Em redes Peer-to-Peer, existe o modelo "Pure P2P" e o modelo "Hybrid P2P". Classifique o protocolo BitTorrent e o Gnutella clássico nestas categorias e justifique as diferenças fundamentais nas suas arquiteturas de pesquisa. (2.5 valores)
   
   R: 
   
   - Pure p2p todos os peers da network são iguais 
   
   - Hybrid p2p existem peers que são responsáveis 

2. No contexto do IPFS, explique a utilidade do protocolo *Bitswap* e como o conceito de "debt ratio" (rácio de dívida) influencia a probabilidade de um nó enviar blocos de dados a outro. (2.5 valores)
   
   R:
   
   - BitSwap consiste em os 2 nós quee querem trocar dados tem ledges que contem o numero de pacotes recebidos e o numero de pacotes enviados
   
   - Quando um nó recebe mais pacotes do que envia o seu racio diminui para abaixo de 1, e a probabilidade de receber pacotes diminui

3. Na pesquisa de informação utilizando uma Distributed Hash Table (DHT) como o CHORD, explique por que motivo a utilização de uma *Finger Table* é crucial em comparação com uma simples pesquisa sequencial no anel de nós. (2.5 valores)
   
   R:
   
   - A finger trble permite uma pesquisa com complexidade log(n) enquanto uma pesquisa sequencial teria complexidade de n, isto aumenta muito mais a efeciencia da pesquisa

4. Em redes Ad-Hoc, o protocolo AODV utiliza *Sequence Numbers*. Qual é a importância deste mecanismo no momento de um nó intermédio decidir responder a um *Route Request (RREQ)*? (2.5 valores)
   
   R:
   
   - O Seq number no RREQ serve para ver o quão recente é a rota
   
   - Se um nó estiver uma rota com Seq maior que o do que está no RREQ pode enviar a sua rota, evitando o floading até á nó pretendido
   
   - Se um nó etiver um seq menor que o que está no RREQ continua o floading e depois atualiza a sua rota para a mais recente, porque a sua está desatualizada

5. No protocolo OLSR, o mecanismo de *Multipoint Relays (MPR)* é essencial. Explique detalhadamente como um nó seleciona os seus MPRs e que impacto isso tem na difusão (flooding) de pacotes de controlo na rede. (2.5 valores)
   
   R:
   
   - Um nó escolhe os seus MPRs com base no critetio de ser o seu vizinho direto que oferaça conectividade a mais nós diferentes a 2 saltos e tem de conseguir contectividade com vários nós.

6. Numa rede de drones (UAVs) com mobilidade extrema, a topologia altera-se muito rapidamente. Entre o AODV (reativo) e o OLSR (proativo), qual seria a escolha que geraria menos sobrecarga (*overhead*) constante na rede? Justifique. (2.5 valores)
   
   R: 
   
   - A melhor abordagem seria o AODV porque apesar de funcionar por flooding que cria sobrecarga na rede, é o melhor portocolo porque consegue reagir rápidamente ás mudanças rapidas na topologia.
   
   - Ao contrário do OLSR que estaria de estar constantemente a defenir novos MPRs o que acabaria por introduzir muita latencia na comunicação

7. Na aprendizagem de máquina (*Machine Learning*), explique a diferença entre Aprendizagem Supervisionada e Aprendizagem por Reforço (*Reinforcement Learning*), dando um exemplo de aplicação desta última num contexto autónomo. (2.5 valores)
   
   R:
   
   - Aprendizagem supervisionada é quando um modelo é treinado com um dataset já previamente labeled, ou seja extraiu as features do dataset e passo com modelo com a label, depois testo o modelo, com dados diferentes mas com label, para ver se o modelo está funcionar bem
   
   - Na por Reforço, não existe qualquer tipo de label, é testado em um amibnete simulado, em que o modelo funciona por um sistema de Rewards, que a reward corresponde á sua decisão em consideração qual deveria ter sido a decisão a tomar, e o objetivo é o modelo conseguir aprender as melhores deciões baseado nestas rewards
   
   - Um exemplo seria por exemplo traianr o modelo para fazer merge lain e recompensar o modelo consoante o que ele fizer

8. O algoritmo *FedAvg* é amplamente utilizado em *Federated Learning*. Explique como este algoritmo difere de um SGD (Stochastic Gradient Descent) federado clássico em termos de computação local vs overhead de comunicação. (2.5 valores)

---

### Teste de Modelo 2

**Universidade de Aveiro**
Mestrado em Engenharia de Computadores e Telemática
Teste de Redes e Sistemas Autónomos

Duração: 1:00 hora. Sem consulta. Justifique cuidadosamente todas as respostas.

___________________________________________________________________________________

1. O IPFS substitui o endereçamento por localização (como o HTTP) pelo endereçamento por conteúdo. Explique como é gerado o *Content ID (CID)* e como o sistema (via IPNS) lida com o facto de as *hashes* mudarem quando um ficheiro é alterado. (2.5 valores)
   
   R: 
   
   - O content ID é gerado a partir do hash do conteudo do ficheiro
   
   - Quando um ficheiro é alterado gera um novo cid ou seja é um ficheiro completamnete diferente do anterior, coexistindo os 2, o utilizador pode ir buscar a versão que quiser usando o hash dessa versão

2. No protocolo Gnutella, o mecanismo de *flooding* original de *Ping/Pong* e *Query* causava sérios problemas de escalabilidade. Explique de que forma a introdução de "Ultrapeers" resolveu parcialmente este problema. (2.5 valores)
   
   R:
   
   - O ultrapeers veio resolver esse porblema porque o floading é feito unicamente entre os ultrappers, e cada ultrapeer é responsavel pelo conteudo dos peers que ele é responsável

3. Defina o que é um ataque de *Polluting* e um ataque de *Poisoning* numa rede Peer-to-Peer. (2.5 valores)
   
   R:
   
   - Poisoning: Forncer ficheiros que dizem ser diferentes do que realmente são
   
   - Polluting: Inserir bad chunks em outra hora ficheiros válidos

4. No protocolo BATMAN, a informação da qualidade da ligação entre os nós é recolhida de forma implícita. Explique como o mecanismo de "Sliding Window" e a receção de *Originator Messages (OGMs)* permitem avaliar um caminho sem usar mensagens explícitas de estado de ligação. (2.5 valores)
   
   R:
   
   - O mecanismo de sliding window consiste em um nó manter uma window de por exemplo 8 pacotes e para cada nó na network ver quantos OGMs gegaram desse nó pelos seus vizinhos se para o nó A chegarem 8 paoctes do nó D por B, tem uma boa ligação, se pelo nó C chegarem 3 pacotes de D tem uma ligação com qualidade inferior á de por B.

5. O Location-Aided Routing (LAR) assume que os nós conhecem a sua localização física. Diferencie os conceitos de *Expected Zone* e *Request Zone*, e explique como a velocidade do nó afeta o tamanho destas zonas. (2.5 valores)
   
   R:
   
   - A EZ é onde o nó estima que o nó quer comunicar estara, dependendo da sua localização anteriormente conhecida e a sua velocidade
   
   - A Request zone é a zona que engloba o nó que está a mandar o pacote e a EZ e serve para os nós que estão na RZ dar flood aos pacotes até chegar ao nó destinado e o nós fora desta zona, não tem de levar com o floading

6. Considere a ocorrência de uma falha num *link* de comunicação num percurso ativo. Como atua o mecanismo de *Local RERR (Route Error)* no AODV para tentar recuperar a rota de forma localizada? (2.5 valores)
   
   R:
   
   - O nó manda um RREQ ao nó em que a ligação falhou para tenter formar uma nova ligação
   
   - Tambḿe manda uma mensagem RERR aos nós vizinhos que recentemente usaram aquela ligação para mandar dados

7. Explique de que forma a Aprendizagem Descentralizada (apenas na *edge*) se distingue da Aprendizagem Federada (*Federated Learning*), destacando as limitações da primeira no que toca à generalização do modelo. (2.5 valores)
   
   R: 
   
   - Os modelos não são capazes de genaralizar tão bem, por que só foram treinados com os seus dados, e não foram convergidos o que acontece é que os modelos vão ser muito bons no seu local mas vão ser maus em outros.

8. Num cenário de hospitais que pretendem treinar um modelo de IA médico em conjunto (ex: plataforma MedPerf), por que motivo o *Federated Learning* é a única abordagem viável face a um modelo 100% centralizado na *cloud*? Justifique. (2.5. valores)
   
   R:
   
   - O federated learning permite privacidade o que é crucial para um hospital, os daods não podem sair do local onde estão, então no federated learning como só são mando os gradientes, o que não permite obter nenhuma informação sobre os dados em si, mas permite obter um modelo generalizado

---

### Teste de Modelo 3

**Universidade de Aveiro**
Mestrado em Engenharia de Computadores e Telemática
Teste de Redes e Sistemas Autónomos

Duração: 1:00 hora. Sem consulta. Justifique cuidadosamente todas as respostas.

___________________________________________________________________________________

1. Qual a grande diferença na lógica de pesquisa estruturada (ex: DHTs/CHORD) versus não estruturada (ex: Flooding)? Justifique porque é que a abordagem híbrida é considerada o "melhor dos dois mundos" e para que serve cada vertente. (2.5 valores)
   
   R: 
   
   - A pesquisa estruturada é um protocolo que é usado para manter uma organização, e fazer pesquisa efeciente, mas é caro publicar documentos com muito grandes
   
   - O floading não é tão efeciente pois o floading causa muito overhead e se este floading for limitado pode não encontrar o resultado que se procura se este for raro
   
   - A hibrida é a melhor dos 2 mundos porque usamos flaoding para obter ficheiros populares, que em principio vão ser rápidos de encontra então o flaoding não se alastra muito e o DHT para encontrar ficheiros raros porque é garantido que os vai encontrar se eles existirem

2. No IPFS, quando a proporção de blocos duplicados excede um certo limite num nó local, entra em ação o "Split Factor". Explique como este mecanismo otimiza a rede quando há excesso ou falta de nós duplicados (duplicação de tráfego). (2.5 valores)
   
   R:
   
   - Quando o numero de duplicados é menor que 2 o split facor é aumentado ou seja o mesmo request é enviado para mais nós
   
   - Quando o numero de duplicados é maior que 4 o split factor é decrementado ou seja o mesmo request é enviado para menos nós

3. No protocolo BitTorrent, o *Tracker* tem um papel fundamental, no entanto, ficheiros não existem no servidor web. Explique onde estão alojados os conteúdos e o papel exato do *Tracker* numa arquitetura descentralizada. (2.5 valores)
   
   R: 
   
   - O utilizador obtem o ficheiro .torrent a partir por exemplo de um site onde este contem algums metadados sobre os dados em si que o utilizador quer e o url do tracker
   
   - O clinente torrent contacta o tracker para saber o ip dos dispositivos que tem o ficheiro que está á procura o tracker retorna estes dispositivos
   
   - E a conecção é feita diretamente entre o cliente torrent e estes dispositivos para obter o ficheiro

4. Nas redes Ad-Hoc, o BATMAN evoluiu na sua versão 5 para deixar de usar a perda de pacotes como métrica. Qual foi a nova métrica adotada e por que motivo a perda de pacotes deixou de ser considerada adequada para aferir a qualidade da ligação? (2.5 valores)
   
   R: 
   
   - A nova métrica que passou a ser usada é o throuput que é obtido perguntando diretmanete ao driver wifi que faz estes calculos periodicamente.
   
   - Esta métrica passou a ser usada porque é o que permite saber qual dos links realmente oferece uma melhor performance no envio de pacotes a nivel de velocidade.

5. Num cenário de recuperação de desastres (terramoto), justifique duas razões técnicas e operacionais pelas quais as Redes Ad-Hoc são muito superiores ao estabelecimento de infraestruturas celulares clássicas (3G/4G/5G). (2.5 valores)
   
   R:
   
   - As redes ad-hoc não precisa de infra estrutura previamente montada.
   
   - Ou seja é perfeito para sitios de catastrofe onde por algum motivo esta infraestrutura está em baixo

6. O OLSR é um protocolo *Table-Driven*. Explique o processo pelo qual um nó descobre quem são os seus vizinhos a 2 saltos (2-hop neighbors), permitindo-lhe a construção posterior dos *Multipoint Relays*. (2.5 valores)
   
   R:
   
   - Troca de Hello messages entre todos os peers da network, estes pacotes hello permite descobrir quais são os seus peers a um salto para defenir os MPRs para conectar os peers a 2 saltos de deistancia

7. Nos algoritmos de agregação de Federated Learning, explique o conceito de "Fault Tolerant Federated Average". Por que razão esta característica é fundamental num ambiente sem fios e móvel? (2.5 valores)
   
   R:
   
   - Esse algoritmo de agregação permite fazer a agregação mesmo que um nó não envio os seus dados caso algum erro tenha acontecido. o uqe é bom num ambiente de redes sem fios porque é propicia a perde de pacotes

8. "No *Federated Learning*, o servidor central pode iniciar dispositivos novos com inicializações personalizadas (*Tailored initialization*)". Explique este conceito e as suas vantagens face à imposição de um "super modelo" genérico desde o início. (2.5 valores)
   
   R:
   
   - O servidor pode inicar nós com modelos locais, já semelhantes ao cenário, onde ele se encontra o que vai forncer um modelo já previamente treinado em uma situação parcida, ou seja vai consegiir ter resultados bons logo á partida

---

### Teste de Modelo 4

**Universidade de Aveiro**
Mestrado em Engenharia de Computadores e Telemática
Teste de Redes e Sistemas Autónomos

Duração: 1:00 hora. Sem consulta. Justifique cuidadosamente todas as respostas.

___________________________________________________________________________________

1. "Simple peers" e "Rendez-vous peers" possuem funções operacionais distintas em topologias Peer-to-Peer. Descreva a limitação principal dos *simple peers* (frequentemente relacionada com *firewalls*) que justifica a existência dos nós *Rendez-vous*. (2.5 valores)
   
   R: 
   
   - Simple peers são noos normais na network que querem obter um ficheiro normlamente estes nós estão situados atras de firewall/NAT
   
   - O rendez-vous é responsavel por conseguir indicar a um simple peer em localização está o ficheiro que ele está á procura
   
   - O problema da firewall não está ligado ao rendez-vous mas sim ao relay que é responsavel por facilitar a troca de dados de nós que estão atras de firewalls

2. No protocolo IPFS, a replicação do mesmo conteúdo em múltiplos nós de forma organizada é gerida através de *Clusters*. Em caso de falha do nó líder do cluster, como funciona a eleição de um novo líder utilizando o algoritmo RAFT? (2.5 valores)
   
   R: 
   
   - Uso do Raft, quando um nó não recebe um heartbeat do lider durante o election_timeout, ele cria uma nova eleição candidatando-se como lider e com um term superior ao anterior, os nós na rede votam nele para se tornar lider e ele é o novo leader, se ele receber um heartbeat de uim lider com um term maior que o dele a sua eleição foi defeated

3. No protocolo de reencaminhamento AODV, como funciona a criação do percurso inverso (*Reverse Path*) durante a fase de propagação de um *Route Request (RREQ)*? O que acontece se o nó emissor do RREQ já tiver sido processado antes? (2.5 valores)
   
   R:
   
   - Um nó faz um RREQ para um outro nó, este é feito por floading na network, todos os nos porque passa este RREEQ criam um percurso inverso.
   
   - Na segunda não percebi bem, se o SEQ do RREQ for maior é encaminhado na mesma se for igual o pacote é ignorado

4. Redes de veículos autónomos na mesma faixa de rodagem pretendem partilhar informações de travagem com os carros imediatamente atrás. Justifique a utilização do AODV e as desvantagens da utilização de um protocolo proativo como o OLSR neste cenário hiper dinâmico. (2.5 valores)
   
   R: 
   
   - Como a topologia está sempre a mudar a escolha de um protocolo proativo não faz sentido, porque estaria de estar constantemente a montar a network, ou seja ia criar muito overhead na network, e ia ser lento o que é mau num cenário critico como o de travagem
   
   - Um reativo como o carro que a paragem vai afetar se encontra perto tem muito menor latencia o que evita que acidentes aconteçam

5. Para evitar grandes inundações (*flooding*) numa rede, o conceito de *k-Random Walkers* foi criado. Explique o seu funcionamento e contraste-o com a estratégia de *Expanding Ring* na procura de rotas/conteúdos. (2.5 valores)
   
   R:
   
   - k-RANDOM walkers, consiste em mandar um request para k nós com TTLs muito grandes em que estes k nós rencaminham o walker, o objetivo do walker é viajar a network sem criar muito congesstionamente, de vez em quando o walker vai ver com o nó originador se já encontrou o ficheiro que está á procura
   
   - O expanding ring funcioana bem para procurar ficheiros que estão perto, enquanto o k-random-walkers para ficheirso que podem estar longe

6. Na arquitetura das *Content Delivery Networks (CDNs)*, explique o funcionamento interligado da "Distribution Infrastructure" com a "Request Routing Infrastructure". (2.5 valores)
   
   R:
   
   - Distribution Infrasctucture responsavel por distribuir a cópia do website do servidor sentrar para os edge servers
   
   - Request Routing Ingrastrucute, responsavel por rederencionar o cliente para o edge server mais proximo que vai oferecer a melhor performance, ou pode DNS ou por Anycast

7. Ao agregar modelos de Machine Learning no contexto do Federated Learning, a abordagem *Q-Federated Average* altera os pesos (*weights*) da agregação. Qual é o objetivo desta re-ponderação e que problema de justiça (*fairness*) visa resolver? (2.5 valores)
   
   R:
   
   - Alguns nós podem ser treinados com menos dados que outros esta alteraçõa nos pesos permite que modelos que foram treinados com muitos dados não dominem completamente o modelo generalizado

8. Descreva um cenário industrial (Indústria 4.0/Manufatura inteligente) onde a manutenção preditiva com Inteligência Artificial beneficie largamente da adoção do paradigma de *Federated Learning*. (2.5 valores)
   
   R:
   
   - Pode haver vários setores, cada setores com um conjunto de maquinas diferentes, podemso usar federated learning em que cada setor treina o seu modelo, para prever quando as maquians precisam de manutenção e depois pode-se agregar num modelo generalizado para caso se for abrir um novo setor com um diferente tipo de máquinas

---

### Teste de Modelo 5

**Universidade de Aveiro**
Mestrado em Engenharia de Computadores e Telemática
Teste de Redes e Sistemas Autónomos

Duração: 1:00 hora. Sem consulta. Justifique cuidadosamente todas as respostas.

___________________________________________________________________________________

1. Em redes estruturadas DHT, caso um nó pretenda fazer uma pesquisa por nome baseada num *wildcard* (por exemplo: `search "ficheiro_*.mp3"`), que grandes constrangimentos matemáticos e operacionais o sistema DHT irá apresentar comparativamente ao Gnutella? (2.5 valores)
   
   R:
   - Na DHT uma minima mudança no nome gera um hash completamente diferentre que será alocado num sitio completamente diferente, e como o hash é irreversivel é impossivel saber que hashs dariam a wild card  ficheiro_*.mp3
   
   - No gnutella é enviado os paramentros na Query, ou seja o nó que recebe a query só tem de verificar se algum dos seus ficheiros pertence à wild card
2. O que dita a política "tit-for-tat" (toma-lá-dá-cá) utilizada pelo BitTorrent, e qual o problema clássico de arquiteturas *pure P2P* que esta resolve? (2.5 valores)
   
   R: 
   - Um nó preferer fazer download de ficheiros a nós que também lhe estão a fazer ou já fizeram upload, ignorando os nós qe só estão para obter ficheiros
   
   - Se um nó depois de fazer o download completo e se tornar uma seed e continaur a fazer upload do ficheiro vai subir na hierarquia do tit-for-tat
   
   - Isto resolve o problema de leaching do pure p2p, onde nós estão na network só para transferir ficheiros
3. Em IPFS, o que significa a ação de efetuar um *Object Pinning*, e por que razão é uma ação essencial para garantir a sobrevivência e disponibilidade de dados críticos no sistema? (2.5 valores)
   
   R:
   - Object pinning é quando um nó guarda um ficheiro no seu dispositivo para o manter disponivel na network
4. Numa rede OLSR, suponha que o nó A envia pacotes de controlo (estado da ligação) para os nós vizinhos B, C, D e E. Se apenas o nó C e E tiverem sido eleitos *Multipoint Relays* por A, o que farão os nós B e D ao receberem esse pacote? (2.5 valores)
   
   R:
   - Vão ter em conta o pacote que receberem mas não vão dar flood ao pacote
5. Em AODV, explique de que forma o *active_route_timeout* atua nas tabelas de encaminhamento de rotas diretas (Forward Path) e o que dita o expirar desse *timer*. (2.5 valores)
   
   R:
   - Active route timeout é o tempo em que uma rota é guardada na tabela sem enviar pacotes até ser apagada
   
   - Quando não foram enviados pacotes por uma rota durante esse timeout ela é apagada das tabelas de encaminhamneto
6. Comparando o cálculo de "Transmission Quality" (TQ) no protocolo BATMAN: O Nó A difunde uma OGM, o Nó B recebe e retransmite para o Nó C. Como o Nó C obtém a qualidade do link total até ao Nó A? (2.5 valores)
   
   R:
   - O calculo da TQ é feito sequencialmente ao longo dos nós ou seja a formula é TQi = TQi-1 x TQ_local, ou seja o nó, madna o pacote com o seu TQ, para o nó B TQ_a_b = TQ_a x TQ_local, e para o nó C TQ_a_b_c = TQ_a_b x TQ_local
7. No processo de Machine Learning "tradicional" na nuvem (Centralizado), o volume de largura de banda e a latência de comunicação são desafios. Usando o exemplo de subestações elétricas, quantifique (com base na teórica) a necessidade de passar o algoritmo para a extremidade (*Edge* / *Federated*). (2.5 valores)
   
   R:
8. Uma *Federated Learning Round* (FLR) compreende várias trocas entre os clientes e o servidor. Enumere os três passos fundamentais desde a inicialização do modelo global até ao retorno do novo modelo agregado. (2.5 valores)
   
   R:

---

### Teste de Modelo 6

**Universidade de Aveiro**
Mestrado em Engenharia de Computadores e Telemática
Teste de Redes e Sistemas Autónomos

Duração: 1:00 hora. Sem consulta. Justifique cuidadosamente todas as respostas.

___________________________________________________________________________________

1. Considere os objetivos de uma *Content Delivery Network (CDN)* (ex: reduzir latência). Relacione os mesmos com o paradigma Peer-to-Peer estruturado: qual a diferença na forma de garantir que o conteúdo está geograficamente perto de quem o pede? (2.5 valores)
   
   R:
   - Na CDN para encontrar  o conteudo mais perto é usado DNS ou Anycast, no entanto no P2P estruturado, nõa existe uma maneira concreta de encontrar o conteudo mais perto, o estruturado serve só para encontrar o conteudo de uma maneira rápida, não há gantias que este conteudo vai estar perto do utilizador
   
   - Isto porque as CDNs são geridas por uma entidade que colocam os surrogates servers em locais apropriados mesmo para esse fim.
   
   - Enquanto no P2P estruturao, não há uma entidade organizador, é self-organized
2. Como funciona a resolução de "quem tem a chave *k*" num sistema DHT como o CHORD utilizando a função "successor(k)"? Onde fica o ficheiro armazenado em contexto de chaves e identificadores de nó? (2.5 valores)
   
   R: 
   - k = Hash(nome do ficheiro), basicamente o que vai acontecer é que o primeiro nó na network com o NodeID=hash(IP), mairo ou igual ao k vai ficar responsavel por apontar para a localização dos ficheiros. 
3. Ao usar a rede IPFS, se alterar apenas um bit num ficheiro partilhado e tentar enviá-lo novamente, o sistema reconhece-o como o mesmo ficheiro atualizado ou como um ficheiro totalmente novo? Como funciona o Merkle DAG neste aspeto? Justifique. (2.5 valores)
   - É um ficheiro totalemtne novo, porque vai ter uma hash completamente nova, o ficheiro anterior não é alterado nem apagado continua disponivel na network para quem o quiser aceder pela hash
4. Em BATMAN, "a ausência e a presença de mensagens de controlo são utilizadas para indicar a qualidade do caminho". Justifique como uma partição na rede afeta os cálculos do protocolo (dê o exemplo da perda do caminho A -> C). (2.5 valores)
   
   R:
   - Em batman é usada a sliding windows das OGMS, ou seja o nó com mais pacotes recebidos de OGMS é considerado o melhor link.
   
   - Vamos supor um cenario com A recebe OGMs de D por B, recebe 5/8 OGMs, e o do nó D por C recebe 8/8 OGMs, o que vai acontecer se A->C falhar é que vai ter um atrasa de 4 OGMs para detetar que D por B está a 5/8 mas agr D por C está a 4 e é a pior ligação  
5. "Em AODV, nem todos os *Route Replies (RREP)* são gerados exclusivamente pelo Nó de Destino (Destination Node)". Que tipo de nós intermédios pode gerar um RREP e que condição estrita sobre o *Sequence Number* tem de se verificar para que o façam? (2.5 valores)
   
   R:
   - Os nós que conhecem uma Rota para o nó destino com um SEQ number maior que o que está no RREQ
   
   - Ou nós com um SEQ num er igual, mas com menos Hops
6. "Um nó num sistema Ad-Hoc não tem visão global da topologia, o que agrava os problemas de segurança." Dê dois exemplos de ameaças (ataques de Identidade, Negação de Serviço, etc.) facilitadas pela arquitetura Ad-Hoc sem um servidor central. (2.5 valores)
   
   R:
   
   
7. No que respeita à otimização federada (*Federated Optimization*), explique qual o propósito de utilizar otimizadores no lado do cliente (ADAGRAD, ADAM, etc.) combinados com otimizadores ao nível do servidor, no decorrer de múltiplas *epochs*. (2.5 valores)
8. Um enxame de robôs (*Swarm Robotics*) exige controlo para comportamentos coordenados e coletivos. Por que razão a fusão de *Deep Reinforcement Learning (DRL)* com *Federated Learning* (criando a arquitetura FL-DRL) é ideal em ambientes do mundo real onde as comunicações falham? (2.5 valores)
