# IC - Trabalho Laboratorial nº 3 (2025/26)

Este repositório contém o desenvolvimento do terceiro trabalho laboratorial da unidade curricular de Informação e Codificação (IC) da Universidade de Aveiro. O projeto foca-se na **compressão sem perdas (lossless) de pesos de Modelos de Linguagem de Grande Escala (LLMs)**, especificamente ficheiros no formato `.safetensors` com dados em BF16 (*Brain Floating Point 16*).

**Grupo:**
* Pedro Miguel Miranda de Melo  (114208)
* Rúben Cardeal Costa           (114190)
* Hugo Marques Dias             (114142)

---

## Descrição do Projeto

O codec desenvolvido implementa uma arquitetura **split-stream** que explora as propriedades estatísticas distintas dos bytes MSB (Most Significant Byte) e LSB (Least Significant Byte) do formato BF16:

- **Canal MSB** (expoente + sinal): Entropia de ~2.71 bits/byte → Compressão com Huffman ou Codificação Aritmética
- **Canal LSB** (mantissa): Entropia de ~7.96 bits/byte → Comportamento de ruído quase uniforme

### Modos de Operação

| Modo | MSB | LSB | Velocidade | Compressão |
|------|-----|-----|------------|------------|
| **FAST** | Huffman (LUT) | Raw (sem compressão) | Alta | ~1.49:1 |
| **BEST** | Aritmética | Aritmética (paralela) | Moderada | ~1.50:1 |

---

## Estrutura do Repositório

```text
.
├── .gitignore          # Ficheiros ignorados pelo Git
├── Makefile            # Automatiza a compilação do código C++
├── README.md           # Este ficheiro
├── plot_histogram.gnu  # Script Gnuplot para gerar histogramas
├── script.bash         # Script auxiliar de execução
├── test.bash           # Script de testes automatizados
├── bin/                # Executáveis compilados
├── build/              # Ficheiros intermediários de compilação
├── data/               # Dados de entrada (.safetensors)
│   ├── model.safetensors
│   ├── model_1.safetensors
│   ├── model_2.safetensors
│   ├── model_3.safetensors
│   └── model_4.safetensors
├── doc/                # Documentação do projeto
│   └── relatorio/      # Relatório LaTeX
│       ├── imagens/    # Imagens do relatório
│       ├── build/      # Ficheiros auxiliares LaTeX
│       └── relatorio.tex
├── logs/               # Logs dos testes
├── output/             # Resultados gerados
│   ├── header.json     # Cabeçalho extraído
│   ├── hist_lsb.csv    # Histograma LSB
│   ├── hist_msb.csv    # Histograma MSB
│   └── *.sc            # Ficheiros comprimidos
└── src/                # Código fonte C++
    ├── 01_extract_header.cpp
    ├── 02_calc_global.cpp
    ├── 03_analyze_split.cpp
    ├── encoder.cpp
    └── decoder.cpp
```

---

## Dependências

Para compilar e executar este projeto, necessita de:

1. **Compilador C++:** Suporte a C++17 (e.g., `g++` >= 7 ou `clang++`)
2. **Make:** Ferramenta de automação de compilação
3. **pthreads:** Biblioteca de threading (incluída na maioria dos sistemas Linux)
4. **(Opcional) Gnuplot:** Para gerar os gráficos de histogramas
5. **(Opcional) LaTeX:** Distribuição completa (TeX Live) para compilar o relatório

**Instalação em Debian/Ubuntu:**

```bash
sudo apt update
sudo apt install build-essential make gnuplot texlive-full
```

---

## Compilação do Código C++

A compilação é gerida pelo [Makefile](Makefile) fornecido.

1. Navegue até à raiz do repositório:

```bash
cd Project3
```

2. Execute o comando `make`:

```bash
make
```

Isto compilará todos os ficheiros `.cpp` de `src/` e colocará os executáveis em `bin/`.

Para limpar os ficheiros compilados:

```bash
make clean
```

---

## Compilação do Relatório LaTeX

O relatório encontra-se em `doc/relatorio/`.

1. Navegue até à pasta do relatório:

```bash
cd doc/relatorio
```

2. Compile com `pdflatex`:

```bash
mkdir -p build
pdflatex -output-directory=build relatorio.tex
pdflatex -output-directory=build relatorio.tex  # Segunda passagem para referências
mv build/relatorio.pdf .
```

O PDF final estará disponível em `doc/relatorio/relatorio.pdf`.

---

## Execução dos Programas

Os executáveis encontram-se em `bin/`. Execute-os a partir da raiz do projeto.

### Ferramentas de Análise

**1. Extrair Cabeçalho JSON:**

```bash
./bin/01_extract_header
```
Extrai o cabeçalho JSON de `data/model.safetensors` para `output/header.json`.

**2. Calcular Estatísticas Globais:**

```bash
./bin/02_calc_global
```
Calcula a entropia e estatísticas do ficheiro completo.

**3. Analisar Divisão MSB/LSB:**

```bash
./bin/03_analyze_split
```
Gera histogramas separados para MSB e LSB em `output/hist_msb.csv` e `output/hist_lsb.csv`.

**4. Gerar Gráficos:**

```bash
gnuplot plot_histogram.gnu
```

### Codec (Encoder/Decoder)

**Codificar (modo FAST):**

```bash
./bin/encoder data/model.safetensors output/model.sc fast
```

**Codificar (modo BEST):**

```bash
./bin/encoder data/model.safetensors output/model.sc best
```

**Descodificar:**

```bash
./bin/decoder output/model.sc output/model_restored.safetensors
```

### Script de Testes Automatizados

Para executar testes completos em todos os modelos:

```bash
chmod +x test.bash
./test.bash
```

Os logs são guardados em `logs/`.

---

## Resultados

| Modelo | Tamanho Original | Modo FAST | Modo BEST | Rácio |
|--------|------------------|-----------|-----------|-------|
| model.safetensors | 943 MB | 634 MB | 632 MB | 1.49:1 |
| model_1.safetensors | 420 MB | 281 MB | 280 MB | 1.50:1 |
| model_2.safetensors | 437 MB | 294 MB | 293 MB | 1.49:1 |
| model_3.safetensors | 681 MB | 460 MB | 458 MB | 1.49:1 |
| model_4.safetensors | 4.6 GB | 3.1 GB | 3.1 GB | 1.50:1 |

**Verificação de Integridade:** Todos os ficheiros restaurados passam verificação MD5 (100% lossless).

---

## Formato do Ficheiro Comprimido (.sc)

```
[Header Size: 8 bytes]
[Header JSON: variável]
[Mode Flag: 1 byte (0=FAST, 1=BEST)]
[Bloco 1]
  ├── sz_m: 4 bytes (tamanho pacote MSB)
  ├── sz_l: 4 bytes (tamanho pacote LSB)
  ├── Pacote MSB: sz_m bytes
  └── Pacote LSB: sz_l bytes
[Bloco 2]
...
[Bloco N]
```

---

## Referências

- **Formato SafeTensors:** [Hugging Face SafeTensors](https://huggingface.co/docs/safetensors)
- **Formato BF16:** [Brain Floating Point](https://en.wikipedia.org/wiki/Bfloat16_floating-point_format)
- **Modelo de Teste:** [Qwen2-0.5B](https://huggingface.co/Qwen/Qwen2-0.5B)

---

## Autores

* **Pedro Miguel Miranda de Melo** (114208)
* **Rúben Cardeal Costa** (114190)
* **Hugo Marques Dias** (114142)

Universidade de Aveiro — DETI — 2025/26