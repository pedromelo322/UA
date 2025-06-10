## Tema Central: Estilos de Interaçãov

A aula começa por definir estilos de interação, revisita as regras de ouro de Shneiderman como princípios fundamentais, e depois explora uma classificação de estilos de interação, aprofundando os menus e os formulários (fill-in forms).

Vamos detalhar os slides:

**Introdução e Princípios Fundamentais (Slides 2-6)**

*   **Slide 2 (Capa Visual):** Mostra exemplos visuais de diferentes estilos de interação: interface móvel (toque, ícones), menus em software desktop, gestos ("fling"), e interação em Realidade Virtual.
*   **Slide 3 (Definição de Estilos de Interação):**
    *   "O conceito de Estilos de Interação refere-se a todas as formas como o utilizador pode comunicar ou interagir de outra forma com o sistema computacional." (Soegaard)
    *   Menciona que existem muitos estudos e diretrizes de design.
*   **Slide 4 (Oito Regras de Ouro de Shneiderman para o Design de Diálogo):** Estas são apresentadas como "primordiais no processo de design de UI".
    1.  **Lutar pela consistência (Strive for consistency):** Ações, terminologia, layouts semelhantes devem ser consistentes.
    2.  **Permitir que utilizadores frequentes usem atalhos (Enable frequent users to use shortcuts):** Para aumentar a eficiência.
    3.  **Oferecer feedback informativo (Offer informative feedback):** Para cada ação do utilizador.
    4.  **Desenhar diálogos para produzir fecho (Design dialogues to yield closure):** Sequências de ações devem ter um início, meio e fim bem definidos.
    5.  **Oferecer tratamento simples de erros (Offer simple error handling):** Prevenir erros e facilitar a sua recuperação.
    6.  **Permitir fácil reversão de ações (Permit easy reversal of actions):** Encoraja a exploração.
    7.  **Suportar o locus de controlo interno (Support internal locus of control):** O utilizador deve sentir que está no controlo.
    8.  **Reduzir a carga da memória de curto prazo (Reduce short-term memory load):** Promover reconhecimento em vez de recordação.
*   **Slide 5 (Detalhe de duas regras de Shneiderman):**
    *   **Suportar o locus de controlo interno:**
        *   Permitir que os utilizadores sejam os iniciadores das ações.
        *   Dar aos utilizadores a sensação de que estão no controlo dos eventos.
    *   **Desenhar diálogo para produzir fecho:**
        *   Não deixar os utilizadores a adivinhar.
        *   Informá-los sobre o resultado da sua ação (ex: mensagem "Ficheiro enviado com sucesso!").
*   **Slide 6 (Detalhe de mais duas regras de Shneiderman):**
    *   **Permitir fácil reversão de ações:**
        *   Encoraja a exploração de opções desconhecidas (ex: CTRL+Z para anular).
    *   **Permitir que utilizadores frequentes usem atalhos:**
        *   Exemplos comuns: CTRL+S para guardar, CTRL+C para copiar.

**Classificação de Estilos de Interação (Slide 7)**

*   Apresenta uma **classificação possível** de estilos de interação:
    *   **Menus**
    *   **Preenchimento de formulários (Fill-in-forms)**
    *   **Manipulação direta (Direct manipulation)**
    *   **Teclas de função (Function keys)**
    *   **Linguagens de comando (Command languages)**
    *   **Linguagens naturais (Natural languages)**
    *   **... (outros)**
*   Menciona que frequentemente dois ou mais estilos são usados em simultâneo.
*   Lista **interfaces de utilizador menos tradicionais**:
    *   Interfaces 3D
    *   Interfaces conversacionais
    *   Interfaces tangíveis
    *   etc.

**Estilo de Interação: Menus (Slides 8-31)**

*   **Slide 9 (Menus - Conceito):**
    *   O conceito já existia muito antes dos computadores (ex: menus de restaurante).
    *   Baseiam-se na **seleção de opções**.
    *   Existem vários tipos.
*   **Slide 10 (Menus Icónicos):** Exemplos de interfaces onde ícones representam opções ou aplicações (smartwatch, barras de ferramentas, ecrãs iniciais de tablets).
*   **Slide 11 (Menus Textuais):** Exemplos de menus onde as opções são primariamente texto. Introduz **menus pull-down / pull-up**.
*   **Slide 12 (Menus em Cascata - Cascading menus):** Menus que se expandem para revelar sub-menus.
*   **Slide 13 (Menus Sempre Visíveis / Pop-ups):**
    *   **Sempre visíveis:** Barras de ferramentas com opções constantemente disponíveis.
    *   **Pop-ups (ou contextuais):** Menus que aparecem quando se clica (geralmente com o botão direito do rato) sobre um objeto, oferecendo ações relevantes para esse objeto/contexto.
*   **Slide 14 (Menus: Principais Vantagens e Desvantagens):**
    *   **Vantagens (potenciais, se bem desenhados):**
        *   Auto-explicativos.
        *   Não sobrecarregam a memória (reconhecimento em vez de recordação).
        *   Previnem erros de sintaxe (o utilizador não tem de escrever comandos).
        *   Melhorias visíveis (novas funcionalidades são fáceis de encontrar).
    *   **Desvantagens:**
        *   Não são eficientes (para utilizadores experientes ou tarefas repetitivas, podem requerer muitos cliques).
        *   Não são flexíveis (limitados às opções apresentadas).
        *   Não são práticos para muitas opções (menus muito longos ou profundos).
*   **Slide 15 (Perfil de Utilizador para quem os Menus são Adequados):**
    *   **Conhecimento e Experiência:**
        *   Baixa experiência com o sistema e com a tarefa.
        *   Uso frequente de *outros* sistemas (familiaridade com o paradigma de menus).
        *   Baixa literacia computacional.
    *   **Trabalho e Tarefa:**
        *   Baixa frequência de uso.
        *   Sem treino formal.
        *   Uso opcional.
        *   Tarefas altamente estruturadas.
*   **Slide 16 (Design de Menus: Aspetos Relevantes):**
    *   Estrutura do menu.
    *   Ordenação das opções.
    *   Seleção da opção.
    *   Invocação do menu (como o menu é acedido).
    *   Navegação dentro e entre menus.
*   **Slides 17-23 (Design de Menus: Diretrizes):**
    *   **Slide 17:**
        *   Adequar a estrutura do menu à estrutura da tarefa.
        *   Minimizar a profundidade aumentando a largura (dentro de limites razoáveis).
        *   Usar um método de ordenação adequado.
        *   Ser coerente (design, nomes das opções, etc.).
        *   Dar feedback de seleção ao utilizador.
        *   Incluir tooltips se os nomes ou ícones não forem auto-explicativos.
        *   Indicar opções atualmente indisponíveis.
    *   **Slides 18-20 (Card Sorting):**
        *   Usar "card sorting" para encontrar uma estrutura adequada. É um método de baixo custo que ajuda a entender como os utilizadores esperam encontrar funcionalidades, alinhando com os seus modelos mentais.
        *   O card sorting fornece informação sobre: terminologia, relações (proximidade, similaridade), categorias (grupos e seus nomes).
        *   Esta informação ajuda a decidir: como agrupar itens, como organizar e nomear conteúdos de menus, que palavras usar.
        *   Exemplo: organizar frutas e vegetais num supermercado.
    *   **Slides 21-23 (Ordenação Adequada de Opções):**
        *   Questão: Qual esquema de ordenação selecionar (ex: meses por ordem alfabética vs. ordem cronológica)?
        *   **Fluxograma de Decisão (Slide 22):**
            1.  Ordem convencional? (Sim -> Usar Convencional)
            2.  Frequência de uso? (Sim -> Usar Frequência de Uso)
            3.  Ordem de uso (sequência de tarefas)? (Sim -> Usar Ordem de Uso)
            4.  Ordem categórica? (Sim -> Usar Categórica)
            5.  (Senão) Usar Alfabética.
        *   **Slide 23 (Exemplos Visuais):** Mostra exemplos de ordenação convencional (meses), alfabética + frequência (fontes), por ordem de uso (menus de IDEs), categórica, e alfabética (países).
*   **Slide 24 (Dar Feedback de Seleção):** Exemplos visuais de como a interface indica que uma opção foi selecionada ou qual o estado atual de uma definição (ex: cor selecionada, item de menu destacado).
*   **Slide 25 (Indicar Opções Atualmente Indisponíveis):**
    *   Apresentar opções indisponíveis a cinzento ("greyed out").
    *   Isto permite que os utilizadores saibam que a opção existe (funcionalidade) mas que não está disponível no contexto atual, prevenindo erros.
*   **Slides 26-27 (Distinguir Escolha Única de Múltipla):**
    *   **"Radio button":** Apenas uma opção pode ser selecionada de um grupo mutuamente exclusivo.
    *   **"Check box":** Permite uma escolha binária (ligado/desligado) para cada item; numa série, várias podem ser selecionadas.
    *   Slide 27 mostra exemplos práticos desta distinção.
*   **Slide 28 (Mostrar Formas Alternativas de Aceder à Funcionalidade):**
    *   Usar **aceleradores (atalhos de teclado)**.
    *   Relaciona-se com a regra de Shneiderman sobre flexibilidade e eficiência de uso para utilizadores frequentes.
*   **Slide 29 (Incluir Tooltips):** Descrever opções se os nomes ou ícones não forem claros.
*   **Slide 30 (Tornar Claro que Existem Mais Opções):** Usar indicadores visuais (setas, "...") para mostrar que um menu se expande ou que uma caixa de diálogo será aberta.
*   **Slide 31 (Menus Pop-up / Contextuais):** Usar apenas para utilizadores experientes ou quando é muito importante não ocupar espaço no ecrã (ex: menu durante uma apresentação PowerPoint).

**Estilo de Interação: Preenchimento de Formulários (Fill-in Forms) (Slides 32-41)**

*   **Slide 32 (Transição):** Marca a passagem do estudo de Menus para Formulários. Pergunta "Porquê usar dois ou mais estilos em simultâneo?" (a resposta implícita é que diferentes estilos são adequados para diferentes tarefas ou partes de uma tarefa).
*   **Slide 33 (Exemplos Visuais de Formulários).**
*   **Slide 34 (Contexto dos Formulários):**
    *   Particularmente úteis para trabalho rotineiro, administrativo ou tarefas que requerem muita entrada de dados.
    *   O conceito já existia há muito tempo (formulários em papel).
    *   Atualmente, são frequentemente usados com outros estilos.
*   **Slide 35 (Principais Vantagens e Desvantagens dos Formulários):**
    *   **Vantagens (potenciais):**
        *   Auto-explicativos.
        *   Reconhecimento em vez de recordação.
        *   Permitem muitos tipos diferentes de input (ao contrário dos menus que são só seleção).
        *   Dão contexto e guiam o utilizador.
        *   Nova funcionalidade é visível (ao contrário de linguagens de comando).
    *   **Desvantagens:**
        *   Implicam conhecimento das entradas válidas (o utilizador precisa de saber o que colocar).
        *   Propensos a erros (entrada de dados incorreta).
        *   Não são muito flexíveis (estrutura rígida).
*   **Slide 36 (Design de Formulários: Aspetos Relevantes):**
    *   Organização e layout.
    *   Títulos e campos.
    *   Formatos de entrada.
    *   Instruções e ajuda.
    *   Navegação (entre campos).
    *   Tratamento de erros.
*   **Slides 37-41 (Design de Formulários: Diretrizes):**
    *   **Slide 37 (Layout):** Evitar layouts não familiares. A ordem dos campos deve seguir uma lógica natural (ex: Nome, Morada, Código Postal, Cidade, País é mais comum que a ordem do exemplo "mau").
    *   **Slide 38 (Combinar Estilos e Formatos Ambíguos):**
        *   Fornecer um menu quando as entradas possíveis são conhecidas (ex: dropdown para selecionar estação de comboio, calendário para datas). Isto combina formulários com menus.
        *   Fornecer um formato para campos que podem ser ambíguos (ex: MM/AA para data de validade).
    *   **Slide 39 (Mostrar Campos Obrigatórios):** Geralmente indicado por um asterisco (*).
    *   **Slide 40 (Escolha do Tipo de Input / Adaptação ao Contexto):** Permitir que o utilizador escolha a unidade de medida (cm vs. polegadas) ou adaptar ao contexto regional. Previne erros.
    *   **Slide 41 (Instruções e Mensagens Claras):** As instruções para preencher campos devem ser claras, assim como as mensagens de erro (o exemplo da mensagem de erro em chinês ilustra uma má mensagem para um utilizador que não entenda chinês).

**Slide 42 (Bibliografia Principal):** Cita o livro de Shneiderman et al. e um artigo de Soegaard da Interaction Design Foundation.

**Take Away Geral da Aula:**

*   Estilos de interação são as diversas formas de comunicação entre utilizador e sistema.
*   As 8 Regras de Ouro de Shneiderman são princípios basilares para o design de qualquer diálogo interativo.
*   Existe uma variedade de estilos de interação (menus, formulários, manipulação direta, etc.), cada um com vantagens, desvantagens e adequação a diferentes tipos de utilizadores e tarefas.
*   O design de menus envolve considerar a estrutura, ordenação, seleção, invocação e navegação, com diretrizes específicas para cada aspeto (ex: usar card sorting, escolher métodos de ordenação adequados, dar feedback, indicar opções indisponíveis).
*   O design de formulários foca-se na organização, clareza dos campos, formatos de entrada, instruções, navegação e tratamento de erros (ex: usar layouts familiares, indicar campos obrigatórios, fornecer mensagens de erro úteis).
*   É comum e muitas vezes benéfico combinar diferentes estilos de interação numa mesma interface.




















## Tema Central: Design de Ecrã e Uso da Cor

A aula foca-se em fornecer diretrizes para um bom design de layout de ecrã, incluindo a disposição da informação, o uso de texto e números, e a aplicação de técnicas de codificação visual. Depois, mergulha no complexo tópico da cor, explicando a sua perceção, vantagens, desvantagens e diretrizes para o seu uso, incluindo considerações sobre deficiências de visão de cores e modelos de cor.

Vamos detalhar os slides:

**Design de Ecrã (Screen Design - Slides 2-28)**

*   **Slide 3 (Importância do Design de Ecrã):**
    *   É uma parte importante do desenvolvimento da UI.
    *   Um mau design de ecrã pode degradar a performance do utilizador.
    *   O layout do ecrã deve ser cuidadosamente desenhado.
    *   Existem numerosas diretrizes (algumas já vistas).
*   **Slide 4 (Tipos de Diretrizes para Layout de Ecrã):**
    *   Layout geral da informação.
    *   Texto (mensagens, instruções).
    *   Números.
    *   Técnicas de codificação (cor e outras).
*   **Slide 5 (Layout da Informação - Diretrizes Gerais):**
    *   **Incluir apenas a informação necessária.**
    *   **Incluir toda a informação necessária.** (Equilíbrio entre os dois pontos anteriores).
    *   Começar no canto superior esquerdo e alinhar à esquerda (em culturas ocidentais).
    *   Agrupar itens por tipo (usar caixas para agrupar itens lógicos).
    *   Deixar bastante espaço em branco (white space) para evitar poluição visual.
    *   Usar "leaders" (ex: pontilhado ou linhas) em múltiplas colunas para guiar o olho.
    *   Relacionado com a forma como os humanos analisam uma imagem (princípios da Gestalt).
*   **Slide 6 (Leis da Gestalt):** Ajudam a entender como os estímulos visuais numa cena são percebidos.
    *   **Proximidade:** Estímulos próximos são percebidos como um grupo.
    *   **Similaridade:** Estímulos similares tendem a ser agrupados (pode sobrepor-se à proximidade).
    *   **Fechamento (Closure):** Estímulos tendem a ser agrupados em figuras completas (o cérebro "preenche" as lacunas).
    *   **Simplicidade (Prägnanz):** Estímulos ambíguos tendem a ser resolvidos usando a explicação mais simples.
    *   **Boa Continuação:** Estímulos tendem a ser agrupados de forma a minimizar variações ou descontinuidades (o olho segue o caminho mais suave).
    *   **Simetria:** Regiões delimitadas por simetria tendem a ser percebidas como figuras coerentes.
*   **Slide 7 (Leis da Gestalt Aplicadas ao Design de Layout):** Mostra um exemplo de um website onde estes princípios são (ou deveriam ser) aplicados para organizar a informação visualmente.
*   **Slide 8 (Regra Simples para Design de Ecrã):** "O que é similar deve estar junto" (Princípio da Proximidade e Similaridade da Gestalt). Exemplo: detalhes de faturação e entrega separados, mas detalhes do pedido agrupados.
*   **Slide 9 (Incluir apenas a informação necessária):** **Evitar Poluição Visual (Visual Clutter).** Um diagrama técnico excessivamente detalhado ilustra o que não fazer.
*   **Slides 10-12 (Diretrizes para Texto):**
    *   **Slide 10:**
        *   Evitar usar apenas letras maiúsculas (são mais difíceis de ler).
        *   Evitar texto com muitas letras maiúsculas.
        *   Não usar demasiadas fontes para dar ênfase (usar com moderação).
        *   Em múltiplas colunas, usar "leaders" (linhas) ou "greying" (sombreamento alternado de linhas) para facilitar a leitura horizontal.
    *   **Slide 11:** Texto alinhado à esquerda é mais legível. Texto alinhado à direita pode ser usado para efeitos, mas é mais difícil de ler.
    *   **Slide 12:** Ilustra o uso de "leaders" e "greying" para facilitar a leitura em colunas.
*   **Slides 13-15 (Diretrizes para Mensagens):**
    *   **Slide 13 (Características das Mensagens):**
        *   Nível de detalhe adequado ao conhecimento e experiência do utilizador.
        *   Específicas e compreensíveis.
        *   Breves e concisas.
        *   Positivas (quando possível).
        *   Úteis (oferecer soluções ou próximos passos).
    *   **Slide 14 (Mensagens de Erro - Antes e Depois):** Mostra exemplos de como melhorar mensagens de erro, tornando-as menos verbosas, mais específicas, menos vagas, menos negativas e mais úteis.
    *   **Slide 15 (Exemplos de Mensagens Inúteis):** Mensagens genéricas ("Something happened"), em língua estrangeira para o utilizador, ou códigos de erro crípticos.
*   **Slides 16-18 (Diretrizes para Números):**
    *   **Slide 16:**
        *   Inteiros devem ser alinhados à direita.
        *   Números reais devem ser alinhados pelo ponto decimal.
        *   Evitar zeros desnecessários à esquerda.
        *   Números longos devem ser divididos em grupos (ex: números de telefone, cartão de crédito).
    *   **Slide 17:** Ilustra a dificuldade de comparar números não alinhados e a facilidade quando alinhados corretamente.
    *   **Slide 18:** Mostra exemplos de formatação "antes e depois" para números, demonstrando as diretrizes.
*   **Slide 19 (Técnicas de Codificação):** Várias formas de destacar ou diferenciar informação:
    *   Piscar (Blinking), Negrito (Bold), Tamanho (Size), Fonte (Font), Sublinhado (Underlining), Forma (Shape), Caracteres especiais e ícones, Proximidade, Bordas (Borders), Som (Sound), Cor (Colour).
    *   **Diretriz Principal:** Usar qualquer técnica de codificação com **parcimónia** (moderação) para não sobrecarregar o utilizador.
*   **Slides 20-22 (Design para Ecrãs Grandes - Large Displays):**
    *   **Slide 21 (Problemas Específicos):** O design para ecrãs grandes é diferente devido a: tamanho, ângulo de visão, distância de visualização.
    *   **Slide 22 (Diretrizes para Ecrãs Grandes):**
        *   **Aproveitar o Espaço Extra:** Mostrar mais conteúdo, usar layouts multicoluna, margens e fontes maiores.
        *   **Priorizar a Hierarquia da Informação:** Composição visual, agrupar elementos relacionados, garantir alcançabilidade (elementos importantes não devem estar muito distantes).
        *   **Movimento e Animações:** Devem ser mais lentos para distâncias maiores, para não serem desconfortáveis.
*   **Slides 23-28 (Design para Plataformas Específicas):**
    *   **Slide 24 (Mobile):**
        *   Muitas diretrizes são similares ao desktop, mas a interpretação em mobile é **muito mais implacável** devido a: contexto de uso (em movimento, distrações), tamanho do ecrã (limitado), limitações da plataforma.
        *   Existem diretrizes específicas para Android e iOS.
    *   **Slide 25 (Wearables - Dispositivos Vestíveis):**
        *   **Glanceability:** Informação deve ser compreensível num relance rápido.
        *   **Keep it simple:** Simplicidade é chave.
        *   **Interface Minimalista.**
        *   Considerar também: Privacidade e conectividade sem fios.
    *   **Slides 26-28 (Situação Crítica: Painéis Automóveis - Automotive Dashboards):**
        *   Ilustra como um mau design pode ser perigoso.
        *   **O Caso Tesla (Slide 27):** Um exemplo de interface tátil num carro.
        *   **Slide 28:** Fabricantes precisam de examinar se as suas estratégias de ecrã no carro não estão a sacrificar funções críticas, especialmente a segurança. A tarefa primária é conduzir; a navegação na interface é secundária e pode desviar a atenção visual, aumentando o risco de acidentes.

**Uso da Cor (Colour Usage - Slides 29-47)**

*   **Slide 30 (Cor - Complexidade):**
    *   Assunto complexo e multidisciplinar (Física, Fisiologia e Psicologia, Arte e Design Gráfico, Design de Sistemas Interativos).
    *   A cor percebida de um objeto depende de: características do material, iluminação, cor ambiente, sistema visual humano.
*   **Slides 31-32 (Poder da Cor):**
    *   Imagem a preto e branco dificulta a contagem de cerejas.
    *   Com cor, a tarefa torna-se trivial.
    *   **A cor pode apoiar os utilizadores em muitas tarefas! (mas, se mal usada, pode dificultá-las).**
*   **Slide 33 (Vantagens de Usar Cor):**
    *   Aumentar o realismo.
    *   Mostrar a organização lógica da informação.
    *   Facilitar a procura em ecrãs complexos.
    *   Representar valores aproximados (ex: mapas de calor).
    *   Chamar a atenção.
    *   Aumentar a satisfação.
    *   Desencadear emoções.
    *   **Contudo, pode degradar a performance se não usada corretamente.**
*   **Slide 34 (Diretrizes para Usar Cor):**
    *   **Usar cor com parcimónia.**
    *   Usar um número limitado de cores.
    *   **Primeiro, fazer funcionar sem cor** (design a preto e branco primeiro).
    *   Usar cor de forma coerente (mesma cor para o mesmo significado).
    *   Evitar usar simultaneamente várias cores saturadas (pode ser cansativo e vibrar visualmente).
    *   **Não transmitir informação unicamente através da cor** (importante para acessibilidade - daltonismo).
    *   Fazer com que a codificação por cores apoie a tarefa do utilizador.
    *   Tornar a codificação por cores o mais óbvia possível.
    *   Levar em conta o significado cultural das cores.
*   **Slide 35 (Significado Cultural das Cores):** Exemplo de um mapa de mercado de ações onde vermelho (tipicamente negativo no Ocidente) e verde (positivo) são usados para indicar perdas e ganhos.
*   **Slide 36 (Cores Complementares Saturadas):** Não devem ser usadas simultaneamente (ex: verde brilhante sobre vermelho brilhante), pois causam fadiga visual e podem parecer vibrar.
*   **Slide 37 (Pequenos Pontos de Cor):** Pequenos pontos de cor num fundo neutro realçam informação relevante (princípio de Tufte).
*   **Slide 38 (Cor e Ordem):** Não se deve esperar que os utilizadores percebam uma ordem intrínseca apenas pela cor (ex: uma sequência de vermelho, amarelo, verde, azul não transmite uma ordem clara sem legenda, ao contrário de uma escala de cinzentos do escuro para o claro).
*   **Slide 39 (Outras Diretrizes):**
    *   Não usar codificação por cores em elementos muito pequenos (difícil de distinguir).
    *   Usar um fundo cinzento neutro quando o julgamento preciso da cor é crítico (para evitar interferência da cor de fundo).
*   **Slide 40 (Cor Pode Dificultar):**
    *   Mapa A (muitas cores diferentes) não permite uma associação pré-atenta eficiente para determinar valores.
    *   Mapa B (uma única tonalidade numa escala sequencial) representa valores de forma imediatamente compreensível.
*   **Slides 41-42 (Escalas de Cor):**
    *   **Slide 41 (Escalas Qualitativas):** Para distinguir itens ou grupos. As cores são escolhidas para serem claramente distintas e não se destacarem umas em relação às outras (ex: Okabe Ito, ColorBrewer Dark2).
    *   **Slide 42 (Escalas Sequenciais):** Para representar valores quantitativos. As cores devem indicar quais os valores maiores ou menores e quão distantes estão. Podem ser **monocromáticas** (variações de uma única cor), **divergentes** (duas cores que divergem de um ponto central neutro), etc.
*   **Slides 43-47 (Deficiências de Visão de Cores - Daltonismo):**
    *   **Slide 43 (Estatísticas e Causas):** Afeta ≈8% dos homens e 1% das mulheres (genético, ligado ao cromossoma X). Deficiências comuns (dicromacias) são devidas à falta de cones sensíveis a comprimentos de onda longos (Protanopia - "vermelho") ou médios (Deuteranopia - "verde", a forma mais comum de daltonismo). Existem também Monocromacia e Tricromacia Anómala.
    *   **Slide 44 (Cores do Arco-Íris Vistas por Daltónicos):** Mostra como o arco-íris é percebido com diferentes tipos de deficiência.
    *   **Slide 45 (Simulação - Mercado):** Imagem original vs. como é vista por um deuteranope.
    *   **Slide 46 (Simulação - Teste de Ishihara):** Mostra como os números no teste de Ishihara são percebidos (ou não) por pessoas com diferentes deficiências.
    *   **Slide 47 (Design Inclusivo):**
        *   Elementos que parecem idênticos para daltónicos se apenas a cor os distingue.
        *   **"Faz funcionar a preto e branco":** Se o design funciona sem cor, funcionará melhor para todos.
        *   Usar diferenças que não dependem da cor (forma, padrão, texto) para discriminar elementos.

**Modelos de Cor (Slides 48-56)**

*   **Slide 48 (Descrever a Experiência da Cor):**
    *   Perceção da cor ocorre na mente devido a propriedades da luz.
    *   Descrições diferentes para: estímulos de luz (físicos - fotometria, colorimetria) e sensações de cor (subjetivas, mentais - atributos da cor).
    *   **Modelos de cor** permitem descrever a cor objetivamente.
*   **Slide 49 (Visualização de Modelos de Cor):** HLS, RGB, HSV.
*   **Slide 50 (Perceção e Produção de Cor):**
    *   Cor percebida depende do espectro da luz refletida ou emitida.
    *   Diferentes espectros podem induzir sensações de cor similares (metamerismo).
    *   Sistemas de produção de cor:
        *   **Aditivos (luz):** Monitores, TVs, projetores -> **RGB** (Red, Green, Blue).
        *   **Subtrativos (pigmento):** Impressoras -> **CMY(K)** (Cyan, Magenta, Yellow, Key/Black).
    *   RGB e CMY são modelos orientados ao hardware, não muito adequados para a especificação de cor pelos utilizadores.
*   **Slide 51 (Modelo RGB):** Aditivo; vermelho, verde e azul são primários; espaço de cor é um cubo. Branco (1,1,1), Preto (0,0,0).
*   **Slide 52 (Modelo CMY):** Subtrativo; ciano, magenta e amarelo são primários; espaço de cor também um cubo. Branco (0,0,0), Preto (1,1,1) (em teoria, na prática usa-se K para preto puro). Menciona que HSV e HLS são mais adequados para utilizadores.
*   **Slide 53 (Variáveis Psicofísicas da Cor):**
    *   **Hue (Matiz/Tonalidade):** A cor "pura" (vermelho, verde, azul, amarelo).
    *   **Saturation (Saturação):** A "pureza" ou intensidade da cor (quantidade de luz acromática/cinza misturada).
    *   **Lightness (Luminosidade):** Para objetos refletores (quão claro ou escuro).
    *   **Brightness (Brilho):** Para objetos emissores de luz.
*   **Slide 54 (Modelos HLS e HSV):**
    *   Dois modelos mais adequados para os utilizadores selecionarem cores.
    *   Ambos usam coordenadas cilíndricas, matiz (hue) e saturação.
    *   **HLS (Hue, Lightness, Saturation):** Mais adequado para impressão.
    *   **HSV (Hue, Saturation, Value/Brightness):** Mais adequado para ecrãs.
*   **Slide 55 (Modelo HSV):**
    *   **Hue:** A cor (0-360 graus).
    *   **Saturation:** Quantidade de luz acromática.
    *   **Value (ou Brightness):** Controla o brilho: 0% (preto puro) a 100% (branco puro, se saturação for 0, ou cor pura, se saturação for 100%).
    *   Usa coordenadas cilíndricas.
*   **Slide 56 (Seletores de Cor):** Mostra como os modelos HSL e RGB são apresentados em interfaces para o utilizador selecionar cores.

**Take Away Geral da Aula:**

*   O design do ecrã é fundamental para a performance do utilizador. Diretrizes de layout (baseadas em Gestalt, uso de espaço em branco, alinhamento) e tipografia são importantes.
*   Mensagens e apresentação de números também requerem cuidado.
*   Técnicas de codificação visual devem ser usadas com moderação.
*   O design para ecrãs grandes e plataformas específicas (mobile, wearables, automóvel) tem considerações particulares.
*   A cor é uma ferramenta poderosa, mas complexa. Pode melhorar a usabilidade, mas também degradá-la se mal usada.
*   Diretrizes para o uso da cor incluem parcimónia, consistência, testar a preto e branco primeiro, e **nunca usar cor como único meio de transmitir informação** (acessibilidade).
*   É crucial considerar deficiências de visão de cores.
*   Modelos de cor como RGB e CMY são orientados ao hardware, enquanto HSL e HSV são mais intuitivos para a seleção de cores pelos utilizadores.




## Interaction Styles

1.  **Why is it common to combine several interaction styles in the same user interface?**
    É comum combinar vários estilos de interação porque:
    *   **Diferentes tarefas são mais bem suportadas por diferentes estilos:** Por exemplo, a seleção de opções de um conjunto conhecido é bem servida por menus, enquanto a entrada de dados textuais complexos pode necessitar de um formulário ou até de uma linguagem de comando para tarefas muito específicas.
    *   **Diferentes níveis de experiência do utilizador:** Utilizadores novatos podem preferir menus e formulários guiados, enquanto utilizadores experientes podem beneficiar de atalhos de teclado (function keys) ou linguagens de comando para maior eficiência.
    *   **Flexibilidade e Eficiência:** Oferecer múltiplos caminhos para realizar uma tarefa (ex: via menu ou via atalho) aumenta a flexibilidade e pode melhorar a eficiência para diferentes utilizadores (Princípio de Shneiderman).
    *   **Riqueza da Interação:** A combinação pode tornar a interface mais rica, intuitiva e adaptada a uma gama mais vasta de necessidades e preferências.

2.  **Give an example of a common situation of combining two different interaction styles to better support users’ tasks.**
    Um exemplo muito comum é o **preenchimento de um formulário online (fill-in-form) que inclui menus dropdown.**
    *   **Fill-in-form:** Usado para a entrada de dados como nome, morada, email (onde o input é variado).
    *   **Menus (dropdown):** Usados para campos onde as opções são de um conjunto limitado e conhecido, como "País", "Estado Civil", ou "Tipo de Cartão de Crédito".
    *   **Benefício da combinação:** O formulário permite a entrada de dados abertos, enquanto os menus para campos específicos reduzem erros de digitação, garantem consistência nos dados (ex: nome do país), e facilitam a seleção (reconhecimento em vez de recordação).

3.  **What are the main potential advantages of menus? What is needed for these advantages to manifest in a user interface?**
    *   **Principais Vantagens Potenciais dos Menus (Lecture 7, Slide 14):**
        *   **Auto-explicativos:** As opções visíveis podem ajudar o utilizador a entender o que pode fazer.
        *   **Não sobrecarregam a memória (Reconhecimento vs. Recordação):** O utilizador vê as opções e escolhe, em vez de ter de se lembrar de comandos.
        *   **Previnem erros de sintaxe:** Como o utilizador seleciona opções em vez de digitar comandos, erros de digitação ou sintaxe são evitados.
        *   **Melhorias visíveis:** As opções e funcionalidades estão explicitamente listadas.
    *   **O que é necessário para que estas vantagens se manifestem (Lecture 7, Slide 17):**
        *   **Design adequado:** A estrutura do menu deve ser lógica e corresponder à estrutura das tarefas do utilizador.
        *   **Nomenclatura clara e consistente:** Os rótulos das opções devem ser inequívocos.
        *   **Organização e ordenação lógicas:** As opções devem ser agrupadas e ordenadas de forma intuitiva (ex: por frequência de uso, alfabeticamente, por categoria).
        *   **Feedback claro:** O utilizador deve receber feedback imediato quando uma opção é selecionada.
        *   **Indicação de opções indisponíveis:** Opções não aplicáveis no contexto atual devem ser visualmente indicadas (ex: a cinzento) para evitar confusão, mas mostrando que existem.
        *   **Minimizar profundidade:** Evitar demasiados níveis de menus em cascata.

4.  **Card sorting is an interesting method to use in menu design; describe how to use it in this context and what kind of information may provide.**
    *   **Como usar Card Sorting em Design de Menus (Lecture 7, Slide 18):**
        1.  **Preparação:** Escrever os itens de conteúdo, funcionalidades ou opções do menu em cartões individuais.
        2.  **Execução:** Pedir a utilizadores representativos (individualmente ou em pequenos grupos) para organizarem esses cartões em grupos que façam sentido para eles.
        3.  **Nomeação:** Após o agrupamento, pedir aos utilizadores para darem nomes a esses grupos (que podem tornar-se os rótulos dos menus de nível superior).
        4.  **Análise:** Analisar os agrupamentos e nomes criados por vários utilizadores para identificar padrões, consensos e divergências.
    *   **Que tipo de informação pode fornecer (Lecture 7, Slide 19):**
        *   **Terminologia do utilizador:** Como os utilizadores chamam e pensam sobre os itens.
        *   **Estrutura mental dos utilizadores:** Como eles agrupam logicamente a informação e as funcionalidades.
        *   **Relações entre itens:** Quais itens são percebidos como similares ou relacionados.
        *   **Rótulos para categorias:** Nomes intuitivos para os menus e submenus.
        *   Ajuda a criar uma arquitetura de informação e uma estrutura de menus que se alinhe com as expectativas e modelos mentais dos utilizadores.

5.  **What are the characteristics defining direct manipulation?**
    Manipulação Direta é um estilo de interação onde os utilizadores sentem que estão a operar diretamente nos objetos de interesse. As suas características definidoras (baseadas em Shneiderman) são:
    *   **Representação contínua dos objetos e ações de interesse:** Os objetos são visíveis no ecrã.
    *   **Ações físicas ou pressionar botões rotulados em vez de sintaxe complexa:** Interação através de apontar, clicar, arrastar, gestos.
    *   **Operações rápidas, incrementais e reversíveis, cujo impacto no objeto de interesse é imediatamente visível:** O utilizador vê o resultado das suas ações de forma imediata e pode facilmente "desfazer" (undo).
    Exemplos: arrastar um ficheiro para a reciclagem, redimensionar uma janela puxando os seus cantos, desenhar numa aplicação gráfica.

6.  **What are semantic and articulatory distances in direct manipulation user interfaces?**
    *   **Distância Semântica:** Refere-se à diferença entre os **objetivos e intenções do utilizador** e o **significado das ações e objetos oferecidos pela interface**. Uma baixa distância semântica significa que a interface fala a "língua" do utilizador e as suas funcionalidades correspondem diretamente ao que ele quer fazer.
    *   **Distância Articulatória:** Refere-se à diferença entre as **ações físicas que o utilizador tem de realizar** para interagir com a interface e as **operações mentais que o utilizador associa a essas ações para atingir o seu objetivo**. Uma baixa distância articulatória significa que as ações físicas são intuitivas, diretas e correspondem de perto à tarefa mental (ex: "arrastar para mover" tem baixa distância articulatória para a tarefa de mover um objeto).

7.  **Give examples illustrating user interfaces with different articulatory distance to delete a file.**
    *   **Baixa Distância Articulatória:**
        *   **Arrastar e Largar:** O utilizador clica no ícone do ficheiro e arrasta-o fisicamente para o ícone da reciclagem. A ação é muito próxima da metáfora de "deitar algo fora".
    *   **Média Distância Articulatória:**
        *   **Menu de Contexto:** O utilizador clica com o botão direito no ficheiro, um menu aparece, e ele seleciona a opção "Eliminar" ou "Mover para a Reciclagem". Requer alguns passos, mas ainda é visual e guiado.
        *   **Tecla Delete:** O utilizador seleciona o ficheiro e prime a tecla "Delete" no teclado. A ação é menos física, mas ainda direta após a seleção.
    *   **Alta Distância Articulatória:**
        *   **Linha de Comando:** O utilizador abre um terminal e digita um comando como `del nome_do_ficheiro.txt` ou `rm nome_do_ficheiro.txt`. Requer conhecimento da sintaxe exata e não há representação visual direta da ação no objeto.

8.  **What are the disadvantages of direct manipulation as interaction style?**
    *   **Dificuldade em lidar com tarefas abstratas ou complexas:** Algumas operações não têm uma representação visual óbvia ou são difíceis de expressar através de manipulação direta (ex: "encontrar todos os ficheiros modificados na última semana com mais de 10MB").
    *   **Pode ser menos eficiente para utilizadores experientes em tarefas repetitivas:** A manipulação física de objetos pode ser mais lenta do que usar comandos ou scripts para utilizadores avançados.
    *   **Consumo de espaço no ecrã:** Requer que os objetos e as ferramentas de manipulação estejam visíveis.
    *   **Requer aprendizagem de gestos e metáforas:** Embora intuitiva, a "linguagem" visual e os gestos precisam de ser aprendidos.
    *   **Implementação pode ser complexa:** Requer um bom design gráfico e feedback visual imediato.
    *   **Acessibilidade:** Pode ser um desafio para utilizadores com deficiências motoras ou visuais se não forem fornecidas alternativas acessíveis.

9.  **State three guidelines to function key usage in an interactive system.**
    1.  **Consistência:** Usar teclas de função de forma consistente em toda a aplicação e, se possível, seguir convenções amplamente estabelecidas (ex: F1 para Ajuda).
    2.  **Rótulos Claros (On-screen):** Como o significado das teclas de função não é inerente, fornecer rótulos visíveis no ecrã que indiquem a sua função no contexto atual.
    3.  **Limitar o Número e Agrupar Logicamente:** Não atribuir funções a todas as teclas F1-F12 indiscriminadamente. Usar um conjunto limitado para as funções mais importantes ou frequentes e, se possível, agrupar funções relacionadas em teclas adjacentes ou de acordo com um padrão lógico.

10. **Compare the advantages of menu and fill-in-form user interfaces.**

    | Característica           | Menus                                      | Preenchimento de Formulários (Fill-in-Forms) |
    | :----------------------- | :----------------------------------------- | :------------------------------------------- |
    | **Principal Vantagem**   | Seleção de opções conhecidas, reconhecimento | Entrada de dados variados e múltiplos        |
    | **Carga Cognitiva**      | Baixa (reconhecimento)                     | Pode ser maior se os campos não forem claros |
    | **Prevenção de Erros**   | Alta para erros de sintaxe                 | Menor, depende da validação dos campos       |
    | **Flexibilidade de Input** | Baixa (opções pré-definidas)               | Alta (texto, números, datas, etc.)           |
    | **Orientação ao Utilizador** | Pode ser boa se bem estruturado            | Boa (rótulos guiam a entrada)                |
    | **Adequação**            | Novatos, tarefas estruturadas              | Tarefas de entrada de dados, rotineiras        |

11. **What are the main disadvantages of fill-in-form based user interfaces? (Lecture 7, Slide 35)**
    *   **Implica conhecimento das entradas válidas:** O utilizador precisa de saber que tipo de informação é esperado em cada campo.
    *   **Propenso a erros:** Erros de digitação ou de formato são comuns se não houver boa validação e feedback.
    *   **Pouco flexível:** O fluxo é geralmente linear e definido pelo formulário; pode ser rígido.
    *   **Consumo de espaço no ecrã:** Formulários longos podem ocupar muito espaço e requerer scrolling.
    *   **Pode ser moroso:** Preencher muitos campos pode ser tedioso.

12. **What techniques can be used to improve the usability of a command language?**
    *   **Sistema de Ajuda Integrado:** Comandos como `help` ou `man` (manual pages).
    *   **Conclusão Automática de Comandos (Command Completion):** Ex: pressionar Tab para completar um comando ou nome de ficheiro.
    *   **Sintaxe Consistente e Lógica:** Usar uma estrutura de comando previsível.
    *   **Abreviaturas e Aliases:** Permitir que utilizadores definam formas mais curtas para comandos longos ou sequências de comandos.
    *   **Feedback e Mensagens de Erro Claras:** Informar o utilizador sobre o sucesso ou falha de um comando e, em caso de erro, explicar o problema de forma útil.
    *   **Histórico de Comandos:** Permitir aceder e reutilizar comandos anteriores.
    *   **Scripting:** Possibilidade de criar scripts para automatizar sequências de comandos.

13. **What are the advantages and disadvantages of command languages concerning usability?**
    *   **Vantagens:**
        *   **Poder e Flexibilidade:** Permitem realizar operações complexas e granulares.
        *   **Eficiência para Utilizadores Experientes:** Uma vez aprendidos, podem ser muito rápidos.
        *   **Facilidade de Automatização (Scripting):** Ideal para tarefas repetitivas.
        *   **Baixo Consumo de Recursos:** Geralmente não requerem interfaces gráficas pesadas.
    *   **Desvantagens:**
        *   **Alta Curva de Aprendizagem:** Requerem memorização de comandos e sintaxe (recordação).
        *   **Intimidantes para Novatos:** Podem parecer complexos e pouco intuitivos.
        *   **Propensos a Erros de Sintaxe:** Pequenos erros de digitação podem impedir a execução.
        *   **Feedback Limitado:** Muitas vezes, o feedback é mínimo ou críptico.
        *   **Visibilidade Baixa:** As funcionalidades não estão visíveis; o utilizador precisa de saber o que existe.

14. **To what type of users are command languages more adequate?**
    Linguagens de comando são mais adequadas para:
    *   **Utilizadores Experientes e Técnicos:** Como programadores, administradores de sistemas, cientistas de dados.
    *   **Utilizadores Frequentes:** Que investem tempo para aprender os comandos e beneficiam da sua eficiência.
    *   **Utilizadores que precisam de poder e flexibilidade máximos** e que realizam tarefas complexas ou automatizadas.

15. **Give examples of CUIs (Conversational user interfaces).**
    *   **Assistentes de Voz:** Siri (Apple), Google Assistant, Amazon Alexa.
    *   **Chatbots:** Muitos websites de empresas usam chatbots para atendimento ao cliente ou para fornecer informação.
    *   **Sistemas IVR (Interactive Voice Response):** Menus de voz em linhas de apoio telefónico.
    *   Interfaces de conversação em aplicações de mensagens (ex: pedir uma pizza através de um bot no Messenger).

16. **What kind of input/output devices can be used in CUIs?**
    *   **Input:**
        *   **Microfone:** Para entrada de voz (o mais comum para assistentes de voz e IVR).
        *   **Teclado:** Para entrada de texto em chatbots.
    *   **Output:**
        *   **Altifalantes / Auscultadores:** Para saída de voz.
        *   **Ecrã / Display:** Para saída de texto (respostas de chatbots, transcrição da voz), e por vezes para apresentar elementos visuais complementares (cartões de informação, imagens).