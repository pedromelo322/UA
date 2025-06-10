## Tema Central: Modelos do Utilizador e Outros Modelos de Design**

Esta aula foca-se em dois tipos principais de modelos:
1.  **Modelos Mentais e Conceptuais:** Como o utilizador entende o sistema e como o designer projeta essa compreensão.
2.  **Modelos Práticos para o Desenvolvimento:** Ferramentas como Personas, Cenários e Análise de Tarefas usadas no processo de design.

Vamos detalhar:

**1. Modelos Mentais e Modelos Conceptuais (Slides 2-19)**

*   **Introdução (Slides 2-4):**
    *   A ponte entre o utilizador e a UI é feita através de modelos mentais e conceptuais.
    *   **Modelo Mental (Mental Model - Slide 4, 5, 6):** É a **representação interna e compreensão que o utilizador tem** sobre como um sistema funciona. Baseia-se nas suas experiências passadas, crenças e suposições. O utilizador usa o seu modelo mental para:
        *   Raciocinar sobre o sistema.
        *   Antecipar o comportamento do sistema.
        *   Explicar porque o sistema reage de uma certa forma.
    *   **Modelo Conceptual (Conceptual Model - Slide 4, 19):** É o **modelo que o designer cria e incorpora na interface (UI)**. É a estrutura conceptual de alto nível através da qual a funcionalidade é apresentada ao utilizador. O objetivo do designer é criar um bom modelo conceptual que ajude o utilizador a formar um modelo mental preciso e útil.
    *   **Relação Chave (Slide 4, 6):** O designer tem o seu modelo mental do sistema, que traduz num modelo conceptual (a "System Image" ou interface). O utilizador interage com a interface e forma o seu próprio modelo mental. Idealmente, o modelo mental do utilizador deve corresponder ao modelo conceptual do designer.

*   **Aprofundando os Modelos Mentais (Slides 5-13):**
    *   **Função (Slide 5, 9):** Ajudam a entender conceitos complexos, tomar decisões, resolver problemas, aprender e comunicar. Permitem fazer previsões, determinar causas de eventos, definir ações para atingir objetivos e entender dispositivos análogos.
    *   **Formação (Slide 10, 11):** São criados através de:
        *   Uso do sistema.
        *   Observação de outros a usar o sistema.
        *   Leitura de documentação.
        *   Estas são formas importantes de treinar o utilizador.
    *   **Características e Problemas (Slide 8, 12):**
        *   São muitas vezes **incompletos**.
        *   São **instáveis** (detalhes são esquecidos).
        *   **Não são científicos** (podem incluir comportamentos "supersticiosos" - se algo funcionou uma vez por acaso, o utilizador pode repetir).
        *   **Não têm limites específicos** (pode-se confundir operações entre dispositivos semelhantes).
        *   Utilizadores podem realizar ações extra em vez de planear.
        *   **Modelos mentais desalinhados** (mismatched mental models) são comuns, especialmente com designs inovadores, levando a baixa eficiência, eficácia e satisfação (má usabilidade e UX - Slide 8, exemplo do comando do projetor).
    *   **Citação de Donald Norman (Slide 13):** Devemos focar-nos em entender os modelos incompletos e confusos que as pessoas realmente têm, e criar modelos conceptuais que levem isso em consideração.

*   **Modelos Conceptuais e Diretrizes para Criá-los (Slide 14-19):**
    *   O objetivo é **promover bons modelos mentais** nos utilizadores.
    *   **Diretrizes Principais (Slide 14):**
        1.  **Tornar visíveis partes e processos invisíveis:** Ex: barra de progresso para cópia de ficheiros.
        2.  **Dar feedback:** Mostrar ao utilizador o resultado das suas ações.
        3.  **Usar coerência (consistência):** Em cores, nomes, sintaxe de comandos, estilos de diálogo, localização da informação. Ajuda na previsibilidade.
        4.  **Usar uma metáfora (opcional):**
            *   **Metáforas (Slides 15-18):**
                *   Exploram modelos mentais existentes do mundo real (ex: "ambiente de trabalho" - desktop metaphor, "quadro de avisos" - Trello).
                *   **Podem ser enganosas (misleading)** porque uma metáfora nunca é uma representação perfeita; é entender uma coisa em termos de outra (Slide 15).
                *   **Problemas Potenciais (Slide 17):** Metáforas incompletas podem confundir; risco de subutilização das capacidades do sistema; utilizadores menos experientes esperam metáforas mais literais, enquanto utilizadores sofisticados podem esperar metáforas mais "mágicas". O uso deve ser ponderado.
                *   Exemplos de quebra da metáfora literal (Slide 18): arrastar a disquete para o lixo para ejetar (Apple); "teleportação" em VR como metáfora mágica para navegação.
    *   **Take Away sobre Modelos Conceptuais (Slide 19):**
        *   São uma descrição de alto nível do produto (o que os utilizadores podem fazer com ele, os conceitos que precisam entender).
        *   Desenvolvê-los envolve entender o espaço do problema e especificar como o design vai apoiar os utilizadores.
        *   **Devem promover bons modelos mentais.**

**2. Outros Modelos para o Desenvolvimento de Sistemas Interativos (Slides 21-60)**

*   **Contexto (Slide 21, 22):** Estes modelos são ferramentas usadas no processo de design centrado no utilizador, especialmente na fase de análise de requisitos. O Slide 22 mostra como Personas, Cenários e Análise de Tarefas ajudam a entender utilizadores, contextos e tarefas para definir requisitos.

*   **Modelos de Utilizador Específicos (Slide 23):**
    *   **Modelos Preditivos:** GOMS, KLM, **Lei de Fitts (Fitts' Law)**.
    *   **Lei de Fitts (Slides 24, 25):**
        *   Modelo empírico que descreve o compromisso velocidade-precisão no movimento muscular humano.
        *   Estima o tempo médio para selecionar um alvo, considerando a distância (D) ao alvo e a largura (W) do alvo.
        *   **Implicações:** Alvos maiores são mais fáceis/rápidos de selecionar; alvos mais próximos são mais rápidos de selecionar.
        *   Exemplo de uso em pesquisa de VR para tamanho de botões.
    *   **Modelos Descritivos:** **Personas**.

*   **Personas (Slides 23, 26-38):**
    *   **Definição (Slide 23, 27, 38):** Personagens fictícias, **baseadas em pesquisa com utilizadores**, que representam diferentes tipos de utilizadores de um produto/serviço.
    *   **Propósito (Slide 27, 29, 38):**
        *   Tornar a tarefa de design menos complexa.
        *   Guiar o processo de ideação.
        *   Ajudar a entender necessidades, experiências, comportamentos e objetivos dos utilizadores.
        *   Ajudar a equipa a "sair de si mesma" e reconhecer diferentes necessidades.
        *   Focar decisões, testar e priorizar funcionalidades.
    *   **História e Tipos (Slide 28, 30):** Propostas por Alan Cooper. Vários tipos (orientadas a objetivos, baseadas em papéis, envolventes). Personas "fictícias" (não baseadas em pesquisa) devem ser usadas com cautela, apenas como esboço inicial.
    *   **Melhores Práticas (Slide 31):** Criar 2-4 personas, conduzir pesquisa, desenvolver descrições (background, motivações, expectativas), não incluir demasiada informação pessoal, ser relevante e sério.
    *   **Elementos (Slide 32, 33, 34, 35, 36):** Grupo, nome fictício, cargo, demografia, objetivos/tarefas, ambiente.
    *   **Importante (Slide 32, 37):** "Personas não têm valor em si mesmas, até se tornarem parte de um cenário". A equipa precisa de as usar.
    *   **Processo de Criação (Slide 37):** 10 passos desde a recolha de dados até ao uso e ajuste contínuo.

*   **Cenários (Scenarios - Slides 26, 39-43):**
    *   **Definição (Slide 39, 43):** Histórias e contextos sobre como os grupos de utilizadores (representados por personas) usam um futuro produto/serviço para atingir os seus objetivos.
    *   **Propósito (Slide 39, 40, 43):**
        *   Comunicar as tarefas chave que o utilizador realizará.
        *   Críticos para o design e para os testes de usabilidade (ajudam a definir o que testar).
    *   **Características (Slide 40, 41):** Devem ser usados na ideação, baseados em pesquisa, tipicamente representam os utilizadores mais comuns, baseados em personas. Devem responder a: Quem? Porquê? Que objetivos? Como?
    *   **Tipos (Slide 42):** Baseados em objetivos/tarefas, elaborados, em escala real.

*   **Análise de Tarefas (Task Analysis - Slides 22, 44-52):**
    *   **Definição (Slide 44):** Processo de aprender sobre os utilizadores, observando-os em ação para entender em detalhe como realizam as suas tarefas e atingem os seus objetivos.
    *   **Propósito (Slide 44, 45, 52):**
        *   Identificar as tarefas que o produto/serviço deve suportar.
        *   Entender os objetivos dos utilizadores, os passos atuais, as suas experiências, a influência do ambiente.
        *   Uma das ferramentas mais poderosas em UX design.
    *   **Quando (Slide 44):** Importante realizar no início do processo, antes do trabalho de design.
    *   **Como (Slide 46, 47, 48, 49, 50):**
        *   Pode ser formal (ex: HTA - Hierarchical Task Analysis) ou informal.
        *   Informalmente: responder a um conjunto de perguntas (Slide 47 - "Quem? O quê? Novas tarefas? Onde?"), decompor tarefas de alto nível em sub-tarefas (4-8), diagramar, documentar e apresentar a alguém que conheça as tarefas.
    *   **Uso (Slide 51):** Manuais, materiais de ensino, design de alto nível do sistema, design detalhado da UI.
    *   **Considerações (Slide 52):** Requer manter a perspetiva do utilizador, rigor na pesquisa, é um processo iterativo, exige tempo e recursos.

*   **Outros Métodos (Slides 53-60):**
    *   **User Stories (Histórias de Utilizador - Slides 54, 55):**
        *   Originárias de métodos ágeis. Conceitos curtos ou descrições de funcionalidades que os clientes gostariam de ver.
        *   Escritas do ponto de vista do utilizador, com detalhe mínimo.
        *   Formato: "Como um <tipo de utilizador>, eu quero <algum objetivo> para que <alguma razão>."
    *   **Use Cases (Casos de Uso - Slide 56):**
        *   Descrição escrita de como os utilizadores realizarão tarefas. Delineia o comportamento do sistema em resposta a um pedido do utilizador.
        *   Comum em desenvolvimento de software (ex: diagramas UML).
    *   **Diferença entre Cenários, User Stories e Use Cases (Slides 57-59):**
        *   **Público-alvo e Propósito distintos (Slide 57):**
            *   **Cenários:** Criados por investigadores de UX para comunicar com a equipa de design.
            *   **User Stories:** Criadas por gestores de produto/projeto para definir requisitos para um sprint ágil.
            *   **Use Cases:** Criados por/para programadores para ajudar nos testes e na implementação.
        *   O exemplo dos Slides 58 e 59 ilustra bem: o cenário foca no contexto, a user story no objetivo e valor, e o use case nos passos.
    *   **Storyboards (Slide 60):**
        *   Formas visuais iniciais de uma experiência, derivadas da indústria cinematográfica.
        *   Particularmente úteis para VR, pois podem mostrar o utilizador a interagir diretamente com objetos.

**Take Away Geral da Aula:**

*   Compreender os modelos mentais dos utilizadores é crucial.
*   Os designers criam modelos conceptuais (interfaces) para ajudar os utilizadores a formar modelos mentais úteis e precisos.
*   Existem diretrizes para criar bons modelos conceptuais (visibilidade, feedback, consistência, metáforas usadas com cuidado).
*   Ferramentas como Personas, Cenários e Análise de Tarefas são essenciais para entender os utilizadores e os seus contextos, informando o design de sistemas interativos eficazes.
*   Outros métodos como User Stories, Use Cases e Storyboards também têm o seu papel, dependendo do público e do propósito.







## Tema Central: Da Visão e Cenários aos Requisitos do Sistema**


**Recapitulação e Contexto (Slides 2-12)**

*   **Slide 2:** Introdução, preparando o palco para o tópico da aula.
*   **Slide 3 (Conhecer os Concorrentes):** Relembra a importância de analisar o que outros estão a fazer, usando ferramentas como Avaliação Heurística, Percurso Cognitivo e Análise SWOT de IHC.
*   **Slide 4 (Utilizadores):** Reafirma a necessidade de entender como os utilizadores percebem e processam informação (HIPS), como usam o conhecimento para interpretar novidades (Modelos Mentais) e como recolher informação sobre eles (Entrevistas) para identificar pontos problemáticos e expectativas.
*   **Slide 5 (Modelar Utilizadores):** Destaca as **Personas** como um método para integrar os dados recolhidos sobre os utilizadores.
*   **Slides 6-7 (Porquê Personas?):**
    *   Ajudam a visualizar as necessidades dos utilizadores.
    *   Permitem priorizar funcionalidades com base nos objetivos das personas.
    *   Criam uma linguagem comum para discutir utilizadores.
    *   Permitem defender decisões de design com base nas necessidades dos utilizadores.
    *   Unem a equipa em torno de um entendimento partilhado do utilizador.
*   **Slide 8 (Descrever a Solução - Cenários):**
    *   Cenários são descrições narrativas de como os utilizadores interagem com um sistema para atingir um objetivo (Quem, Quando, Onde, O quê, Como?).
    *   **Importante:** Devem ser "agnósticos quanto à solução" (solution agnostic), focando no *quê* o utilizador faz, e não em *como* a interface implementa isso (ex: "seleciona a opção de entrega especial" vs. "vai a um dropdown e seleciona...").
*   **Slide 9 (Cenários Orientados a Objetivos):** Crucial: se o cenário não responde ao objetivo da Persona, há um problema. O cenário deve estar alinhado com o que a Persona quer alcançar.
*   **Slides 10-11 (Quantos Cenários?):**
    *   Começa com uma provocação "50-60...", mas clarifica que não há número certo ou errado.
    *   A questão chave é: "Tudo o que eu 'vejo' o sistema a precisar de fazer já está presente num cenário?"
    *   Para o projeto da disciplina, 4-5 cenários provavelmente são suficientes.
*   **Slide 12 (Cada Persona deve aparecer):** Os cenários criados devem cobrir as interações das diferentes personas definidas.

**O Foco da Aula: De Cenários para Requisitos (Slides 13-57)**

*   **Slide 13 (Episódio de Hoje):** "Especificar o que precisamos de ter no sistema visionado". A transição de cenários para requisitos.
*   **Slide 14 (Outline de Hoje):** Como gerar requisitos, informações sobre o Trabalho 1 e apresentações de artigos. O diagrama do processo de design centrado no utilizador destaca a fase de "especificar os requisitos do utilizador" (W4, W5, W6).

*   **O Que São Requisitos? (Slides 15-18)**
    *   **Slide 16 (O que fazer com uma visão):** Como passar de uma visão abstrata para necessidades concretas. Requisitos bem definidos asseguram usabilidade, viabilidade e alinhamento com as necessidades do utilizador.
    *   **Slide 17 (Definição):** Requisitos são as **condições ou capacidades** necessárias para um sistema satisfazer as necessidades dos stakeholders ou resolver problemas específicos. Guiam o desenvolvimento.
    *   **Slide 18 (Requisitos NÃO são Funcionalidades/Features):**
        *   Ponto crítico: Requisitos são **necessidades**, não soluções pré-definidas.
        *   Exemplo: "Tem de ser baseado na Web" (solução) vs. a necessidade real: "Evitar instalar em cada máquina".
        *   **Pensamento Agnóstico à Solução:** Perguntar sempre "Qual é a necessidade real?" antes de se comprometer com uma solução.

*   **Gerar Requisitos a partir de Cenários (Slides 19-26)**
    *   **Slides 21-22 (Exemplo Sistema de Email):** Mostra como um item de um cenário de alto nível ("Adicionar uma conta" para a Persona "Paula, administradora do sistema") é expandido para um cenário narrativo detalhado.
    *   **Slides 23-25 (Do Cenário para os Requisitos):**
        *   A partir da narrativa do cenário, identificam-se ações/tarefas chave.
        *   Estas ações traduzem-se diretamente em requisitos iniciais para o sistema.
        *   Ex: "Paula... acede às funcionalidades de gestão de contas" -> Requisito: "fornecer um mecanismo para administradores gerirem contas de utilizador".
    *   **Slide 26:** Estes requisitos iniciais são um bom começo, mas ainda "superficiais". É preciso aprofundar as tarefas.

*   **Modelação de Tarefas (Task Modelling - Slides 27-43)**
    *   **Slide 28 (O que é Modelação de Tarefas?):** Um conjunto de métodos para representar como os utilizadores realizam tarefas para atingir objetivos. Ajuda a entender os passos, relações entre eles, e a informação/ferramentas necessárias.
    *   **Slide 29 (Tipos de Modelação de Tarefas):**
        *   **GOMS** (Goals, Operators, Methods, Selection Rules): Modela a estrutura cognitiva de utilizadores experientes.
        *   **Análise Hierárquica de Tarefas (HTA - Hierarchical Task Analysis):** Decompõe uma tarefa em sub-tarefas numa estrutura hierárquica. Foca-se em objetivos, tarefas e planos de execução. (Este será o foco).
        *   **ConcurTaskTrees (CTT):** Estrutura hierárquica com sub-tarefas concorrentes/paralelas.
    *   **Análise Hierárquica de Tarefas (HTA) (Slides 30-43):**
        *   **Slide 30 (Definição HTA):** Método para decompor tarefas numa hierarquia de sub-tarefas, permitindo entender estrutura, dependências e otimizações.
        *   **Slides 31-33 (Exemplo HTA - Preparar Chá - 1ª Abordagem):** Mostra uma decomposição inicial e um plano. A análise (Slide 33) revela omissões e simplificações (ex: aquecer o bule, ligar o fogão, querer mais do que uma chávena).
        *   **Slide 34 (HTA é um processo iterativo):** Ponto fundamental.
        *   **Slide 35 (Exemplo HTA - Preparar Chá - Nova Hierarquia):** Mostra uma HTA mais detalhada e reestruturada, com novas sub-tarefas e planos mais complexos, ilustrando a natureza iterativa.
        *   **Slide 36 (Fontes de Informação para Análise de Tarefas):** A qualidade depende dos dados ("lixo entra, lixo sai"). Fontes: documentação, observação (cara), entrevistas. O processo é iterativo, com várias fases de recolha e análise.
        *   **Slide 37 (Porque fazer Análise de Tarefas?):** Para entender o uso atual (criar manuais) ou para contribuir para o design de um novo sistema (design de alto nível e detalhado da UI).
        *   **Slides 38-42 (HTA para a tarefa "Adicionar Conta"):**
            *   Retoma o exemplo do sistema de email.
            *   Mostra uma HTA inicial (Slide 40) e depois uma mais decomposta (Slide 41).
            *   Indica que a decomposição pode continuar (Slide 42).
        *   **Slide 43 (Da HTA para Requisitos Refinados):** Este é o ponto crucial. Cada nó da HTA decomposta pode ser traduzido num requisito mais específico para o sistema. "O sistema deverá: R1... R2...". Estes são mais detalhados que os extraídos diretamente do cenário narrativo.

*   **Requisitos a partir de Personas (e outros aspetos do utilizador) (Slides 44-48)**
    *   **Slide 45 (Modelo Mental):** Relembra que o modelo mental do utilizador (como ele pensa sobre objetos, relações e ações) influencia as suas necessidades. Ex: fotógrafa que pensa em fotos por evento ficará frustrada se não puder agrupá-las assim.
    *   **Slide 46 (Ambientes):** Requisitos podem surgir do ambiente físico/virtual de uso e das expectativas do utilizador para esse ambiente. Ex: equipamento médico que derrete com desinfetante vs. telemóvel que sobrevive a uma lavagem (extremos para ilustrar).
    *   **Slide 47 (Características Físicas e Cognitivas):** Requisitos de acessibilidade e ergonomia (tamanhos de corpo, visão, destreza, evitar lesões por esforço repetitivo).
    *   **Slide 48 (Objetivos):** Os objetivos das personas devem guiar os cenários. Alguns requisitos podem ser intangíveis, relacionados com a perceção e emoção (ex: para a fotógrafa Katie, a câmara "deve parecer profissional e ser sólida").

*   **Tipos de Requisitos (Slides 49-53)**
    *   **Slide 50:** Funcionais, Não-Funcionais (foco no curso de IHC), de Negócio, de Dados, de Sustentabilidade, etc.
    *   **Slide 51 (Requisitos Funcionais):** Definem **o que** o sistema deve fazer. Descrevem funcionalidades e comportamentos. Ex: "O sistema deve permitir aos utilizadores redefinir a password por email."
    *   **Slide 52 (Requisitos Não-Funcionais - NF):** Definem atributos de qualidade, restrições e características operacionais – **como bem** o sistema faz algo. Ex: "O sistema deve suportar 10.000 utilizadores concorrentes sem degradação de performance." Categorias comuns: Performance, Usabilidade, Segurança, Fiabilidade, Manutenção.
    *   **Slide 53 (Exemplo - Sistema de Gestão de Abóboras):** Lista clara de requisitos funcionais e não-funcionais.

*   **Priorização de Requisitos (Slides 54-55)**
    *   Importância de focar nas necessidades críticas primeiro, alocar recursos limitados aos requisitos mais valiosos, ajudar na tomada de decisões (trade-offs) e permitir adaptabilidade.

*   **Requisitos para além do Curso de IHC (Slide 56)**
    *   Dependendo do projeto e da equipa, a listagem de requisitos pode ser mais elaborada, usando templates como o VOLERE (não abordado no curso).

*   **Próximo Episódio (Slide 57):** Passar da lista de necessidades (requisitos) para algo tangível: **prototipagem de baixa fidelidade**.

**Informações sobre o Trabalho 1 (Assignment 1 - Slides 58-60)**

*   **Slide 59 (Próxima Semana):** Entrega antes da aula laboratorial, submissão no Teams (slides + logbook), atenção ao template atualizado.
*   **Slide 60 (FAQ - Perguntas Frequentes):**
    *   **Análise SWOT de IHC:** Como parte das conclusões da análise de concorrentes.
    *   **Personas:** Dizer dados demográficos básicos, desafios, motivação.
    *   **HTA:** Mostrar para 1 ou 2 tarefas importantes (não mais).
    *   **Explicar Avaliação Heurística (HE) ou Percurso Cognitivo (CW):** Sim, ser breve, mas delinear sempre os métodos usados (nº de especialistas, heurísticas, escala de severidade, etc.).

**Take Away Geral da Aula:**

*   A aula foca-se no processo de definir o que um sistema deve fazer, partindo do entendimento dos utilizadores e das suas tarefas.
*   Os cenários são expandidos e analisados para extrair requisitos iniciais.
*   A Modelação de Tarefas, especialmente a Análise Hierárquica de Tarefas (HTA), é uma técnica poderosa para decompor tarefas e derivar requisitos mais detalhados e específicos.
*   Os requisitos podem ser Funcionais (o quê) ou Não-Funcionais (como bem).
*   A priorização de requisitos é essencial para gerir o desenvolvimento.
*   As informações sobre o Trabalho 1 são práticas e visam esclarecer dúvidas comuns.












## Tema Central: Prototipagem de Baixa Fidelidade (Lo-Fi Prototyping)**

A aula introduz o conceito de prototipagem, as suas vantagens, os diferentes níveis de fidelidade e depois aprofunda as técnicas e utilidade da prototipagem de baixa fidelidade, com um foco especial em protótipos de papel e no processo de teste.

Vamos detalhar os slides:

**Contexto e Ligação com Etapas Anteriores (Slides 2-5)**

*   **Slide 2 (Esta semana em IHC):** Situa a aula no contexto do ciclo de design. Os alunos estão a apresentar a análise de contexto e requisitos (W4, W5, W6 no diagrama) e esta aula prepara para a próxima fase: produzir soluções de design (W7, W9, W10, W11).
*   **Slide 3 (Outline de Hoje):**
    *   O que fazer com os requisitos?
    *   A utilidade da prototipagem.
    *   Apresentações de artigos.
    *   O diagrama do ciclo de design destaca a passagem da especificação de requisitos para a produção de soluções de design.
*   **Slide 4 (Cartoon Dilbert):** Ilustra humoristicamente o perigo de ter muitos requisitos sem considerar a usabilidade. A prototipagem ajuda a testar se os requisitos se traduzem numa experiência "fácil de usar".
*   **Slide 5 (Como passar dos requisitos para o design da interface?):** A resposta é: **Prototipamos!**

**Pensar Sobre Prototipagem (Slides 6-12)**

*   **Slide 7 (O que é um protótipo?):** "Algo para testar, explorar ou comunicar ideias de design para uma *coisa* que está a ser desenhada." É uma representação inicial e experimental.
*   **Slide 8 (Para quê?):** Permite criar e refinar uma interface com base no feedback do utilizador **antes** da implementação (que é mais cara e demorada).
*   **Slide 9 (Porque Devemos Prototipar UIs?):**
    *   Testar e comunicar designs de interface.
    *   Poupar tempo e dinheiro (identificar problemas cedo).
    *   Trazer os utilizadores para o processo de design.
    *   Permite desenhar para diferentes dispositivos e plataformas.
*   **Slide 10 (O que os Protótipos Podem Fornecer?):**
    *   Identificar problemas de usabilidade.
    *   Identificar requisitos funcionais em falta ou mal especificados.
    *   Ajudar a decidir entre alternativas de design.
    *   Ajudar a definir prioridades.
*   **Slide 11 (Níveis de Fidelidade):**
    *   Refere-se ao nível de detalhe e realismo do protótipo em termos de Design Visual, Conteúdo e Interatividade.
    *   **Baixa Fidelidade (Low Fidelity - Lo-Fi):** Simples, muitas vezes desenhado à mão, focado na estrutura e fluxo.
    *   **Alta Fidelidade (High Fidelity - Hi-Fi):** Mais detalhado, parece-se e comporta-se mais como o produto final.
*   **Slide 12 (Como Escolher o Nível de Fidelidade?):**
    *   Deve corresponder à fase atual do projeto e às questões que precisam de resposta.
    *   **Lo-Fi no início:** Para obter uma primeira perceção de como os utilizadores reagem, testar conceitos.
    *   **Hi-Fi mais tarde:** Quando já há bom feedback, para refinar detalhes de investimento extra ou padrões de interação mais complexos.

**Prototipagem de Baixa Fidelidade (Lo-Fi Prototyping) (Slides 13-24)**

*   **Slide 14 (Utilidade dos Protótipos Lo-Fi):**
    *   Rápidos e baratos de criar.
    *   Obtêm feedback dos utilizadores sobre aspetos gerais.
    *   Fáceis de modificar, mesmo durante os testes com utilizadores.
    *   Valiosos para testar o modelo conceptual da UI.
    *   Estima-se que permitem detetar até 80% dos problemas de usabilidade.
*   **Slide 15 (Adequados para recolher dados sobre):**
    *   Conceitos e terminologia.
    *   Navegação.
    *   Conteúdos.
    *   Estrutura.
    *   Funcionalidades.
*   **Slide 16 (Técnicas e Ferramentas Comuns):**
    *   **Protótipos de Papel (Paper Prototypes):** Representações simples, desenhadas à mão.
    *   **Wireframes:** Esboços digitais da estrutura e layout, sem detalhes de design.
    *   **Ferramentas Digitais:** Software que permite criar protótipos Lo-Fi digitais, fáceis de partilhar e modificar.

*   **Prototipagem em Papel (Paper Prototyping) (Slides 17-24):**
    *   **Slide 18 (Definição - Carolyn Snyder):** Variação de teste de usabilidade onde utilizadores representativos realizam tarefas realistas interagindo com uma versão em papel da interface, manipulada por uma pessoa que "faz de computador" (sem explicar como a interface deve funcionar).
    *   **Slide 19 (Utilidade):** Bom compromisso para obter feedback inicial e iterar rapidamente sobre escolhas de design (evita o "dois meses da minha vida, desperdiçados" do cartoon).
    *   **Slide 20 (Vantagens):**
        *   Rápido e barato.
        *   Adequado para colaboração e criação de entendimento partilhado.
        *   Não requer treino especial.
        *   Sem constrangimentos técnicos.
    *   **Slide 21 (Vantagens - Feedback Mais Criativo):**
        *   Designs inacabados encorajam discussão aberta e criatividade.
        *   Sinalizam que as ideias ainda estão a evoluir.
        *   Removem o fator de intimidação da tecnologia (não se pode "partir" nada).
        *   Utilizadores sentem-se mais à vontade para sugerir mudanças.
    *   **Slide 22 (Vantagens - Sem Feedback Detalhista/Irrelevante - "Nitpicky"):**
        *   Protótipos de alta fidelidade convidam a feedback sobre detalhes visuais menores (cor, alinhamento).
        *   Protótipos de papel encorajam feedback sobre conceitos e funcionalidade, em vez de estética.
    *   **Slide 23 (Lembrete):** Se mostrar uma UI 100% bonita a um não-programador, ele pensará que o sistema está quase pronto (o que raramente é o caso). O aspeto "inacabado" do papel ajuda a gerir expectativas.
    *   **Slide 24 (Desvantagens):**
        *   Falta de realismo / não responsivo (alguém tem de simular).
        *   Requer teste presencial com um moderador.
        *   Os resultados devem ser interpretados com cuidado (devido à natureza artificial).

**O Processo de Prototipagem (e Teste) (Slides 25-42)**

*   **Design de Tarefas (Task Design - Slides 26-31):**
    *   **Slide 26:** Antes de desenhar o protótipo, pensar nas tarefas que ele vai suportar. Ao testar, não se observa apenas o utilizador a fazer o que quer; dão-se-lhe tarefas específicas.
    *   **Slide 27 (Diretrizes para Escolher Tarefas):**
        *   Baseadas nos objetivos das Personas.
        *   Cobrir questões importantes para o sucesso do sistema.
        *   Ter um âmbito apropriado (não apenas uma ação por ecrã).
        *   Ter um conjunto finito e previsível de soluções possíveis.
        *   Ter um ponto final claro que o utilizador reconheça.
        *   Suscitar ação, não apenas opinião.
    *   **Slide 28 (Importância de Escolher Tarefas):** Guia decisões de design, garante que o protótipo suporta ações reais, foca em interações essenciais, ajuda a identificar falhas no fluxo de trabalho.
    *   **Slide 29 (Maus Exemplos de Tarefas):** Demasiado abertas, vagas ou longas. Ex: "Explore o website e diga o que acha."
    *   **Slide 30 (Bons Exemplos de Tarefas):** Específicas, com objetivo claro e, idealmente, mensuráveis. Ex: "Encontre e compre um par de sapatilhas Asics de corrida por menos de $100."
    *   **Slide 31 (Mais Diretrizes):** Pensar na ordem das tarefas, evitar linguagem que revele o método (Mau: "Vá ao Menu Ficheiro e Exporte para PDF" vs. Bom: "Guarde o documento atual como PDF"). Usar imagens pode ajudar.

*   **Construir o Protótipo (Slides 32-36):**
    *   **Slide 33 (Fundo do Protótipo - Prototype Background):** O "ecrã" base onde os elementos da interface são colocados (pode ser um desenho de um telemóvel, tablet, janela de browser).
    *   **Slide 34 (Conteúdo do Protótipo - Prototype Content):** Não precisa de muito detalhe nem ser muito realista:
        *   Texto pode ser linhas (Lorem Ipsum em papel).
        *   Imagens podem ser caixas com palavras (ex: "logo", "foto do produto").
        *   Geralmente, não é necessária cor.
        *   Tamanhos de janelas, fontes, etc., não precisam ser finais.
    *   **Slides 35, 36 (Exemplos):** Mostram vários protótipos de papel, ilustrando a simplicidade e foco na estrutura e elementos interativos.

*   **Avaliar um Protótipo (Slides 37-42):**
    *   **Slide 38 (Lembrar as Tarefas?):** As tarefas definidas para desenhar o protótipo são muito úteis para o teste. Melhoram o teste de usabilidade (interação significativa) e encorajam feedback realista.
    *   **Slide 39 (Usar Tarefas Durante o Teste):**
        *   Atenção à ordem das tarefas (lógica, narrativa).
        *   Apresentar tarefas por escrito (para o utilizador poder reler).
        *   Apresentar uma tarefa de cada vez.
    *   **Slide 40 (Quem está na Sessão de Teste?):**
        *   O "Computador" (pessoa que manipula o protótipo de papel).
        *   O Facilitador (guia o utilizador, dá as tarefas, faz perguntas).
        *   O Observador (tira notas, não interfere).
        *   ...e o Utilizador!
    *   **Slide 41 (Anatomia de uma Sessão de Teste):**
        *   Receber o participante e explicar o contexto.
        *   Dar as tarefas, uma a uma.
        *   Observar o participante a usar o protótipo e recolher feedback.
        *   Encorajar o "pensar em voz alta" (think aloud).
        *   Discutir opiniões e ideias no final.
    *   **Slide 42 (Exemplo de Avaliação de Protótipo):** Link para um vídeo do NNgroup (Jakob Nielsen's group), que são uma referência em usabilidade.

**Ferramentas para Prototipagem (Além do Papel) (Slides 43-48)**

*   **Slide 44 (Prototipagem para além do papel):** Os mesmos procedimentos podem ser usados com ferramentas que oferecem mais interatividade e um aspeto mais polido (mas ainda Lo-Fi ou Mid-Fi).
*   **Slide 45 (Balsamiq):** Ferramenta popular para wireframing e prototipagem Lo-Fi digital com um aspeto "desenhado à mão".
*   **Slide 46 (Figma):** Ferramenta de design colaborativo muito poderosa, pode ser usada para Lo-Fi, mas é mais conhecida para Hi-Fi.
*   **Slide 47 (Quant UX):** Ferramenta que parece integrar análise quantitativa com prototipagem (ex: heatmaps).
*   **Slide 48 (Rapid Prototyping):** Apresenta diferentes abordagens (Sketching & Paper, Digital, Native) e links para vídeos do Google for Startups.

**Take Away Geral da Aula:**

*   A prototipagem é uma etapa essencial para transformar requisitos em algo testável e iterável.
*   A prototipagem de baixa fidelidade, especialmente em papel, é uma forma rápida, barata e eficaz de obter feedback inicial sobre conceitos, estrutura e funcionalidade.
*   As vantagens da prototipagem Lo-Fi incluem a promoção de feedback criativo e o foco em aspetos conceptuais em vez de detalhes estéticos.
*   O design de tarefas realistas e bem definidas é crucial tanto para guiar a criação do protótipo como para a sua avaliação com utilizadores.
*   Existem ferramentas digitais que podem auxiliar na criação de protótipos Lo-Fi, oferecendo mais opções de interatividade e partilha.















## Perguntas:**

1.  **What is the subject of the ISO standard 13407 (1999)?**
    A norma ISO 13407:1999 (posteriormente substituída e integrada na ISO 9241-210:2010 e depois ISO 9241-210:2019) trata dos **"Processos de design centrado no ser humano para sistemas interativos"**. Ela fornece orientação sobre as atividades do design centrado no humano ao longo do ciclo de vida dos sistemas interativos baseados em computador.

2.  **What are the benefits of using a Human-Centered Design (HCD) approach in developing interactive systems?**
    Os benefícios incluem:
    *   **Maior usabilidade:** Sistemas mais fáceis de aprender e usar, mais eficientes e satisfatórios.
    *   **Maior satisfação do utilizador:** Resultando em maior aceitação e uso do sistema.
    *   **Redução de erros:** Interfaces claras e intuitivas diminuem a probabilidade de erros do utilizador.
    *   **Redução de custos de desenvolvimento e suporte:** Identificar e corrigir problemas de usabilidade cedo é mais barato do que corrigi-los após o lançamento. Menos necessidade de suporte técnico.
    *   **Aumento da produtividade:** Utilizadores conseguem realizar as suas tarefas de forma mais eficaz e eficiente.
    *   **Melhor adequação às necessidades reais dos utilizadores:** O sistema é projetado para resolver os problemas certos da maneira certa.
    *   **Vantagem competitiva:** Produtos com melhor experiência do utilizador destacam-se no mercado.

3.  **Personas are a method that can be used in the design of interactive systems; explain what are personas and their benefits.**
    *   **O que são Personas:** Personas são personagens fictícias, arquétipos de utilizadores, criadas com base em **pesquisa com utilizadores reais** para representar os diferentes grupos de utilizadores que podem interagir com um produto ou serviço. Elas têm nomes, idades, objetivos, motivações, frustrações, competências técnicas e, por vezes, uma breve história ou citação.
    *   **Benefícios:**
        *   **Empatia:** Ajudam a equipa de design a colocar-se no lugar dos utilizadores.
        *   **Foco:** Mantêm o foco nas necessidades e objetivos dos utilizadores durante todo o processo.
        *   **Comunicação:** Criam uma linguagem comum e um entendimento partilhado sobre quem são os utilizadores.
        *   **Tomada de Decisão:** Ajudam a priorizar funcionalidades e a tomar decisões de design ("A Persona Joana precisaria disto?").
        *   **Defesa de Decisões:** Permitem justificar escolhas de design com base nas necessidades das personas.

4.  **How should personas be developed?**
    Personas devem ser desenvolvidas através de um processo que envolve:
    1.  **Recolha de Dados (Pesquisa com Utilizadores):** Através de entrevistas, observações, questionários, análise de dados de uso, etc., para entender os utilizadores reais.
    2.  **Identificação de Padrões:** Analisar os dados recolhidos para identificar padrões de comportamento, objetivos, necessidades e frustrações entre os utilizadores.
    3.  **Criação de Arquétipos:** Agrupar utilizadores com padrões semelhantes em arquétipos distintos.
    4.  **Definição das Personas:** Para cada arquétipo, criar uma persona detalhada com nome, foto (opcional), dados demográficos, objetivos, motivações, cenário de uso, competências técnicas, frustrações, etc.
    5.  **Validação e Refinamento:** Partilhar as personas com a equipa e stakeholders para garantir que são representações realistas e úteis, e refiná-las conforme necessário.
    6.  **Uso Contínuo:** As personas devem ser usadas ativamente ao longo de todo o processo de design e desenvolvimento.

5.  **There are several types of personas; explain the main difference between fictional personas and the other types of personas.**
    A principal diferença reside na **base da sua criação**:
    *   **Fictional Personas (Personas Ad-hoc ou de Assunção):** São criadas com base nas **suposições, intuições e experiências da equipa de design**, sem pesquisa formal com utilizadores reais. São as menos fiáveis e devem ser usadas com muita cautela, idealmente apenas como um ponto de partida muito inicial se não houver recursos para pesquisa.
    *   **Outros Tipos de Personas (ex: Goal-directed, Role-based, Engaging):** São fundamentalmente **baseadas em pesquisa com utilizadores reais**. Os dados recolhidos através de métodos como entrevistas, observações, etc., são analisados para criar representações fiéis dos grupos de utilizadores.

6.  **Describe a minimal set of characteristics that can be used to define a persona.**
    Um conjunto mínimo de características inclui:
    *   **Nome Fictício e Foto (opcional, mas ajuda a humanizar)**
    *   **Dados Demográficos Chave:** Idade, ocupação, nível de experiência com tecnologia relevante.
    *   **Objetivos Principais (Goals):** O que a persona quer alcançar ao usar o sistema/produto.
    *   **Motivações:** As razões por detrás dos seus objetivos.
    *   **Frustrações/Pontos Problemáticos (Pain Points):** Dificuldades ou problemas que a persona enfrenta atualmente.
    *   **Um breve Cenário ou Citação:** Algo que capture a sua essência ou contexto principal de uso.

7.  **What is a scenario? And why are they useful in the design of interactive systems?**
    *   **O que é um Cenário:** Um cenário é uma **narrativa curta e focada** que descreve como uma persona específica usa um sistema ou produto para atingir um objetivo particular num determinado contexto. Responde a perguntas como: Quem? O quê? Quando? Onde? Porquê? E Como (de forma geral)?
    *   **Porque são úteis:**
        *   **Exploração de Design:** Ajudam a explorar e a visualizar como o sistema será usado na prática.
        *   **Comunicação:** Facilitam a comunicação de ideias de design e requisitos dentro da equipa e com stakeholders.
        *   **Foco no Utilizador:** Mantêm o foco nas tarefas e objetivos do utilizador.
        *   **Identificação de Requisitos:** Ajudam a identificar funcionalidades necessárias e potenciais problemas.
        *   **Base para Testes:** Servem como base para definir tarefas em testes de usabilidade.

8.  **Scenarios may also be used in usability evaluation; give an example.**
    Sim, cenários são fundamentais para testes de usabilidade. Eles fornecem o contexto e as tarefas que os participantes do teste irão realizar.
    *   **Exemplo:** Para testar um novo website de uma biblioteca, um cenário pode ser:
        "A *Joana (Persona)* é uma estudante universitária que precisa de encontrar o livro 'Interação Humano-Computador' de Alan Dix para um trabalho. Ela quer verificar se o livro está disponível na biblioteca e, se estiver, reservá-lo para levantar amanhã. Por favor, use o protótipo do website da biblioteca para tentar realizar esta tarefa."
        O facilitador então observa como o participante tenta completar os objetivos da Joana descritos no cenário.

9.  **How are personas related to scenarios?**
    Personas e cenários estão intrinsecamente ligados:
    *   **Personas são os "atores" dos cenários.** Cada cenário é escrito do ponto de vista de uma persona específica, refletindo os seus objetivos, motivações e contexto.
    *   Os cenários descrevem **o que as personas fazem ou querem fazer** com o sistema. Sem personas, os cenários seriam genéricos e menos eficazes.

10. **What should be considered when writing a scenario?**
    Ao escrever um cenário, deve-se considerar:
    *   **Persona:** Quem é o utilizador (usar a persona definida).
    *   **Objetivo:** Qual é o objetivo principal da persona nesta interação.
    *   **Motivação:** Porque é que a persona quer atingir esse objetivo.
    *   **Contexto:** Onde, quando e em que circunstâncias a interação ocorre.
    *   **Ações (Gerais):** Os passos principais que a persona executa, mas de forma "agnóstica à solução" (focando no "o quê", não no "como" específico da interface).
    *   **Resultado Esperado:** O que acontece quando a persona atinge o seu objetivo.
    *   **Clareza e Concisão:** O cenário deve ser fácil de entender e focado.

11. **What is the difference among scenarios, user stories and use cases?**
    Embora todos se relacionem com a interação do utilizador, têm propósitos e formatos diferentes:
    *   **Cenários:** Narrativas ricas em contexto, focadas na experiência do utilizador (persona) a atingir um objetivo. Usados por designers de UX para explorar e comunicar o design.
    *   **User Stories (Histórias de Utilizador):** Declarações curtas no formato "Como um <tipo de utilizador>, eu quero <objetivo> para que <razão/benefício>". Usadas em metodologias ágeis para definir requisitos de forma concisa para a equipa de desenvolvimento. Focam no valor para o utilizador.
    *   **Use Cases (Casos de Uso):** Descrições mais formais e detalhadas das interações entre um ator (utilizador ou outro sistema) e o sistema para alcançar um objetivo específico. Incluem passos, pré-condições, pós-condições, fluxos alternativos. Usados por analistas de sistemas e programadores para especificar e testar funcionalidades.

12. **What do scenarios, user stories and use cases have in common?**
    Todos eles:
    *   Visam capturar e descrever as **necessidades e objetivos dos utilizadores** em relação a um sistema.
    *   Descrevem algum tipo de **interação entre um utilizador (ou ator) e o sistema**.
    *   São ferramentas para ajudar a equipa a **entender e a construir o sistema certo**.
    *   Colocam o foco no que o sistema deve permitir que o utilizador faça.

13. **After defining scenarios, it is necessary to analyze the main tasks to be performed in the context of the scenario. This analysis can be done informally by asking questions; indicate a minimum set of questions.**
    Um conjunto mínimo de perguntas para análise informal de tarefas inclui (baseado nas aulas):
    1.  **Quem vai usar o sistema?** (Revisitar personas)
    2.  **Que tarefas realizam atualmente (sem o novo sistema)?** (Para entender o fluxo de trabalho existente)
    3.  **Que novas tarefas são desejadas (com o novo sistema)?**
    4.  **Onde são as tarefas realizadas?** (Contexto físico e ambiental)
    (Outras perguntas úteis incluem: Como as tarefas são aprendidas? Com que frequência são realizadas? Que ferramentas são usadas? Quais as restrições de tempo?)

14. **Task analysis is a very useful and may be done using Hierarchical task Analysis (HTA); what are its main characteristics?**
    As principais características da Análise Hierárquica de Tarefas (HTA) são:
    *   **Decomposição Hierárquica:** A tarefa principal é decomposta em sub-tarefas, e estas podem ser novamente decompostas, formando uma estrutura de árvore.
    *   **Foco em Objetivos (Goals):** Cada tarefa e sub-tarefa representa um objetivo que o utilizador pretende alcançar.
    *   **Planos (Plans):** Descrevem como as sub-tarefas são ordenadas e executadas para atingir o objetivo da tarefa pai (ex: sequência, seleção, iteração).
    *   **Nível de Detalhe:** A decomposição continua até um nível de detalhe considerado útil para o propósito da análise.
    *   **Representação Gráfica e Textual:** Frequentemente representada por um diagrama em árvore e acompanhada por descrições textuais.

15. **What for may task analysis be used?**
    A análise de tarefas pode ser usada para:
    *   **Design de Interfaces de Utilizador:** Informar o layout, navegação e funcionalidade da interface.
    *   **Desenvolvimento de Manuais e Materiais de Formação:** Estruturar o conteúdo com base em como as tarefas são realizadas.
    *   **Identificação de Requisitos:** Detalhar os requisitos funcionais do sistema.
    *   **Avaliação de Usabilidade:** Ajudar a definir tarefas para testes e a identificar potenciais problemas.
    *   **Redesenho de Processos:** Analisar fluxos de trabalho existentes para identificar ineficiências e oportunidades de melhoria.
    *   **Alocação de Funções:** Decidir que partes de uma tarefa devem ser automatizadas pelo sistema e quais devem ser realizadas pelo utilizador.

16. **Think of some everyday task and perform HTA using its graphical form.**
    **Tarefa: Fazer um Café Expresso numa Máquina Manual**

    ```mermaid
    graph TD
        0("0. Fazer Café Expresso") --> P0("Plano 0: Fazer 1.0-6.0 em sequência")
        P0 --> 1("1. Preparar Máquina e Ingredientes")
        P0 --> 2("2. Moer Café")
        P0 --> 3("3. Preparar Porta-filtro")
        P0 --> 4("4. Extrair Café")
        P0 --> 5("5. Limpar Porta-filtro")
        P0 --> 6("6. Desligar Máquina (opcional)")

        1 --> P1("Plano 1: Fazer 1.1-1.3")
        P1 --> 1.1("1.1 Ligar máquina e aquecer")
        P1 --> 1.2("1.2 Colocar água no reservatório (se necessário)")
        P1 --> 1.3("1.3 Pegar no café em grão")

        3 --> P3("Plano 3: Fazer 3.1-3.3")
        P3 --> 3.1("3.1 Colocar café moído no porta-filtro")
        P3 --> 3.2("3.2 Nivelar e calcar o café")
        P3 --> 3.3("3.3 Encaixar porta-filtro na máquina")

        4 --> P4("Plano 4: Fazer 4.1-4.2")
        P4 --> 4.1("4.1 Colocar chávena sob o porta-filtro")
        P4 --> 4.2("4.2 Acionar extração e parar quando atingir volume desejado")
    ```

17. **What type of plans may an HTA include?**
    Uma HTA pode incluir vários tipos de planos para descrever a execução das sub-tarefas:
    *   **Sequência:** As sub-tarefas são executadas numa ordem específica (ex: Fazer 1, depois 2, depois 3).
    *   **Seleção (Condicional):** Apenas uma de várias sub-tarefas é executada, dependendo de uma condição (ex: SE chávena suja ENTÃO Lavar chávena SENÃO Usar chávena).
    *   **Iteração (Repetição):** Uma sub-tarefa ou conjunto de sub-tarefas é repetida até que uma condição seja satisfeita (ex: ENQUANTO houver roupa suja FAZER Colocar na máquina).
    *   **Paralelo/Concorrente:** Duas ou mais sub-tarefas podem ser executadas ao mesmo tempo ou em qualquer ordem (embora mais difícil de modelar explicitamente em HTA simples).
    *   **Opcional:** Uma sub-tarefa pode ou não ser executada.

18. **What are the main information sources for a task analysis?**
    As principais fontes de informação são:
    *   **Observação dos Utilizadores:** Observar utilizadores a realizar as tarefas no seu ambiente natural ou num ambiente simulado.
    *   **Entrevistas com Utilizadores e Especialistas no Domínio:** Questionar sobre como realizam as tarefas, os seus objetivos, problemas, etc.
    *   **Documentação Existente:** Manuais, guias de procedimentos, especificações de sistemas anteriores.
    *   **Análise de Sistemas Semelhantes:** Estudar como tarefas são realizadas em sistemas concorrentes ou comparáveis.
    *   **Questionários:** Para recolher dados de um grande número de utilizadores.
    *   **Diários de Utilização (User Diaries):** Pedir aos utilizadores para registarem as suas atividades e experiências ao longo do tempo.

19. **Are task analysis methods objective? Why?**
    Os métodos de análise de tarefas **não são totalmente objetivos**, embora se esforcem por sê-lo.
    *   **Porquê:**
        *   **Interpretação do Analista:** A forma como o analista observa, regista e, principalmente, decompõe as tarefas envolve um grau de interpretação e julgamento subjetivo.
        *   **Escolha do Nível de Detalhe:** A decisão de até onde decompor uma tarefa é muitas vezes subjetiva e depende do objetivo da análise.
        *   **Seleção de Participantes:** A escolha dos utilizadores a observar ou entrevistar pode introduzir enviesamentos.
        *   **Efeito do Observador:** A presença de um observador pode alterar o comportamento do utilizador (efeito Hawthorne).
    Contudo, ao seguir metodologias estruturadas, usar múltiplas fontes de dados e ter vários analistas a rever o trabalho, pode-se aumentar a fiabilidade e reduzir a subjetividade.

20. **When to stop decomposition is an important issue in applying HTA. State a rule that can be used to make that decision.**
    Uma regra comum é a **regra PxC (Probabilidade x Custo)**:
    *   **P (Probability):** A probabilidade de o utilizador cometer um erro ao executar a sub-tarefa.
    *   **C (Cost):** O custo ou consequência desse erro.
    *   **Regra:** Se o produto P x C for abaixo de um determinado limiar aceitável, a decomposição dessa sub-tarefa pode parar. Se for alto, a sub-tarefa provavelmente precisa de mais decomposição ou de um design cuidadoso para mitigar o erro.
    Outras heurísticas incluem: parar quando a sub-tarefa é uma ação simples e bem compreendida, quando não há mais decisões importantes a serem tomadas pelo utilizador dentro dela, ou quando uma maior decomposição não adiciona valor significativo para o objetivo da análise.

21. **What is the Wizard of Oz method? Give an example of a situation in which it can be useful.**
    *   **O que é:** O método Wizard of Oz é uma técnica de prototipagem e teste onde o utilizador interage com uma interface que aparenta ser totalmente funcional e autónoma, mas cujas respostas e comportamentos são, na verdade, simulados em tempo real por um ser humano (o "mágico" ou "wizard") escondido, sem o conhecimento do utilizador.
    *   **Exemplo de utilidade:**
        *   **Testar uma interface de voz (VUI) antes de desenvolver o complexo motor de reconhecimento de fala e processamento de linguagem natural.** O utilizador fala com o sistema, o "mágico" ouve o pedido através de um microfone e digita ou seleciona uma resposta apropriada que é então vocalizada pelo sistema (ou mostrada no ecrã). Isto permite testar o fluxo da conversação, a clareza dos comandos e a utilidade das respostas sem o custo de implementar a tecnologia subjacente completa.
        *   Testar sistemas baseados em Inteligência Artificial complexa.

22. **What are the main characteristics of participatory design?**
    As principais características do Design Participativo são:
    *   **Colaboração Ativa dos Utilizadores:** Os utilizadores não são apenas sujeitos de estudo, mas sim parceiros ativos e co-criadores ao longo de todo o processo de design.
    *   **Empoderamento dos Utilizadores:** Dar voz aos utilizadores e permitir que as suas perspetivas e conhecimentos influenciem diretamente o design.
    *   **Iteração e Aprendizagem Mútua:** O processo é iterativo, com designers e utilizadores a aprenderem uns com os outros.
    *   **Foco na Experiência e Contexto do Utilizador:** Valorizar o conhecimento prático e as experiências vividas pelos utilizadores.
    *   **Uso de Ferramentas e Técnicas Acessíveis:** Utilizar métodos que facilitem a participação de não-designers (ex: protótipos de baixa fidelidade, workshops).
    *   **Objetivo de Melhoria:** Não apenas criar um produto, mas também melhorar a situação de trabalho ou de vida dos utilizadores.

23. **What techniques may be used in the scope of participatory design to get information from the users?**
    Várias técnicas podem ser usadas, incluindo:
    *   **Workshops de Co-design (Co-design Workshops):** Sessões colaborativas onde utilizadores e designers trabalham juntos para gerar ideias, esboçar soluções e criar protótipos.
    *   **Prototipagem de Baixa Fidelidade Conjunta:** Utilizadores participam ativamente na criação e modificação de protótipos (ex: com papel, post-its, legos).
    *   **Card Sorting (com utilizadores):** Pedir aos utilizadores para organizarem cartões com itens de conteúdo ou funcionalidades em grupos que façam sentido para eles, ajudando a definir a arquitetura de informação.
    *   **Storytelling e Criação de Cenários Conjunta:** Utilizadores partilham as suas histórias e ajudam a construir cenários de uso.
    *   **Mapas de Jornada do Utilizador (User Journey Mapping) Colaborativos:** Utilizadores ajudam a mapear a sua experiência atual e a ideal.
    *   **Brainstorming com Utilizadores.**

24. **What is the Fitts law? Why is it useful in the design of User Interfaces?**
    *   **O que é a Lei de Fitts:** É um modelo matemático preditivo do movimento humano, que estabelece que o **tempo (T) necessário para mover rapidamente para uma área alvo é uma função da razão entre a distância (D) ao alvo e a largura (W) do alvo**. Matematicamente, T = a + b log₂(D/W + 1), onde 'a' e 'b' são constantes empíricas.
    *   **Porque é útil no design de UIs:**
        *   **Dimensionamento e Posicionamento de Alvos:** Ajuda a tomar decisões informadas sobre o tamanho de botões, ícones e outros elementos interativos, e sobre a sua localização no ecrã.
        *   **Otimização da Eficiência:** Para aumentar a velocidade de seleção:
            *   **Diminuir D:** Colocar elementos relacionados próximos uns dos outros, ou elementos frequentemente usados em locais de fácil acesso.
            *   **Aumentar W:** Tornar os alvos maiores, especialmente os mais importantes ou frequentemente usados.
        *   **Design de Menus:** Explica porque menus em cascata podem ser lentos se os sub-itens forem pequenos e distantes, ou porque os cantos e bordas do ecrã são alvos "infinitamente grandes" numa direção (ex: menu Apple no canto superior esquerdo).
        *   **Previsão de Desempenho:** Permite comparar diferentes layouts de interface em termos do tempo estimado para realizar certas tarefas de apontar e clicar.