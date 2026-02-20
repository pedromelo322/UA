Perfeito! **O resultado está impecável.**

A imagem confirma que o teu circuito está a funcionar exatamente como esperado.

**Como ler a tua imagem (para o teu relatório):**

1.  **Igualdade dos Sinais:** Repara nas linhas `s_dst` (o teu resultado) e `s_expected` (o resultado correto calculado pelo testbench em C). Elas são **idênticas** ao longo de todo o tempo.
    *   Quando `s_expected` é `002C`, o teu `s_dst` é `002C`.
    *   Quando muda para `FFEC`, o teu também muda.

2.  **Verificação da Extensão de Sinal (.u vs .s):**
    *   Olha para o primeiro intervalo (entre 0ns e 1ns).
    *   **Variante .u (`variant=0`):** O valor é `002C` (positivo/zeros à esquerda).
    *   **Variante .s (`variant=1`):** A meio desse intervalo, o sinal `s_variant` sobe para '1'. O valor de saída muda instantaneamente para `FFEC` (negativo/uns à esquerda).
    *   Isto prova que a tua lógica de detetar o bit de sinal e preencher o resto do vetor está correta.

---

### Próximos Passos (Para o Relatório)

O enunciado pede algumas coisas específicas para o relatório final. Aqui está o que tens de fazer agora:

#### 1. Diagrama de Blocos
Tens de desenhar como o teu circuito funciona. Baseado no código que escrevemos, o diagrama deve ter:
*   Um bloco **Barrel Shifter** (entrada `src`, `start`, saída `shifted_src`).
*   Um bloco de **Comparadores** (entrada `size`, saídas `mask` e `msfb_mask`).
*   Uma porta **AND** e redução **OR** para extrair o bit de sinal (`shifted_src` & `msfb_mask` -> `sign_bit`).
*   Um **Multiplexer** ou lógica de seleção final que escolhe entre `shifted_src` e o vetor de extensão de sinal, controlado pela `mask`.

#### 2. Calcular o "Smallest Working Clock Period" (Atraso Crítico)
O enunciado pede: *"find the smallest working clock period for your implementation"*.
Isto é basicamente o tempo máximo que o sinal demora a propagar-se da entrada até à saída estável.

**Como medir isto no GTKWave:**
1.  Faz zoom numa transição (por exemplo, quando `src` muda no início, ou quando `variant` muda).
2.  Coloca um marcador no instante exato em que a **entrada** muda.
3.  Coloca outro marcador no instante em que o **`dst`** estabiliza no valor final correto.
4.  A diferença de tempo (Delta) é o atraso do teu circuito.
    *   *Dica:* Como os componentes têm atrasos fixos (Shifter ~10ps por slice, Comparador ~10-20ps), o valor total deve rondar os **50ps a 100ps** (estimativa). Mede isso para teres o valor exato.

**Estás num excelente caminho para teres a nota máxima na componente básica!** Se quiseres os créditos extra (melhorar a regra dos missing bits ou fazer o comparador bit-serial), avisa. Caso contrário, é só escrever o relatório.
