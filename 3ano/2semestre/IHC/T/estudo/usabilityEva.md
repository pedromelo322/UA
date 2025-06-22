## Tema Central: Métodos de Avaliação de Usabilidade

A aula introduz o conceito de usabilidade e a sua medição, classifica os métodos de avaliação em analíticos (sem utilizadores) e empíricos (com utilizadores), e depois aprofunda alguns dos métodos mais importantes, como a Avaliação Heurística e o Percurso Cognitivo (analíticos), e os Testes de Usabilidade e Experiências Controladas (empíricos).

Vamos detalhar os slides:

**Introdução à Avaliação de Usabilidade (Slides 2-4)**

*   **Slide 2 (Visão Geral):** Apresenta o tema "Métodos de Avaliação de Usabilidade" com ícones que representam as 10 heurísticas de Nielsen, sugerindo a sua importância.
*   **Slide 3 (Como Medir Usabilidade?):**
    *   Refere a norma ISO 9241-11 (três fatores: eficácia, eficiência, satisfação) e a sua evolução para a ISO 25010 (cinco fatores de qualidade em uso):
        *   **Eficácia (Effectiveness):** A exatidão e completude com que os utilizadores atingem os seus objetivos.
        *   **Eficiência (Efficiency):** Os recursos despendidos (tempo, esforço) em relação à exatidão e completude.
        *   **Satisfação (Satisfaction):** As perceções e respostas positivas do utilizador ao usar o sistema.
        *   **Livre de Risco (Freedom from risk):** Mitigação de riscos económicos, de saúde, segurança, ambientais.
        *   **Cobertura de Contexto (Context coverage):** A usabilidade do sistema nos contextos de uso especificados.
*   **Slide 4 (Definição e Importância):**
    *   "Avaliação de usabilidade avalia a extensão em que um sistema interativo é fácil e agradável de usar."
    *   Usabilidade é uma propriedade mensurável.
    *   Métodos de avaliação determinam se um sistema é usável e em que medida, através de métricas robustas e fiáveis.

**Classificação dos Métodos de Avaliação (Slide 5)**

*   Apresenta uma classificação amplamente usada (ex: Dix et al.):
    *   **Métodos Analíticos (sem utilizadores):** Envolvem especialistas que inspecionam a interface.
        *   Avaliação Heurística (Heuristic Evaluation) - *marcado como visto nas aulas/artigos*
        *   Percurso Cognitivo (Cognitive Walkthrough) - *marcado como visto nas aulas/artigos*
        *   Métodos baseados em Modelos (Model based methods)
        *   Métodos de Revisão (Review methods)
    *   **Métodos Empíricos (com utilizadores):** Envolvem a participação de utilizadores reais.
        *   Observação -> **Testes de Usabilidade (Usability tests)** - *marcado como visto nas aulas/artigos*
        *   Inquérito (Query - questionários, entrevistas)
        *   Experiências Controladas (Controlled Experiments)

**Métodos Analíticos (Slides 6-31)**

*   **Slide 6 (Métodos Analíticos - Geral):** Não envolvem utilizadores, mas sim analistas/avaliadores. Destaca a Avaliação Heurística e o Percurso Cognitivo.
*   **Avaliação Heurística (Heuristic Evaluation - Nielsen e Molich 1990) (Slides 7-17):**
    *   **Slide 7 (Definição e Propósito):**
        *   Método de "engenharia de usabilidade de baixo custo" (discount usability engineering) para avaliação rápida, barata e fácil.
        *   O mais popular dos métodos de inspeção.
        *   Inspeção sistemática de um design para usabilidade.
        *   Visa encontrar problemas de usabilidade para serem corrigidos num processo de design iterativo.
        *   Envolve um pequeno conjunto de analistas a julgar a UI contra uma lista de princípios de usabilidade ("heurísticas").
    *   **Slide 8 (Número de Avaliadores):**
        *   Difícil para uma única pessoa encontrar todos os problemas.
        *   Múltiplos avaliadores melhoram significativamente a eficácia.
        *   Nielsen recomenda **3 a 5 avaliadores**. Usar mais não traz ganhos proporcionais (gráfico mostra a curva de problemas encontrados vs. número de avaliadores).
    *   **Slide 9 (Exemplo - Sistema Bancário):** Com 19 avaliadores e 16 problemas, o diagrama mostra que a maioria dos problemas é encontrada por um número relativamente pequeno de avaliadores, reforçando a ideia de 3-5.
    *   **Slide 10 (Como Selecionar o Número de Avaliadores):** Considerar: complexidade da UI, experiência dos avaliadores, custos/benefícios esperados, criticidade do sistema (custo dos erros).
    *   **Slide 11 (Como Realizar AH):**
        *   Realizada por **vários avaliadores**.
        *   Avaliadores trabalham **independentemente**: primeiro obtêm uma ideia geral da UI, depois fazem uma inspeção detalhada usando as heurísticas, listando problemas (heurística violada e grau de severidade).
        *   Os resultados de todos são integrados num único relatório.
        *   O relatório ajuda a equipa de desenvolvimento a priorizar a correção dos problemas.
    *   **Slide 12 (Heurísticas):** Nielsen propôs 10 heurísticas gerais, mas existem outros conjuntos para diferentes tipos de aplicações (web, mobile) ou utilizadores (seniores, crianças).
    *   **Slide 13 (Passos do Avaliador):** Análise geral -> Análise sistemática com heurísticas -> Tomar nota de cada problema (heurística, severidade) -> Compilar e discutir com outros avaliadores.
    *   **Slide 14 (As 10 Heurísticas de Nielsen):** Lista as 10 heurísticas clássicas.
    *   **Slide 15 (Exemplo: Heurística #6 - Reconhecimento em vez de Recordação):**
        *   É mais fácil reconhecer informação do que ter de a recordar.
        *   **Dicas:** Permitir que as pessoas reconheçam informação na interface; oferecer ajuda em contexto; reduzir a informação que os utilizadores têm de lembrar.
    *   **Slide 16 (Classificação da Severidade dos Problemas):** Combinação de três fatores: frequência, impacto, persistência. Escala de 0 a 4:
        *   0 = Não é um problema
        *   1 = Problema cosmético
        *   2 = Problema de usabilidade menor
        *   3 = Problema de usabilidade maior
        *   4 = Catástrofe de usabilidade
    *   **Slide 17 (Vantagens e Limitações da AH):**
        *   **Vantagens:** Resultados úteis com investimento modesto; simples de aplicar; pode ser usada desde fases iniciais.
        *   **Limitações:** Subjetiva (parcialmente superada com mais avaliadores experientes); tende a encontrar muitos problemas pequenos; não encontra todos os problemas. **-> avaliação com utilizadores é necessária!**
*   **Percurso Cognitivo (Cognitive Walkthrough - Wharton et al., 1992) (Slides 18-31):**
    *   **Slide 18 (Definição e Foco):**
        *   Método de inspeção de usabilidade **sem envolver utilizadores** (analítico).
        *   Baseado no facto de que os utilizadores preferem aprender usando, em vez de ler manuais.
        *   Focado em avaliar a **aprendizibilidade (learnability)**: quão fácil é para novos utilizadores realizar tarefas com o sistema.
        *   Aplicável em fases iniciais, antes da codificação.
    *   **Slide 19 (Como Realizar PC):**
        1.  **Análise de Tarefas:** Sequência de passos/ações para completar uma tarefa e as respostas do sistema.
        2.  **Percurso em Grupo:** Designers/desenvolvedores percorrem a tarefa, fazendo um conjunto de perguntas a cada passo.
        3.  **Recolha de Dados:** Responder às perguntas para cada sub-tarefa; problemas de usabilidade são detetados.
        4.  **Relatório de Problemas Potenciais.**
        5.  **Redesenho da UI** para resolver os problemas.
    *   **Slide 20 (As Quatro Perguntas do PC Clássico):** Para cada passo da tarefa:
        1.  O utilizador tentará alcançar o efeito que a sub-tarefa tem? (Entende que este passo é necessário para o objetivo?)
        2.  O utilizador notará que a ação correta está disponível? (O botão/link é visível?)
        3.  O utilizador entenderá que a sub-tarefa desejada pode ser alcançada pela ação? (O rótulo do botão/link é claro?)
        4.  O utilizador recebe feedback? (Saberá que fez a coisa certa?)
    *   **Slide 21 (Problemas Comuns do PC):** O avaliador pode não conhecer a forma ótima de realizar a tarefa (o método assume a sequência ótima); análise e documentação extensivas, muito moroso.
    *   **Slide 22 (Percurso Cognitivo Simplificado - Streamlined CW - Spencer, 2000):**
        *   **Apenas duas perguntas** (que englobam as três primeiras do PC clássico):
            1.  O utilizador saberá o que fazer neste passo?
            2.  Se o utilizador fizer a coisa certa, saberá que fez a coisa certa e que está a progredir em direção ao seu objetivo?
        *   Conjunto de regras para simplificar o percurso e equilibrar granularidade com cobertura.
    *   **Slide 23 (Condições para Sucesso do PC Simplificado):** O especialista em usabilidade deve preparar a equipa, evitar discussões de design durante o percurso, neutralizar atitudes defensivas, e capturar dados seletivamente.
    *   **Slides 24-25 (Exemplo PC - Fotocopiadora):**
        *   UI: teclado numérico, botão "Copy", botão de ligar atrás. Desliga-se após 5 min de inatividade.
        *   Tarefa: copiar uma página. Utilizador: qualquer funcionário de escritório.
        *   Ações: ligar, pôr original, pressionar "Copy".
        *   Slide 25 questiona a "história" para a primeira ação (ligar a máquina): será que o utilizador assume que já está ligada? Encontrará o botão de ligar?
    *   **Slides 26-29 (Exemplo PC Simplificado - Procurar Contacto no Site da UA):**
        *   Tarefa: Procurar telefone/email. Utilizador: qualquer estudante da UA (incluindo estrangeiros).
        *   Análise da tarefa: encontrar ícone de pesquisa, inserir nome em "Pessoas", obter número.
        *   Consideração adicional: estudantes estrangeiros precisam de selecionar a versão inglesa.
        *   **Slide 27 (Ação Prévia e 1ª Ação PT):** Selecionar EN (fácil, padrão). Achar ícone de pesquisa (Q1: saberá o que fazer? Sim, ícone padrão. Q2: feedback? Sim, rotulado "Pesquisa em páginas...").
        *   **Slide 28 (2ª Ação):** Inserir nome e selecionar "Pessoas" (Q1: saberá o que fazer? Sim, fácil de reconhecer).
        *   **Slide 29 (Feedback 2ª Ação):** (Q2: saberá que fez a coisa certa? Sim. Mas, o número de telefone (interno, 5 dígitos) pode não ser reconhecido como tal).
        *   **Conclusão:** Fácil de chegar ao resultado, mas o número pode não ser reconhecido.
    *   **Slide 30 (Exemplo PC - Smart TV):** Como aceder à Internet (antes de ler o manual)? O símbolo só aparece no ecrã depois de pressionar o botão no comando (problema de visibilidade/descoberta).
    *   **Slide 31 (Praticar PC Simplificado):** Sugestões de tarefas (ligar projetor, mudar canal na box da TV).

**Métodos Empíricos (Slides 32-Fim)**

*   **Slide 32 (Limitações dos Métodos Analíticos e Necessidade de Métodos Empíricos):** Analíticos são subjetivos, envolvem especialistas, não encontram todos os problemas. **-> Métodos empíricos (com utilizadores) são necessários!** Apresenta observação, inquérito e experiências controladas.
*   **Slide 33 (Métodos Empíricos - Repetição Visual):** Reitera Observação (leva a testes de usabilidade), Inquérito e Experiências Controladas.
*   **Slide 34 (Ética na Aplicação de Métodos Empíricos):**
    *   Envolver utilizadores implica precauções: consentimento explícito, confidencialidade, segurança (evitar riscos), liberdade (utilizadores podem desistir a qualquer momento), limitar stress.
    *   **É o sistema que está em avaliação, não o utilizador!**
    *   Investigadores devem conhecer bem a ética em pesquisa com humanos.
*   **Slide 35 (Estilos de Avaliação Empírica):**
    *   **Em laboratório (mais controlado).**
    *   **No terreno (field - mais realista).**
    *   Produzem informação complementar; se possível, usar ambos.
*   **Observação (Slides 36-37):**
    *   **Slide 36 (Variantes):**
        *   **Direta:** Observador toma notas.
        *   **Indireta:** Através de áudio/vídeo (mais complexo e moroso).
        *   **Think Aloud (Pensar em Voz Alta):** Utilizadores explicam o que estão a fazer e a pensar.
        *   **Logging:** Atividade dos utilizadores é registada pelo sistema.
        *   Combinações.
    *   **Slide 37 (Think Aloud Observation):**
        *   **Benefícios:** Barato, flexível, fácil de aprender e aplicar.
        *   **Limitações:** Situação não natural, declarações podem ser filtradas, pode mudar o comportamento do utilizador.
*   **Inquérito (Query - Questionários e Entrevistas) (Slides 38-45):**
    *   **Slide 38 (Variantes):**
        *   **Questionário:** Atinge mais pessoas, menos flexível.
        *   **Entrevista:** Mais flexível, mas atinge menos pessoas.
        *   Devem ser sempre cuidadosamente preparados e testados. Dados recolhidos devem ser analisados cuidadosamente.
    *   **Slide 39 (Questionários de Usabilidade Conhecidos):**
        *   **System Usability Scale (SUS)**
        *   **Questionnaire for User Interface Satisfaction (QUIS)**
        *   Ambos devem ser preenchidos após o uso da UI.
    *   **SUS (Slides 40-43):**
        *   **Slide 40 (Características):** Ferramenta "rápida e suja", fiável. 10 questões, 5 opções de resposta. Avalia grande variedade de produtos/serviços. Padrão da indústria.
        *   **Benefícios:** Fácil de administrar, pode ser usado com amostras pequenas, é válido (diferencia sistemas usáveis de não usáveis).
        *   **Slide 41 (Questões do SUS):** Lista as 10 questões (alternam entre formulação positiva e negativa).
        *   **Slides 42-43 (Pontuação do SUS):**
            *   Valor final entre 0-100.
            *   Para questões ímpares: pontuação - 1.
            *   Para questões pares: 5 - pontuação.
            *   Somar todos os resultados e multiplicar por 2.5.
            *   **SUS > 68 é considerado acima da média.**
    *   **QUIS (Slides 44-45):**
        *   **Slide 44 (Características):** Avalia satisfação subjetiva. Inclui questionário demográfico, satisfação geral, fatores específicos da UI (visibilidade, terminologia, aprendizagem, capacidades). Versões em papel e software. Escala de 10 pontos, 21 itens.
        *   **Slide 45 (Exemplos de Questões do QUIS):** Mostra a formatação das escalas para reações gerais ao software e aspetos específicos da UI.
*   **Testes de Usabilidade (Slides 46-52):**
    *   **Slide 46 (Geral):** Envolvem observação e inquérito.
        *   **Aspetos Principais:** Participantes, Tarefas, Instalações e sistemas de teste, Protocolo, Medidas de usabilidade, Análise de dados.
        *   Podem ter logística complexa.
        *   **CIF (Common Industry Format)** - norma para relatórios de testes de usabilidade.
    *   **Slide 47 (Participantes):** Número total, segmentação, características chave (perfil), como selecionar, diferenças entre amostra e população real.
    *   **Slide 48 (Tarefas):** Cenários de teste, porquê foram selecionadas (frequentes, problemáticas), origem das tarefas, dados fornecidos, critérios de conclusão/performance.
    *   **Slide 49 (Instalações e Equipamento):** Local do teste (laboratório, escritório, casa), características que podem afetar resultados (gravação, espelhos falsos), ambiente computacional do participante, dispositivos de ecrã/entrada, questionários usados.
    *   **Slide 50 (Protocolo):** Procedimento (design lógico do teste), instruções gerais e das tarefas, medidas de usabilidade a usar (eficácia, eficiência, satisfação).
    *   **Slides 51-52 (Common Industry Format - CIF - ISO/IEC 25062):**
        *   **Slide 51:** Especifica o formato para relatar resultados de uma **avaliação sumativa** (produz métricas de quão usável é um produto num contexto). A avaliação mais comum é **formativa** (identificar problemas para corrigir). CIF é consistente com ISO 9241-11.
        *   **Slide 52:** Elementos do formato CIF: descrição do produto, objetivos do teste, participantes, tarefas, design experimental, método/processo, medidas de usabilidade e métodos de recolha, resultados numéricos.
*   **Experiências Controladas (Controlled Experiments - Slides 53-Fim):**
    *   **Slide 53 (Repetição Visual):** Reitera a classificação dos métodos.
    *   **Slide 54 (Características):** O "cavalo de batalha" da ciência experimental.
        *   **Questões Importantes:** Hipótese, Variáveis (independentes/input, dependentes/output, secundárias), Design Experimental (intra-grupos, inter-grupos), Protocolo, Participantes (número, perfil), Estatística.
    *   **Slide 55 (Passos):** Definir hipóteses, variáveis, design experimental, protocolo, selecionar participantes, preparar documentação e mecanismos de recolha, teste piloto, logística, análise de dados.
    *   **Slide 56 (Variáveis):**
        *   **Independentes (ou de entrada):** O que é controlado/manipulado pelo experimentador (ex: método de interação).
        *   **Dependentes (ou de saída):** O que é medido (ex: tempos, erros).
        *   **Secundárias:** Não controladas, mas podem influenciar o resultado (ex: idade, experiência prévia).
    *   **Slide 57 (Design Experimental):**
        *   **Intra-grupos (Within-groups ou Within-subjects):** Todos os participantes usam todas as condições (ordem aleatorizada para evitar enviesamento de aprendizagem/fadiga). Vantagens: menor nº de participantes, mesmo perfil. Desvantagens: propenso a fadiga ou aprendizagem.
        *   **Inter-grupos (Between-groups ou Between-subjects):** Cada participante usa apenas uma condição. Vantagens: menos fadiga/aprendizagem. Desvantagens: maior nº de participantes, perfis diferentes.
    *   **Slides 58-64 (Exemplo de Experiência Controlada em Laboratório - Avatar da Mão em VR):**
        *   Título: "Efeito do Avatar da Mão Usando um Tablet como Input num Ambiente Virtual Imersivo".
        *   **Slide 60 (Detalhes):** Questão de pesquisa (como a representação virtual das mãos influencia a performance na seleção de botões num tablet em VR). Método: experiência controlada. 55 participantes, 3 condições (sem avatar, avatar realista, avatar translúcido). Resultados: mais rápido sem avatar, menos erros com avatar (realista ou translúcido), avatar translúcido preferido e considerado melhor.
        *   **Slide 61 (Design Experimental):** Hipótese Nula (usabilidade independente da representação das mãos). Variável Independente (representação das mãos - 3 níveis). Variável Dependente (usabilidade = performance + satisfação). Design Intra-grupos. Tarefa (selecionar botão destacado).
        *   **Slide 62 (Condições Experimentais):** Imagens das 3 condições.
        *   **Slide 63 (Configuração Experimental):** Laptop (Unity), HMD (Oculus DK2), Tablet (Nexus 7), Leap Motion, Marcador AR + câmara do tablet (Vuforia).
        *   **Slide 64 (Resultados Principais):** Gráficos de tempo de seleção e erros.
    *   **Slides 65-74 (Exemplo de Experiência Controlada no Terreno - AR para Operadores de Logística):**
        *   Título: "AR Pervasiva para apoiar operadores de logística em cenário Industrial: um estudo de caso de utilizadores em chão de fábrica na montagem de kits".
        *   **Slide 66 (Contexto):** Indústria 4.0, operadores humanos essenciais, procedimentos de picking (identificar componentes e localização), uso de manuais em papel (propenso a erros), AR como solução.
        *   **Slide 67 (Objetivo e Método):** Comparar performance com 3 condições: C1-Papel, C2-HMD (Head Mounted Display), C3-HDD (Hand Held Device). Experiência controlada, estudo de campo.
        *   **Slide 68 (Design Experimental):** Hipótese Nula (condições igualmente usáveis). VI (dispositivo - 3 níveis). VD (usabilidade = performance + satisfação). Intra-grupos. Tarefa (picking real). Período de adaptação.
        *   **Slide 69 (Dados Recolhidos):** Demografia, duração da tarefa, preferências, opinião. Dimensões (1-Baixo, 7-Alto): nível de confusão, esforço físico, esforço mental, satisfação.
        *   **Slide 70 (Participantes):** 10 participantes (engenheiros, trabalhadores de linha), alguns com experiência prévia em AR, sem experiência na tarefa específica.
        *   **Slide 71 (Resultados Principais - Dimensões):** Gráfico de boxplot mostrando as dimensões D1-D4 para as 3 condições.
        *   **Slide 72 (Resultados Principais - Trajetos):** Mapas dos trajetos dos participantes. Potencial da AR para treino. C2-HMD preferido e considerado mais útil/eficiente.
        *   **Slide 73 (Observações - Uso de AR):** Luvas afetaram rastreamento; algumas cores confundiram-se com o ambiente; mostrar percentagem de componentes; informação virtual não desaparecer instantaneamente; ajuste ergonómico do HMD; mãos-livres facilita.
        *   **Slide 74 (Trabalho Futuro):** Estudo longitudinal, expandir para outros casos de uso, configurações co-localizadas.

**Conclusões (Slides 75-76)**

*   **Slide 75:** "A avaliação é fundamental. Tu NÃO és o teu utilizador." (Mensagem chave em IHC).
*   **Slide 76 (Take Away da Avaliação de Usabilidade):**
    *   Usabilidade é propriedade fundamental e mensurável.
    *   Métodos de avaliação determinam se é usável e em que medida.
    *   Existem vários métodos documentados.
    *   Devem ser selecionados e usados conforme as diretrizes.









## Tema Central: Estilos de Interação - Manipulação Direta e Linguagens de Comando

A aula revisita a classificação dos estilos de interação e a razão para a sua combinação, e depois aprofunda dois estilos importantes:

1.  **Manipulação Direta (Direct Manipulation):** Características, exemplos, o conceito de distâncias semântica e articulatória, vantagens, desvantagens, perfil de utilizador adequado e diretrizes de design (com foco em ícones).
2.  **Linguagens de Comando (Command Languages):** Objetivos de design, questões de usabilidade, vantagens, desvantagens e diretrizes de design.

Vamos detalhar os slides:

**Revisão e Introdução à Manipulação Direta (Slides 2-3)**

*   **Slide 2 (Revisão):** Relembra a classificação dos estilos de interação (Menus, Fill-in-forms, Manipulação Direta, Linguagens de Comando, Linguagens Naturais, etc.) e a questão "Porque é que dois ou mais estilos são usados simultaneamente?". A seta aponta para "Manipulação Direta", indicando o foco.
*   **Slide 3 (Manipulação Direta - Título):** Apresenta o tópico com imagens de dispositivos onde a manipulação direta é proeminente (laptop, tablet, smartphone, smartwatch).

**Manipulação Direta (Direct Manipulation - Slides 4-30)**

*   **Slide 4 (Definição e Origem):**
    *   Nome cunhado por Shneiderman (1982).
    *   Origens podem ser rastreadas até ao Sketchpad de Ivan Sutherland (comentado por Alan Kay).
    *   **Definição:** Ações são realizadas diretamente sobre representações visuais dos objetos.
*   **Slide 5 (Características da Manipulação Direta - Shneiderman):**
    1.  Representação contínua dos objetos de interesse.
    2.  Ações físicas (apontar, clicar, arrastar) em vez de linguagens de comando complexas.
    3.  Ações rápidas, incrementais e reversíveis com resultados visíveis imediatamente.
    *   Exemplo: Um explorador de ficheiros que mostra os ficheiros e pastas continuamente.
*   **Slides 6-7 (Manipulação Direta e Ícones):**
    *   Manipulação direta não implica *necessariamente* o uso de ícones, mas na maioria das situações eles estão envolvidos.
    *   **Exemplo sem ícones (Slide 6):** Selecionar e arrastar uma secção de texto. A ação é realizada numa representação visual do objeto (o texto).
    *   **Exemplo com gestos (Slide 7):** Fazer "pinch out/in" num telemóvel para fazer zoom numa imagem.
*   **Slide 8 (Aplicações Adequadas):** Algumas aplicações são mais adequadas para manipulação direta, como editores gráficos, sistemas de design (CAD), jogos, e qualquer interface onde a visualização e manipulação espacial de objetos é central.
*   **Slide 9 (Exemplo Histórico):** MacPaint, uma das primeiras UIs comerciais a usar extensivamente manipulação direta.
*   **Slide 10 (Realidade Virtual e Aumentada):** Levam a manipulação direta a um novo nível, permitindo interações mais imersivas e físicas com objetos virtuais.
*   **Slide 11 (Uso Recente com LMMs - Large Language Models):** DirectGPT como exemplo de aplicação dos princípios de manipulação direta para interagir com LLMs, através de: representação contínua de objetos, ações físicas para localizar o efeito de prompts e referir objetos, prompts reutilizáveis numa barra de ferramentas, e operações reversíveis (undo/redo).
*   **Slides 12-13 (Distâncias Semântica e Articulatória - Hutchins, Hollan & Norman, 1986):**
    *   Não existe uma UI de manipulação direta "pura"; é uma qualidade presente em diferentes graus.
    *   **Distância Semântica (Slide 13):** Distância subjetiva entre o objetivo do utilizador e a semântica da interface (o que a interface oferece e significa). Se os objetos e ações da interface não suportam os objetivos do utilizador, a distância semântica é alta.
    *   **Distância Articulatória (Slide 13):** Distância entre o significado das ações e a sua forma física (como o utilizador as executa).
*   **Slide 14 (Exemplo de Distância Semântica):**
    *   Se o utilizador quer desenhar retângulos e a aplicação tem uma ferramenta direta para isso (ex: ícone de retângulo), a distância semântica é menor.
    *   Se a aplicação permite desenhar retângulos apenas através da combinação de linhas individuais, a distância semântica é maior (sente-se menos direto).
*   **Slide 15 (Exemplo de Distância Articulatória):**
    *   Arrastar um ícone para uma pasta (ex: Dropbox) corresponde a uma distância articulatória menor para a ação de "mover para".
    *   Selecionar uma opção num menu de contexto (ex: "Mover para Dropbox") corresponde a uma distância articulatória maior.
*   **Slide 16 (Dois Aspetos Relevantes na Interação):**
    *   **Especificação de Objetos:** Como os objetos são identificados/selecionados (geração de nome, correlação visual).
    *   **Especificação de Ações:** Como as ações são iniciadas (geração de nome - escrever comando, correlação visual - selecionar ícone de ação, geração de gesto, ação análoga, seleção codificada).
*   **Slide 17 (Grau de Manipulação Direta):**
    *   Especificar objetos por correlação visual (apontar/selecionar) implica a presença de manipulação direta.
    *   A forma como as ações são especificadas define o **grau** de manipulação direta:
        *   Menos direto (- direct UI): Correlação visual para objeto + Geração de nome para ação (ex: selecionar ficheiro, depois escrever "delete").
        *   Mais direto (+ direct UI): Correlação visual para objeto + Correlação visual para ação (ex: selecionar ficheiro, clicar no ícone "delete") OU Correlação visual para objeto + Ação análoga (ex: arrastar ficheiro para a reciclagem).
*   **Slide 18 (Exemplos de Graus de Manipulação Direta):**
    *   **Não DM:** Geração de nome para objeto + Geração de nome para ação (ex: `mv ficheiro1.txt pasta_destino/` na linha de comando).
    *   **DM UI (moderado):** Correlação visual (selecionar ficheiro) + Correlação visual (clicar "Mover" no menu de contexto).
    *   **+ DM UI (alto):** Correlação visual (selecionar ficheiro) + Ação análoga (arrastar o ficheiro para a pasta).
*   **Slide 19 (Exemplo: Drag and Drop):**
    *   É um tipo de manipulação direta, útil para agrupar, reordenar, mover ou redimensionar objetos.
    *   Exemplo central de manipulação direta.
*   **Slide 20 (Vantagens e Desvantagens da Manipulação Direta):**
    *   **Vantagens (potenciais):**
        *   Fácil de aprender e lembrar (ótimo para novatos com bom design).
        *   Direto, WYSIWYG (What You See Is What You Get).
        *   Ações flexíveis e facilmente reversíveis.
        *   Feedback visual e contextual imediato.
        *   Pode ser menos propenso a erros.
    *   **Desvantagens:**
        *   Pode não ser auto-explicativo (significado de ícones/gestos precisa ser aprendido).
        *   Pode ser ineficiente para tarefas repetitivas.
        *   Tarefas repetitivas não são bem suportadas (melhor com scripts/macros).
        *   Alguns gestos podem ser mais propensos a erros do que digitar.
        *   Difícil desenhar ícones reconhecíveis (especialmente para ações).
        *   Ícones ocupam mais espaço no ecrã do que texto.
*   **Slide 21 (Perfil de Utilizador Adequado para Manipulação Direta):**
    *   **Conhecimento e Experiência:** Experiência de sistema moderada; experiência de tarefa moderada a alta; uso frequente de outros sistemas (familiaridade com GUIs); baixa literacia computacional (para tarefas simples e bem desenhadas).
    *   **Trabalho e Tarefa:** Baixa frequência de uso; treino moderado; uso opcional; tarefas pouco estruturadas (onde a exploração é útil).
*   **Slide 22 (Diretrizes de Design para Manipulação Direta):**
    *   Minimizar as distâncias articulatória e semântica.
    *   Usar diretrizes gerais para uma UI usável: Coerência, Bom modelo conceptual, Feedback, Organização adequada da funcionalidade, Layout de ecrã adequado, Uso adequado da cor, Tratamento de erros adequado, etc.
*   **Design de Ícones (Slides 23-29):**
    *   **Slide 23 (Ícones):** Uma imagem que supostamente representa uma função. Não são fáceis de desenhar bem.
    *   **Slide 24 (Esquema de Ícones Coerente):** Usar um estilo visual consistente para todos os ícones. Adicionar nomes (rótulos) torna-os mais reconhecíveis. Fornecer feedback visual de seleção.
    *   **Slide 25 (Expressar Relação Através da Similaridade de Ícones):** Ícones para o mesmo tipo de ficheiro devem ser visualmente similares. Pastas devem ter um aspeto consistente.
    *   **Slide 26 (Adicionar Nomes aos Ícones):** Torna-os mais reconhecíveis (reconhecimento em vez de recordação). Permitir que o utilizador defina nomes (para os seus próprios ícones/atalhos) pode ser útil.
    *   **Slide 27 (Ícones Devem Ser Conceptualmente e Visualmente Distintos):**
        *   **Similaridade Conceptual, Distinção Visual:** Bom. (Ex: dois livros diferentes para dicionário e lista telefónica).
        *   **Distinção Conceptual, Similaridade Visual:** Mau. (Ex: dois ícones de pasta quase iguais para funções diferentes).
        *   **Melhor solução:** Conceptualmente e visualmente distintos.
        *   Ícones conceptualmente similares (ex: ligar/desligar, bateria cheia/vazia) devem ser visualmente distinguíveis, mas manter uma relação visual.
    *   **Slide 28 (Ícones Devem Ser Específicos/Familiares, Não Abstratos/Não Familiares):** Usar representações concretas e que os utilizadores reconheçam facilmente. Questiona a familiaridade de alguns ícones de browser.
    *   **Slide 29 (Expressar Atributos dos Objetos Através de Ícones):** Visibilidade do estado do sistema. (Ex: checkmark para ficheiro sincronizado, ícone de reciclagem vazio vs. cheio, indicação de progresso numa barra de tarefas).
*   **Slide 30 (Observações Finais sobre Manipulação Direta):**
    *   Difícil imaginar interfaces modernas sem DM.
    *   RA e RV levarão a DM a novos limites.
    *   Apesar das desvantagens, recomenda-se um uso intensivo de DM para a maioria das UIs.

**Linguagens de Comando (Command Languages - Slides 31-43)**

*   **Slide 31 (Transição):** Relembra a classificação e aponta para "Linguagens de Comando".
*   **Slide 32 (Linguagens de Comando - Título):** Mostra um terminal Linux.
*   **Slide 33 (Usabilidade das Linguagens de Comando):** Devem também ser desenhadas para serem o mais usáveis possível.
*   **Slide 34 (Objetivos Básicos do Design de Linguagens):**
    *   Precisão (sem ambiguidade).
    *   Compacidade (comandos curtos).
    *   Facilidade de escrita e leitura.
    *   Velocidade de aprendizagem.
    *   Simplicidade para reduzir erros.
    *   Facilidade de retenção ao longo do tempo.
*   **Slide 35 (Questões de Usabilidade para Linguagens de Comando):**
    *   A linguagem suporta as funções necessárias?
    *   É rápido inserir um comando?
    *   É fácil reconhecer o que um comando pode fazer (se visível ou documentado)?
    *   É fácil recordar um comando?
    *   Há poucos erros ao usar a linguagem?
*   **Slide 36 (Vantagens e Desvantagens):**
    *   **Vantagens (potenciais):**
        *   Poderosas.
        *   Flexíveis.
        *   Eficientes (para utilizadores experientes).
        *   Não ocupam muito espaço no ecrã.
    *   **Desvantagens:**
        *   Difíceis de aprender.
        *   Não auto-explicativas.
        *   Propensas a erros (de sintaxe, de digitação).
        *   Melhorias (novos comandos) não são visíveis (precisam ser aprendidas/descobertas).
*   **Slide 37 (Comandos via Voz):** Linguagens de comando podem ser usadas via voz (não apenas texto), mas devem ser muito simples (ex: controlar media no carro). Combina estilo de interação (linguagem de comando) com dispositivos de interação (reconhecimento/síntese de voz).
*   **Slide 38 (Questões Relevantes no Design de Linguagens de Comando):**
    *   Semântica (o significado dos comandos).
    *   Sintaxe (a estrutura dos comandos).
    *   Léxico (o vocabulário – nomes dos comandos e parâmetros).
    *   Interação (feedback, ajuda, etc.).
*   **Slides 39-42 (Diretrizes de Design para Linguagens de Comando):**
    *   **Slide 39 (Equilibrar Riqueza e Minimalismo):** Similar à distância semântica na DM. Oferecer um conjunto de comandos que seja poderoso o suficiente, mas não excessivamente complexo. (Ex: `Delete`, `Insert`, `Replace` vs. apenas `Delete`, `Insert` se a funcionalidade de `Replace` puder ser alcançada por uma combinação dos outros dois de forma simples).
    *   **Slide 40 (Usar uma Sintaxe Coerente):** Usar uma gramática natural e fácil de lembrar, como Ação-Objeto (ex: `search filea volb` em vez de `VolB!FileA!D$$`). Evitar sintaxe incoerente e comandos não familiares.
    *   **Slide 41 (Abreviaturas Simples e Coerentes):** Fáceis de lembrar (mas não necessariamente de reconhecer, como as teclas de função que têm rótulos). O exemplo mostra abreviaturas "pobres" vs. "melhoradas".
    *   **Slide 42 (Permitir Funcionalidades de Interação):**
        *   Valores por defeito (Defaults).
        *   Edição de comandos.
        *   Interpretação inteligente (ex: "delate": quis dizer "delete"? S/N).
        *   Type-ahead (antecipar o que o utilizador está a escrever).
        *   Feedback.
        *   Ajuda e documentação.
        *   Tornar a linguagem "personalizável pelo utilizador" (aliases, scripts).
*   **Slide 43 (Exemplo de Comando Complexo com Defaults):** O comando `ls` do Linux. Não é preciso usar todos os argumentos; existem valores por defeito.

**Take Away Geral da Aula:**

*   **Manipulação Direta** é um estilo de interação dominante e poderoso, caracterizado pela representação contínua de objetos e ações físicas com feedback imediato. É crucial minimizar as distâncias semântica e articulatória. O design de ícones é um aspeto importante.
*   **Linguagens de Comando** oferecem poder e flexibilidade para utilizadores experientes, mas têm uma curva de aprendizagem acentuada. O seu design deve focar na clareza da semântica, sintaxe, léxico e em funcionalidades de interação que ajudem o utilizador.
*   A combinação de diferentes estilos de interação é comum e muitas vezes necessária para acomodar diferentes tarefas e níveis de utilizador.



















## Usabilidade e Avaliação de UX

1.  **Why is UX and usability evaluation pivotal in the development of any interactive system?**
    A avaliação de UX (Experiência do Utilizador) e usabilidade é pivotal porque:
    *   **Garante que o sistema atende às necessidades reais dos utilizadores:** Sem avaliação, corre-se o risco de construir um produto que ninguém quer ou consegue usar.
    *   **Identifica problemas cedo:** Encontrar e corrigir problemas de usabilidade durante o desenvolvimento é muito mais barato e fácil do que após o lançamento.
    *   **Melhora a satisfação do utilizador:** Sistemas fáceis e agradáveis de usar levam a utilizadores mais satisfeitos, maior adoção e lealdade.
    *   **Aumenta a eficiência e eficácia:** Utilizadores conseguem realizar as suas tarefas mais rapidamente e com menos erros.
    *   **Reduz custos de suporte e formação:** Interfaces intuitivas requerem menos ajuda e treino.
    *   **Fornece dados para decisões de design informadas:** Em vez de confiar em suposições, as decisões são baseadas em como os utilizadores realmente interagem com o sistema.
    *   **"Tu não és o teu utilizador":** A avaliação ajuda a equipa de design a sair da sua própria perspetiva e a entender a dos utilizadores (Lecture 10, Slide 75).

2.  **Is Heuristic evaluation an analytical or empirical method? Why?**
    A Avaliação Heurística é um método **analítico** (Lecture 10, Slide 5, 6).
    *   **Porquê:** Porque não envolve a participação direta de utilizadores finais a realizarem tarefas com o sistema. Em vez disso, é realizada por um ou mais especialistas (analistas de usabilidade) que inspecionam a interface e a comparam com um conjunto de princípios de usabilidade reconhecidos (as heurísticas).

3.  **What is the outcome of a heuristic evaluation to be given to the project team?**
    O resultado de uma avaliação heurística a ser entregue à equipa do projeto é tipicamente um **relatório consolidado** que inclui (Lecture 10, Slide 11):
    *   Uma lista de todos os problemas de usabilidade identificados.
    *   Para cada problema:
        *   A(s) heurística(s) que foram violadas.
        *   Uma descrição do problema e onde ele ocorre na interface.
        *   Uma classificação de severidade do problema (ex: de 0 a 4).
    *   O relatório deve ajudar a equipa a priorizar a correção dos problemas.

4.  **Is heuristic evaluation an objective or subjective evaluation method?**
    A Avaliação Heurística tem um componente **subjetivo** (Lecture 10, Slide 17). Embora os avaliadores usem um conjunto definido de heurísticas, a interpretação de como uma heurística se aplica a um aspeto específico da interface e a atribuição de um grau de severidade podem variar entre avaliadores.

5.  **Is it possible to use different lists of heuristics?**
    **Sim**, é possível e, por vezes, recomendado (Lecture 10, Slide 12). Embora as 10 heurísticas de Nielsen sejam as mais conhecidas e gerais, existem outros conjuntos de heurísticas adaptados para:
    *   **Diferentes tipos de aplicações:** (ex: websites, aplicações móveis, sistemas de visualização de dados, jogos).
    *   **Diferentes tipos de utilizadores:** (ex: crianças, idosos, utilizadores com necessidades especiais).
    *   Contextos específicos.

6.  **Why is it useful to classify potential usability problems using the heuristic (or heuristics) not complied with?**
    Classificar os problemas pela heurística violada é útil porque:
    *   **Fornece uma justificação baseada em princípios:** Ajuda a explicar *porquê* algo é um problema de usabilidade, em vez de ser apenas uma opinião.
    *   **Ajuda na comunicação:** Facilita a discussão dos problemas dentro da equipa de design e com stakeholders, usando uma linguagem comum.
    *   **Orienta a solução:** Compreender qual princípio foi violado pode dar pistas sobre como corrigir o problema.
    *   **Agrupamento de problemas:** Permite agrupar problemas semelhantes, facilitando a sua análise e priorização.

7.  **Why is it important to provide a severity grade to each problem? (Lecture 10, Slide 11, 16)**
    Fornecer um grau de severidade a cada problema é importante para:
    *   **Priorização:** Ajuda a equipa de desenvolvimento a decidir quais problemas corrigir primeiro, focando nos mais críticos ou com maior impacto na experiência do utilizador, especialmente quando os recursos (tempo, orçamento) são limitados.
    *   **Alocação de Recursos:** Permite direcionar esforços para os problemas que causarão mais danos se não forem resolvidos.
    *   **Comunicação do Impacto:** Quantifica, de certa forma, o impacto potencial de cada problema.

8.  **What should be taken into account to assign the severity grade of a problem? (Lecture 10, Slide 16)**
    A classificação da severidade é tipicamente uma combinação de três fatores:
    1.  **Frequência:** Com que frequência o problema ocorre ou é encontrado pelos utilizadores.
    2.  **Impacto:** Quão difícil é para os utilizadores superarem o problema se ele ocorrer (ex: impede a conclusão da tarefa, causa grande frustração, leva a erros graves).
    3.  **Persistência:** Se o problema é algo que os utilizadores encontram repetidamente ou apenas uma vez e aprendem a contornar.

9.  **Why should analysts work independently in a first phase? (Lecture 10, Slide 11)**
    Os analistas devem trabalhar independentemente numa primeira fase para:
    *   **Evitar enviesamento (bias):** A opinião de um avaliador pode influenciar os outros se trabalharem juntos desde o início.
    *   **Aumentar a cobertura de problemas:** Diferentes pessoas notarão problemas diferentes. Se discutirem cedo demais, podem convergir para os mesmos problemas e deixar outros por identificar.
    *   **Garantir uma avaliação mais abrangente:** Cada avaliador traz a sua perspetiva única para a inspeção.
    Posteriormente, os resultados individuais são compilados e discutidos para chegar a um consenso.

10. **How to choose the n. of evaluators that should be doing the heuristic evaluation? (Lecture 10, Slide 8, 10)**
    *   Nielsen geralmente recomenda entre **3 a 5 avaliadores**. Esta faixa costuma identificar a maioria dos problemas de usabilidade mais significativos com um bom retorno do investimento.
    *   Para escolher o número específico, deve-se considerar:
        *   **Complexidade da interface:** Interfaces mais complexas podem beneficiar de mais avaliadores.
        *   **Experiência dos avaliadores:** Avaliadores menos experientes podem precisar de ser em maior número para atingir a mesma eficácia.
        *   **Custos/Benefícios esperados:** Equilibrar o custo de ter mais avaliadores com o benefício de encontrar mais problemas.
        *   **Criticidade do sistema:** Para sistemas críticos (onde erros têm consequências graves), pode justificar-se um número maior.

11. **When in the UI development process should heuristic evaluation be used? (Lecture 10, Slide 17)**
    A Avaliação Heurística pode ser usada em **várias fases do processo de desenvolvimento**, mas é particularmente útil:
    *   **Desde fases iniciais:** Pode ser aplicada a protótipos de papel, wireframes, mockups ou protótipos interativos. Quanto mais cedo, mais fácil e barato é corrigir os problemas.
    *   **Iterativamente:** Pode ser repetida ao longo do ciclo de vida à medida que o design evolui.
    *   Antes de testes de usabilidade com utilizadores, para "limpar" problemas óbvios.
    *   Em sistemas já existentes, para identificar áreas de melhoria.

12. **Can you point out an important limitation of heuristic evaluation? (Lecture 10, Slide 17)**
    Uma limitação importante é que a Avaliação Heurística **não consegue encontrar todos os problemas de usabilidade**. Em particular, pode não identificar problemas específicos do contexto de uso de utilizadores reais ou problemas relacionados com tarefas muito específicas que os especialistas podem não antecipar. Além disso, como mencionado, é um método subjetivo.

13. **How is it possible to overcome the fact that heuristic evaluation is subjective? (Lecture 10, Slide 17)**
    A subjetividade da Avaliação Heurística pode ser parcialmente superada através de:
    *   **Uso de múltiplos avaliadores:** Ter vários especialistas (idealmente 3-5) a realizar a avaliação de forma independente e depois consolidar os resultados ajuda a mitigar o enviesamento individual.
    *   **Experiência dos avaliadores:** Avaliadores com mais experiência em usabilidade e no método tendem a ser mais consistentes e a identificar problemas mais relevantes.
    *   **Discussão e consenso:** Após as avaliações individuais, uma sessão de discussão entre os avaliadores para consolidar os achados e as classificações de severidade.
    *   **Complementar com outros métodos:** Usar a AH em conjunto com métodos empíricos (que envolvem utilizadores).

14. **Heuristic evaluation should not be used as the only usability evaluation method. Why? (Lecture 10, Slide 17)**
    Porque, como mencionado, tem limitações:
    *   **Não encontra todos os problemas:** Especialmente aqueles que só se manifestam no uso real por utilizadores típicos em contextos específicos.
    *   **Subjetividade:** As opiniões dos especialistas podem não refletir perfeitamente a experiência dos utilizadores.
    *   **Foco em problemas, não necessariamente em soluções:** Embora identifique problemas, não testa diretamente se uma solução é eficaz para os utilizadores.
    Por estas razões, deve ser complementada com métodos que envolvam utilizadores reais (métodos empíricos).

15. **Can you point out another empirical method of evaluating usability? (Lecture 10, Slide 5, 33)**
    Além dos Testes de Usabilidade (baseados em observação e inquérito), outro método empírico importante é a **Experiência Controlada (Controlled Experiment)**. Outros incluem:
    *   **Inquéritos (Query methods):** Questionários (como SUS, QUIS) e Entrevistas.
    *   **Estudos de Campo (Field Studies).**

16. **Cognitive Walkthrough (CW) is an analytical method of evaluating usability? Why? (Lecture 10, Slide 18)**
    Sim, o Percurso Cognitivo é um método **analítico**.
    *   **Porquê:** Porque, tal como a Avaliação Heurística, **não envolve utilizadores finais** a interagir com o sistema. É realizado por designers, programadores ou especialistas em usabilidade que simulam o processo mental de um utilizador (geralmente um novo utilizador) a tentar realizar uma tarefa específica passo a passo, usando um conjunto de questões para guiar a análise.

17. **What is the main goal of Cognitive Walkthrough? (Lecture 10, Slide 18)**
    O principal objetivo do Percurso Cognitivo é avaliar a **aprendizibilidade (learnability)** de um sistema, ou seja, quão fácil é para **novos utilizadores** aprenderem a usar o sistema para realizar tarefas específicas. Foca-se em identificar barreiras que um utilizador inexperiente possa encontrar ao tentar descobrir como executar uma tarefa.

18. **Can you point out two important rules to apply in a usability test concerning ethics? (Lecture 10, Slide 34)**
    1.  **Consentimento Explícito e Informado:** Os participantes devem ser claramente informados sobre o propósito do teste, o que lhes será pedido, como os seus dados serão usados, e devem dar o seu consentimento voluntário para participar (geralmente por escrito).
    2.  **Liberdade para Desistir a Qualquer Momento:** Os participantes devem ser informados de que podem interromper a sua participação no teste a qualquer momento, sem necessidade de justificação e sem qualquer penalização.

19. **What usability evaluation methods are involved in a usability test? (Lecture 10, Slide 46)**
    Um teste de usabilidade tipicamente envolve uma combinação de:
    *   **Observação:** O principal método, onde os facilitadores observam os participantes enquanto eles realizam tarefas com o sistema. Pode ser direta (tomar notas) ou indireta (gravação de vídeo/áudio, logging de interações).
    *   **Inquérito (Query):**
        *   **Entrevistas:** Perguntas antes (pré-teste, para entender o perfil) e depois (pós-teste, para recolher opiniões, satisfação, esclarecer observações).
        *   **Questionários:** Para recolher dados demográficos, medir a satisfação subjetiva (ex: SUS, QUIS) ou outras métricas.
    *   Frequentemente, a técnica **Think Aloud** (pensar em voz alta) é usada durante a observação.

20. **Query methods may be questionnaires and interviews; what are the advantages and disadvantages of each of them? (Lecture 10, Slide 38)**
    *   **Questionários:**
        *   **Vantagens:** Podem atingir um grande número de pessoas de forma eficiente; relativamente baratos de administrar; podem ser anónimos, encorajando respostas mais honestas; dados quantitativos fáceis de analisar.
        *   **Desvantagens:** Menos flexíveis (não permitem aprofundar respostas inesperadas); a taxa de resposta pode ser baixa; a qualidade das respostas depende da clareza das perguntas; não permitem observar linguagem corporal ou tom de voz.
    *   **Entrevistas:**
        *   **Vantagens:** Muito flexíveis (permitem explorar respostas em profundidade, fazer perguntas de seguimento); permitem observar pistas não-verbais; podem gerar insights ricos e detalhados.
        *   **Desvantagens:** Mais demoradas e caras de realizar e analisar; atingem um número menor de pessoas; os resultados podem ser influenciados pela habilidade do entrevistador; a análise de dados qualitativos é mais complexa.

21. **What are the dependent variables in a controlled experiment? (Lecture 10, Slide 56)**
    As variáveis dependentes (ou de saída/output) são aquelas que são **medidas** pelo experimentador para ver como são afetadas pelas mudanças nas variáveis independentes. São os resultados da experiência.
    *   Exemplos comuns em IHC: tempo para completar uma tarefa, número de erros, taxa de sucesso, pontuação de satisfação (ex: SUS).

22. **What are the independent variables in a controlled experiment? (Lecture 10, Slide 56)**
    As variáveis independentes (ou de entrada/input) são aquelas que são **manipuladas ou controladas** pelo experimentador para testar os seus efeitos nas variáveis dependentes. Representam as diferentes condições que estão a ser comparadas.
    *   Exemplos comuns em IHC: diferentes designs de interface, diferentes métodos de interação, diferentes tipos de feedback.

23. **Think-aloud is a type of observation; why it is called think-aloud? (Lecture 10, Slide 36, 37)**
    É chamado "think-aloud" (pensar em voz alta) porque, durante a observação, pede-se aos **participantes para verbalizarem continuamente os seus pensamentos, sentimentos, expectativas e raciocínios** enquanto interagem com o sistema e realizam as tarefas. O objetivo é obter insights sobre o processo mental do utilizador.

24. **Can you mention a disadvantage of the think-aloud observation? (Lecture 10, Slide 37)**
    Uma desvantagem é que **pode ser uma situação não natural para o utilizador**. Falar em voz alta enquanto se realiza uma tarefa não é algo que as pessoas façam normalmente, o que pode:
    *   Alterar o seu comportamento normal (torná-los mais lentos ou mais metódicos).
    *   Fazer com que filtrem ou modifiquem os seus pensamentos.
    *   Ser cansativo para o participante.

25. **And an advantage? (Lecture 10, Slide 37)**
    Uma vantagem importante é que **fornece insights diretos sobre o processo de pensamento, as expectativas e as dificuldades do utilizador** que não seriam óbvios apenas pela observação das suas ações. Ajuda a entender o "porquê" por detrás do comportamento. Além disso, é relativamente barato e fácil de aprender e aplicar.

26. **What are the advantages of using low fidelity prototypes (e.g. paper) in usability evaluation? (Lecture 5, Slides 14, 20, 21, 22)**
    *   **Rápidos e Baratos:** Fáceis e rápidos de criar e modificar, não exigindo ferramentas especializadas.
    *   **Feedback Precoce:** Permitem testar conceitos e fluxos de trabalho muito cedo no processo de design.
    *   **Foco em Conceitos:** Encorajam feedback sobre a estrutura, funcionalidade e fluxo, em vez de detalhes estéticos (evita o "nitpicking").
    *   **Mais Feedback Criativo:** O aspeto "inacabado" torna os utilizadores mais à vontade para criticar e sugerir mudanças radicais.
    *   **Facilidade de Iteração:** Alterações podem ser feitas no momento, durante a sessão de teste.
    *   **Envolvimento do Utilizador:** São menos intimidantes e podem facilitar a participação dos utilizadores no próprio processo de design (co-design).
    *   **Detetam muitos problemas:** Estima-se que podem ajudar a detetar uma grande percentagem dos problemas de usabilidade.

27. **What is the protocol of a controlled experiment? (Lecture 10, Slide 50, 55)**
    O protocolo de uma experiência controlada é o **plano detalhado passo a passo de como a experiência será conduzida**. Inclui:
    *   As instruções gerais dadas aos participantes.
    *   As instruções específicas para cada tarefa.
    *   A ordem de apresentação das condições e tarefas (incluindo aleatorização, se aplicável).
    *   Como as variáveis dependentes serão medidas (os dados a recolher).
    *   O que o experimentador deve dizer e fazer em cada fase.
    *   Procedimentos para lidar com questões ou problemas dos participantes.
    *   O objetivo é garantir que a experiência seja realizada de forma consistente para todos os participantes e que possa ser replicada.

28. **What is the difference between within- and between-groups experimental design of a controlled experiment? (Lecture 10, Slide 57)**
    *   **Within-groups (ou Within-subjects):** **Todos os participantes são expostos a todas as condições** experimentais (ex: todos os participantes usam a Interface A e a Interface B). A ordem das condições é geralmente aleatorizada ou contrabalançada para evitar efeitos de aprendizagem ou fadiga.
    *   **Between-groups (ou Between-subjects):** **Cada participante é exposto a apenas uma condição** experimental (ex: um grupo de participantes usa a Interface A, e um grupo diferente usa a Interface B). Os participantes são atribuídos aleatoriamente aos grupos.

29. **What is the hypothesis in a controlled experiment? (Lecture 10, Slide 54, 55, 61, 68)**
    Uma hipótese numa experiência controlada é uma **afirmação testável sobre a relação esperada entre as variáveis independentes e dependentes**. É uma previsão do que o experimentador espera que aconteça.
    *   Geralmente, formula-se uma **Hipótese Nula (H0)**, que afirma que não há diferença ou efeito (ex: "A usabilidade é independente da representação das mãos"), e uma **Hipótese Alternativa (H1)**, que afirma que existe uma diferença ou efeito (ex: "A representação translúcida das mãos resulta em maior satisfação do que a representação realista").
    O objetivo da experiência é recolher dados para rejeitar ou não a hipótese nula.

30. **What are model-based usability evaluation methods? (Lecture 10, Slide 5)**
    Métodos de avaliação baseados em modelos usam **modelos formais ou preditivos do comportamento do utilizador** para estimar a usabilidade de um sistema sem necessariamente testar com utilizadores reais (embora os modelos em si sejam frequentemente derivados de estudos empíricos).
    *   Exemplos incluem **GOMS (Goals, Operators, Methods, Selection rules)** e a **Lei de Fitts**. Estes modelos tentam prever o tempo de execução de tarefas ou a probabilidade de erro com base nas características da interface e nos processos cognitivos/motores do utilizador.

31. **What is the difference between a field evaluation and a laboratory evaluation? (Lecture 10, Slide 35)**
    *   **Laboratory Evaluation (Avaliação em Laboratório):** É realizada num **ambiente controlado**, como um laboratório de usabilidade. O experimentador tem controlo sobre as condições, o equipamento e pode observar e registar a interação de forma sistemática.
    *   **Field Evaluation (Avaliação no Terreno):** É realizada no **contexto natural de uso do sistema** pelos utilizadores (ex: na sua casa, no seu local de trabalho). O ambiente é menos controlado, mas mais realista.

32. **What advantages and disadvantages have field evaluations as compared to laboratory evaluations? (Lecture 10, Slide 35)**
    *   **Field Evaluations (Avaliações no Terreno):**
        *   **Vantagens:**
            *   **Maior realismo ecológico:** Observa o uso no contexto real, com as suas interrupções, pressões e ferramentas habituais, o que pode revelar problemas que não surgiriam em laboratório.
            *   **Comportamento mais natural dos utilizadores:** Os utilizadores estão no seu ambiente familiar.
        *   **Desvantagens:**
            *   **Menos controlo sobre variáveis:** Muitos fatores externos podem influenciar os resultados, dificultando a isolar causas.
            *   **Mais difícil de observar e registar dados:** Pode ser intrusivo ou logisticamente complicado.
            *   **Mais demorado e potencialmente mais caro.**
    *   **Laboratory Evaluations (Avaliações em Laboratório):**
        *   **Vantagens:**
            *   **Maior controlo sobre as variáveis:** Permite isolar o efeito de fatores específicos.
            *   **Facilidade de observação e registo:** Equipamento especializado pode ser usado.
            *   **Mais eficiente em termos de tempo** para testar múltiplos participantes.
        *   **Desvantagens:**
            *   **Menor realismo ecológico:** O ambiente artificial pode não refletir o uso real.
            *   **Comportamento dos utilizadores pode ser alterado:** (efeito Hawthorne, stress de estar a ser observado).




33. **What is the difference between analytical and empirical usability evaluation methods? (Lecture 10, Slide 5)**
    A principal diferença reside no **envolvimento (ou não) de utilizadores reais** no processo de avaliação:
    *   **Métodos Analíticos (ou de Inspeção):**
        *   **Não envolvem utilizadores finais** a interagir com o sistema.
        *   São realizados por **especialistas em usabilidade ou designers** que examinam a interface, muitas vezes usando o seu conhecimento, princípios de usabilidade (heurísticas) ou modelos de utilizador para identificar potenciais problemas.
        *   Exemplos: Avaliação Heurística, Percurso Cognitivo, Revisão de Conformidade com Diretrizes.
    *   **Métodos Empíricos:**
        *   **Envolvem utilizadores reais** representativos do público-alvo, a realizarem tarefas com o sistema (ou um protótipo).
        *   Os dados sobre a performance e satisfação dos utilizadores são recolhidos através de observação, questionários, entrevistas ou medições diretas.
        *   Exemplos: Testes de Usabilidade, Experiências Controladas, Estudos de Campo, Inquéritos (Questionários, Entrevistas quando aplicados a utilizadores que usaram o sistema).

34. **The Streamlined Cognitive Walkthrough is a simplified version of the original method. Which questions should be asked in each step? (Lecture 10, Slide 22)**
    O Percurso Cognitivo Simplificado (Streamlined Cognitive Walkthrough) reduz as quatro perguntas do método original para apenas **duas**, que são feitas para cada passo da tarefa:
    1.  **"O utilizador saberá o que fazer neste passo?"** (Esta pergunta engloba as três primeiras do CW original: o utilizador tentará o efeito correto? Notará a ação correta? Entenderá que a ação leva ao efeito desejado?)
    2.  **"Se o utilizador fizer a coisa certa, saberá que fez a coisa certa e que está a progredir em direção ao seu objetivo?"** (Esta corresponde à quarta pergunta do CW original sobre feedback e progresso.)

35. **Describe how you would perform a heuristic evaluation. (Lecture 10, Slides 11, 13)**
    Para realizar uma Avaliação Heurística, seguiria estes passos:
    1.  **Seleção de Avaliadores:** Reunir um pequeno grupo de avaliadores (idealmente 3-5), preferencialmente com conhecimento em usabilidade e, se possível, no domínio da aplicação.
    2.  **Preparação:**
        *   Fornecer aos avaliadores a lista de heurísticas de usabilidade a serem usadas (ex: as 10 de Nielsen ou um conjunto adaptado).
        *   Dar-lhes acesso à interface a ser avaliada (pode ser um protótipo ou o sistema funcional).
        *   Explicar o processo e o formato esperado para o registo dos problemas.
    3.  **Fase de Avaliação Individual (cada avaliador trabalha independentemente):**
        *   **Familiarização:** Cada avaliador explora a interface para ter uma ideia geral do seu funcionamento e âmbito.
        *   **Inspeção Detalhada:** Cada avaliador percorre a interface sistematicamente, comparando cada ecrã, diálogo e funcionalidade com as heurísticas.
        *   **Registo de Problemas:** Para cada problema de usabilidade encontrado, o avaliador regista:
            *   Uma descrição clara do problema.
            *   O local exato onde o problema ocorre.
            *   A(s) heurística(s) violada(s).
            *   Uma estimativa inicial da severidade do problema.
    4.  **Consolidação e Priorização:**
        *   Após as avaliações individuais, os problemas identificados por todos os avaliadores são compilados numa lista única, eliminando duplicados.
        *   Pode haver uma sessão de grupo (com os avaliadores ou um facilitador) para discutir os problemas, clarificar dúvidas e chegar a um consenso sobre a severidade de cada um.
    5.  **Criação do Relatório:** Preparar um relatório final que liste todos os problemas de usabilidade identificados, a sua localização, as heurísticas violadas e a sua severidade, com o objetivo de ajudar a equipa de desenvolvimento a priorizar as correções.

36. **When, along the interactive systems development process, should the Cognitive Walkthrough be used? Why? (Lecture 10, Slide 18)**
    O Percurso Cognitivo (Cognitive Walkthrough) deve ser usado **em fases iniciais do processo de desenvolvimento**, idealmente **antes de qualquer codificação significativa** ter sido feita.
    *   **Porquê:**
        *   **Foco na Aprendizibilidade:** O CW é especialmente bom para avaliar quão fácil é para um novo utilizador aprender a usar o sistema. Identificar problemas de aprendizibilidade cedo é crucial.
        *   **Baixo Custo de Correção:** Encontrar e corrigir problemas em protótipos de baixa fidelidade, storyboards ou especificações de design é muito mais barato e rápido do que alterar código já implementado.
        *   **Orientação para o Design:** Os resultados do CW podem informar diretamente as decisões de design subsequentes, ajudando a criar fluxos de tarefas mais intuitivos.
        *   **Não requer um sistema funcional:** Pode ser aplicado a representações do design, como mockups ou protótipos de papel.

37. **Describe how you would perform a Streamlined Cognitive Walkthrough. (Lecture 10, Slides 19, 22, 23)**
    Para realizar um Percurso Cognitivo Simplificado:
    1.  **Preparação:**
        *   **Definir o Utilizador-Alvo:** Ter uma ideia clara do perfil do utilizador (ex: novo utilizador, com certas características). Personas podem ser úteis.
        *   **Selecionar Tarefas:** Escolher tarefas representativas que um novo utilizador realizaria.
        *   **Análise de Tarefas:** Decompor cada tarefa numa sequência de ações (passos) que o utilizador idealmente seguiria para completar a tarefa com sucesso, e as respostas esperadas do sistema para cada ação.
        *   **Reunir a Equipa de Avaliação:** Tipicamente designers, programadores e talvez um especialista em usabilidade (que pode atuar como facilitador).
        *   **Ter o Protótipo/Design:** A interface a ser avaliada (mesmo que seja um protótipo de papel ou wireframes).
    2.  **Sessão de Percurso (Walkthrough):**
        *   A equipa percorre cada tarefa, passo a passo, como se fossem o utilizador.
        *   **Para cada passo da tarefa, a equipa tenta responder às duas perguntas-chave:**
            1.  **"O utilizador saberá o que fazer neste passo?"**
            2.  **"Se o utilizador fizer a coisa certa, saberá que fez a coisa certa e que está a progredir em direção ao seu objetivo?"**
        *   **Contar uma "História de Sucesso":** Para cada pergunta, a equipa tenta construir uma história credível de porquê o utilizador teria sucesso. Se a história não for convincente, é um potencial problema de usabilidade.
        *   **Registo de Problemas:** Anotar todos os problemas identificados, as razões pelas quais são problemas (ligando às perguntas) e quaisquer sugestões de melhoria.
        *   **Foco:** Manter o foco na perspetiva do utilizador e evitar discussões de design ou justificações durante o percurso.
    3.  **Relatório e Redesenho:**
        *   Compilar os problemas identificados num relatório.
        *   Usar os resultados para informar o redesenho da interface e corrigir os problemas de aprendizibilidade.

38. **Observation is a usability evaluation method used in usability testing and it may be direct or indirect; what are the advantages and disadvantages of each of these variants of observation? (Lecture 10, Slide 36)**
    *   **Observação Direta:** O observador está presente (fisicamente ou virtualmente) e toma notas enquanto o utilizador interage com o sistema.
        *   **Vantagens:**
            *   **Simples e de baixo custo:** Pode ser feita com poucos recursos (papel e caneta).
            *   **Flexibilidade:** O observador pode notar nuances e comportamentos inesperados que uma gravação poderia perder.
            *   **Possibilidade de clarificação imediata (com cautela):** Em alguns protocolos, o observador pode fazer perguntas de clarificação (embora geralmente se evite para não influenciar).
        *   **Desvantagens:**
            *   **Efeito do Observador (Hawthorne Effect):** A presença do observador pode fazer com que o utilizador se comporte de forma diferente do normal.
            *   **Enviesamento do Observador:** As notas e interpretações podem ser influenciadas pela subjetividade do observador.
            *   **Pode perder detalhes:** É difícil para um único observador capturar todas as ações, expressões e comentários, especialmente em interações rápidas.
            *   **Demorado para múltiplas sessões:** Requer a presença do observador em cada sessão.
    *   **Observação Indireta:** A interação do utilizador é registada (ex: através de áudio, vídeo, software de logging de ecrã) para análise posterior. O observador não está necessariamente presente durante a sessão.
        *   **Vantagens:**
            *   **Registo Permanente e Detalhado:** Permite rever a sessão várias vezes, por diferentes pessoas, e analisar detalhes que poderiam ter sido perdidos.
            *   **Menor Efeito do Observador:** Se o utilizador não estiver ciente da gravação (com consentimento prévio para o estudo em geral) ou se a gravação for discreta, o comportamento pode ser mais natural.
            *   **Análise mais aprofundada:** Permite a codificação de comportamentos, contagem de eventos, etc.
            *   **Partilha fácil:** Os registos podem ser partilhados com a equipa.
        *   **Desvantagens:**
            *   **Mais complexa e potencialmente mais cara:** Requer equipamento e software de gravação e mais tempo para configurar e analisar os dados.
            *   **Volume de dados:** Pode gerar uma grande quantidade de dados para analisar, o que é moroso.
            *   **Questões de privacidade e consentimento** para gravação são mais proeminentes.
            *   Pode perder o contexto ou as nuances que um observador presente notaria (ex: frustração não verbalizada).