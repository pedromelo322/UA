# IC - Trabalho Laboratorial nº 2 (2025/26)

Este repositório contém o desenvolvimento do segundo trabalho laboratorial da unidade curricular de Informação e Codificação (IC) da Universidade de Aveiro. O projeto foca-se na manipulação de imagens com OpenCV e na implementação de codecs *lossless* de áudio e imagem usando Codificação Golomb.

**Grupo:**
* Pedro Miguel Miranda de Melo  (114208)
* Rúben Cardeal Costa           (114190)
* Hugo Marques Dias             (114142)

---

## Estrutura do Repositório

O projeto está organizado da seguinte forma:

```text
.
├── .gitignore          \# Ficheiros ignorados pelo Git
├── Makefile            \# Automatiza a compilação do código C++
├── README.md           \# Este ficheiro
├── bin/                \# Diretoria para os executáveis compilados
├── doc/                \# Documentação do projeto
│   ├── relatorio/      \# Ficheiros relativos ao relatório LaTeX
│   │   ├── build/      \# Ficheiros auxiliares e PDF gerado pelo LaTeX
│   │   ├── imagens/    \# Imagens usadas no relatório
│   │   └── relatorio.tex \# Código fonte do relatório
│   └── trab2.pdf       \# Enunciado do trabalho
├── img/                \# Imagens de entrada fornecidas
├── out/                \# Diretoria para as imagens de saída geradas (ignorada pelo git)
└── src/                \# Código fonte C++ (.cpp, .h)

```

* **`src/`**: Contém todo o código-fonte C++.
* **`bin/`**: Os programas executáveis são gerados aqui após a compilação. Esta pasta é criada automaticamente pelo `Makefile`.
* **`img/`**: Contém as imagens de teste fornecidas no enunciado.
* **`out/`**: É onde os programas guardam as imagens resultantes por omissão. Esta pasta pode ser criada manualmente ou pelos próprios programas.
* **`doc/`**: Contém o enunciado (`trab2.pdf`) e os ficheiros relacionados com o relatório LaTeX.
    * **`doc/relatorio/`**: Subdiretoria específica para o relatório.
        * **`doc/relatorio/imagens/`**: Imagens utilizadas no relatório (gráficos, exemplos visuais).
        * **`doc/relatorio/build/`**: Ficheiros temporários (`.aux`, `.log`, `.toc`) e o PDF final (`relatorio.pdf`) gerados pela compilação do LaTeX.

---

## Dependências

Para compilar e executar este projeto, necessita de:

1.  **Compilador C++:** Um compilador moderno que suporte C++17 (e.g., `g++` ou `clang++`).
2.  **Make:** A ferramenta `make` para utilizar o `Makefile`.
3.  **OpenCV (Versão 4.x):** A biblioteca principal para processamento de imagem. São necessárias as bibliotecas de desenvolvimento (`-dev` ou `devel`) e as de execução (`runtime`).
4.  **pkg-config:** Ferramenta auxiliar para encontrar as flags de compilação do OpenCV.
5.  **(Opcional) LaTeX:** Uma distribuição LaTeX (como TeX Live) para compilar o relatório (`relatorio.tex`).

**Instalação em Debian/Ubuntu:**

```bash
sudo apt update
sudo apt install build-essential make pkg-config libopencv-dev texlive-full
```

## Compilação do Código C++

A compilação dos programas C++ é gerida pelo Makefile fornecido.

1. Navegue até à raiz do repositório no terminal.
2. Execute o comando `make`:

```bash
make
```

Isto compilará todos os ficheiros `.cpp` encontrados na pasta `src/` e colocará os executáveis correspondentes na pasta `bin/`.

Para limpar os ficheiros compilados, execute:

```bash
make clean
```

## Compilação do Relatório LaTeX

O relatório (`relatorio.tex`) encontra-se na pasta `doc/relatorio/`. Para compilar o PDF:

1. Navegue até à pasta do relatório:

```bash
cd doc/relatorio
```

2. Execute o `pdflatex` (pode precisar de executar duas vezes para que as referências e o índice fiquem corretos), direcionando os ficheiros auxiliares e o PDF final para a subpasta `build/`:

```bash
pdflatex -output-directory=build -aux-directory=build -jobname=relatorio relatorio.tex & mv build/relatorio.pdf relatorio.pdf
```

O ficheiro PDF final (`relatorio.pdf`) estará disponível em `doc/relatorio/build/`.

## Execução dos Programas

Os executáveis encontram-se na pasta `bin/`. Execute-os a partir da raiz do projeto.

### Exemplos:

**Extrair Canal Vermelho (2):**

```bash
./bin/extract_channel img/airplane.ppm out/airplane_red.png 2
```

**Criar Negativo:**

```bash
./bin/image_negative img/lena.ppm out/lena_negative.png view
```

**Espelhar Horizontalmente:**

```bash
./bin/image_mirror img/peppers.ppm out/peppers_mirror_h.png h view
```

**Rodar -90 Graus:**

```bash
./bin/image_rotate img/boat.ppm out/boat_rotated_m90.png -90
```

**Aumentar Brilho em 30%:**

```bash
./bin/image_intensity img/tulips.ppm out/tulips_brighter_30.png 30
```

**Testar Golomb**
```bash
./bin/test_golomb
```

**Encoder e decoder de audio**
```bash
./bin/audio_encoder wav/sample.wav wav_out/compressed.bin
./bin/audio_decoder wav_out/compressed.bin wav_out/output.wav
```

**Encoder e decoder de imagens**
```bash
./bin/image_encoder img/airplane.ppm out/compressed.gold
./bin/image_decoder out/compressed.gold out/decompressed.ppm
```