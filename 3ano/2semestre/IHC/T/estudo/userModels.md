**Tema Central: Modelos do Utilizador e Outros Modelos de Design**

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







**Tema Central: Da Visão e Cenários aos Requisitos do Sistema**


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
