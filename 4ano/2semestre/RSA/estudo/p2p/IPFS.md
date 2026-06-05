# IPFS

IPFS é um protocolo P2P que cria uma rede de distribuição de conteúdo descentralizada. Os ficheiros são divididos em blocos, cada bloco identificado por um hash, armazenados em vários nós da rede e recuperados via DHT.

É **Pure P2P** e **Structured** (usa DHT para localização de conteúdo).  
Algoritmo: **Distributed Directory Model** via DHT.

---

## Como funciona

1. Ao ligar-se, é gerado um par de chaves → `NodeID = SHA256(chave_pública)`
2. O nó conecta-se aos **bootstrap nodes** (nós conhecidos e confiáveis, porta **4001** TCP/UDP), configurados em `$IPFS_PATH/config`
3. **Upload:** o ficheiro é dividido em blocos → hash de cada bloco → construção do **Merkle DAG** com um nó root → `CID = hash(nó root)` é o identificador do ficheiro
4. **Download:** usa o CID para consultar a DHT → encontra os nós com os blocos → descarrega e valida os hashes → reconstrói o ficheiro

---

## CID e IPNS

- **CID (Content ID):** hash SHA-256 único de cada ficheiro/bloco. Se o conteúdo mudar, o CID muda.
- **IPNS (InterPlanetary Name System):** permite manter um link estável mesmo quando o conteúdo muda. O nome é o hash de uma chave pública, guardado na DHT, apontando sempre para o CID mais recente. *Desvantagem: resolução lenta (vários segundos).*

---

## Object Pinning e Publishing

- **Pinning:** um nó que queira garantir que um objeto persiste guarda-o no armazenamento local (caso contrário pode ser recolhido pelo garbage collector).
- **Publishing:** qualquer nó pode publicar um objeto adicionando a sua chave à DHT, tornando-o acessível a toda a rede.

---

## Bitswap

Protocolo de troca de blocos do IPFS. Cada nó tem:
- `want_list` — blocos que precisa
- `have_list` — blocos que possui

**Fluxo de descoberta de um bloco:**
1. Nó faz broadcast de **WANT** a todos os peers conectados
2. Se não houver resposta, consulta a **DHT** pelo root CID
3. Peers que respondem são adicionados à sessão; pedidos seguintes vão só para eles
4. Quando recebe o bloco, envia **CANCEL** a todos os peers conectados

### Debt Ratio

Controla a probabilidade de um nó enviar blocos a outro com base no histórico de trocas:

```
r = bytes_sent / (bytes_recv + 1)

P(send | r) = 1 - 1 / (1 + exp(6 - 3r))
```

| Situação | r | P(enviar) |
|---|---|---|
| Envia = Recebe | ~1 | 95.3% |
| Envia metade do que recebe | ~0.5 | 98.9% |
| Envia o dobro do que recebe | ~2 | 50% |
| Envia 10x o que recebe | ~10 | ≈ 0% |

A probabilidade cai drasticamente quando `r > 2` (nó envia muito mais do que recebe → está a ser explorado).

### Ciclo de vida de uma conexão Bitswap

1. **Open** — peers trocam ledgers até concordarem
2. **Sending** — trocam `want_lists` e blocos
3. **Close** — desativam a conexão
4. **Ignored** — peer ignorado por timeout se a estratégia evitar enviar

Os nós mantêm **ledgers** com o histórico de trocas. Se os ledgers não coincidirem ao abrir uma conexão, são reinicializados do zero (perde-se crédito/dívida acumulada).

---

## Split Factor

Quando um nó recebe um bloco, envia **CANCEL** a todos os peers — mas o cancel pode chegar tarde e gerar **duplicados**.

O nó monitoriza o rácio `duplicados / blocos recebidos` e ajusta o split factor (divisão dos peers em grupos):

- Rácio **> 4** (muitos duplicados) → **aumenta** split factor → envia o mesmo CID a **menos** peers
- Rácio **< 2** (poucos duplicados) → **diminui** split factor → envia o mesmo CID a **mais** peers

---

## Cluster

Permite replicar conteúdo por múltiplos nós IPFS, garantindo alta disponibilidade.

- Todos os peers partilham o mesmo **cluster_secret**; cada um tem ID único
- O peer que inicia o cluster torna-se o **líder**
- Qualquer peer pode adicionar, remover ou alterar conteúdo
- Se o líder cair, é eleito um novo via **RAFT**

### RAFT (eleição de líder)

1. Se um nó não recebe **heartbeat** do líder durante o **election timeout** (~3×100ms), torna-se **candidato**
2. Incrementa o termo, vota em si próprio e pede votos aos outros nós
3. Cada nó vota **uma vez por termo**, por ordem de chegada (first-come-first-served)
4. Se receber **maioria** → torna-se o novo líder
5. Se receber mensagem de outro nó com **termo maior** → desiste e torna-se follower
6. Se houver **split vote** → novo termo, nova eleição

---

## Vantagens

- Endereçamento por conteúdo — integridade garantida por design
- Deduplicação automática — blocos idênticos partilhados
- Versionamento via Merkle DAG — histórico imutável
- IPNS para endereços mutáveis e estáveis
- Conteúdo persiste enquanto houver um peer com pin

## Desvantagens

- Sem incentivo económico nativo — conteúdo pode desaparecer
- IPNS lento — resolução pode demorar vários segundos
- Complexidade elevada — DHT + Bitswap + DAG + IPNS
- Pesquisa só por CID exato — sem wildcards
- Sem pesquisa por conteúdo — tens de saber o CID
