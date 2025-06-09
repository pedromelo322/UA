# O Utilizador (The User)

## Matéria

###    1.  Perfil do Utilizador (User Profile - Slides 4, 6, 50, 51, 52):
*   **Características Relevantes:** Não basta pensar no utilizador como uma entidade genérica. Precisamos de considerar:
    *   **Sistema de Processamento de Informação Humano (HIPS):** Como percebemos, pensamos e agimos (veremos em detalhe abaixo).
    *   **Conhecimento e Experiência:** Nível de educação, familiaridade com tecnologia, experiência com sistemas semelhantes ou com a tarefa em si, língua materna, literacia informática.
    *   **Trabalho e Tarefa:** Frequência de uso, tipo de uso (obrigatório/opcional), se recebe treino, se usa outros sistemas.
    *   **Características Físicas:** Idade, deficiências (visuais como daltonismo, motoras), se é destro ou canhoto.
    *   **Ambiente/Contexto:** Onde e como o sistema será usado (ex: num escritório calmo vs. numa urgência hospitalar barulhenta, uso diário vs. uso anual – Slides 47-49).
    *   **Aspetos Culturais:** Muito importantes e muitas vezes esquecidos.
*   **Variabilidade:** Estas características variam imenso entre utilizadores (Slide 6).
*   **Implicações no Design (Slide 51):**
    *   Muita experiência com o sistema, pouca com a tarefa -> precisa de mais ajuda semântica (o quê fazer).
    *   Muita experiência com a tarefa, pouca com o sistema -> precisa de mais ajuda sintática (como fazer no sistema).
    *   Uso frequente -> otimizar para facilidade de uso (eficiência).
    *   Uso pouco frequente -> otimizar para facilidade de aprender e lembrar.
    *   Uso obrigatório -> foco na facilidade de uso.
    *   Uso opcional -> foco na facilidade de aprender e lembrar (para não desistir).
    *   **Cor:** Não deve ser o único meio de transmitir informação (importante para daltónicos).
*   **Take Away (Slide 52):**
    *   Utilizadores são diferentes dos designers/programadores.
    *   Utilizadores variam muito entre si.
    *   Utilizadores mudam com o tempo (aprendem, esquecem).
    *   **REGRA DE OURO: "Tu não és o utilizador!"** É preciso estudá-los.

### 2.  **Sistema de Processamento de Informação Humano (HIPS - Human Information Processing System - Slides 3, 4, 5, 10, 11):**
*   Modelo que descreve como os humanos recebem, processam e respondem à informação.
*   **Componentes Principais (Slide 5, 11):**
    *   **Subsistema Perceptual (Input):** Recebe informação do mundo através dos sentidos.
    *   **Subsistema Cognitivo (Processamento):** Pensa, toma decisões, usa a memória.
    *   **Subsistema Motor (Output):** Executa ações físicas (ex: clicar, escrever).
*   O HIPS tem capacidades e limitações que devem ser consideradas no design. Emoções também influenciam estas capacidades (Slide 10).

### 3.  **Subsistema Perceptual (Slides 4, 12-26):**
*   **Sentidos (Input - Slide 12):**
    *   Visão, Audição, Tato, Olfato, Paladar (+ Propriocepção - noção da posição do corpo, Cinestesia - noção do movimento).
    *   Em IHC, a **Visão** é tradicionalmente a mais explorada, mas Audição e Tato são cada vez mais importantes.
    *   **Olfato e Paladar:** Difíceis de usar em IHC, alta latência, mas há trabalho experimental (Slide 25, 26).
*   **Visão (Slides 13-17):**
    *   O que vemos não depende só do estímulo (Slides 8, 9, 13 - ilusões visuais como Ames' room, Adelson's illusion). O cérebro interpreta e compensa.
    *   Sensível a uma pequena parte do espectro eletromagnético (Slide 14).
    *   Dois tipos de visão: **Escotópica** (pouca luz, sem cor, bastonetes) e **Fotópica** (boa luz, com cor, cones).
    *   Células sensoras (Slide 15): **Bastonetes** (visão escotópica) e **Cones** (visão fotópica – 3 tipos: Verde 64%, Vermelho 33%, Azul 2% - menos sensível).
    *   **Daltonismo (Color blindness - Slides 16, 17):** Afeta uma percentagem significativa. Teste de Ishihara. Implicação: não usar cor como *única* forma de transmitir informação.
*   **Reconhecimento de Padrões (Pattern Recognition - Slides 18-21):**
    *   Processo poderoso e subconsciente que combina informação do estímulo com informação da memória para identificar algo.
    *   Resolve ambiguidades. Ocorre noutros sentidos também.
    *   Ilusões (Ponzo, Kanizsa, Penrose, Necker) mostram como o cérebro tenta encontrar padrões, mesmo que não existam ou sejam ambíguos.
*   **Outros Sentidos (Slides 22-25):**
    *   **Audição:** Informação sobre direção, objetos, distância. Único sentido verdadeiramente 3D. Não pode ser "desligado". Alcance: 20Hz-15KHz. Filtragem possível (ex: "cocktail party effect").
    *   **Tato:** Feedback importante. Crucial para pessoas com deficiência visual. Receptores para frio/calor, dor, pressão. Dedos são muito sensíveis.
    *   **Propriocepção:** Consciência da posição do corpo (importante em VR, por exemplo).

### 4.  **Subsistema Cognitivo (Slides 4, 11, 27-41):**
*   **Memória (Slides 27-35, 36):**
    *   **Modelo de Atkinson-Shiffrin (Slides 27, 29):**
        *   **Memória Sensorial (Iconic, Echoic, Haptic):** Muito curta (alguns segundos). Buffer inicial.
        *   **Memória de Curto Prazo (STM) / Memória de Trabalho (Working Memory):** Duração de +/- 18 segundos, capacidade limitada de **7 +/- 2 itens (Miller's Magic Number)**. Usada para cálculo mental, leitura. Acesso rápido, esquecimento rápido.
        *   **Chunking (Slides 30, 31, 32, 33):** Agrupar informação em "chunks" (unidades significativas) para aumentar a capacidade efetiva da STM e ajudar a transferir para a LTM. Ex: nº telefone agrupado.
        *   **Memória de Longo Prazo (LTM):** Capacidade e duração virtualmente infinitas. Acesso menos fiável.
    *   **Recuperação da Informação (LTM - Slide 35):**
        *   **Reconhecimento (Recognition):** Lembrar com ajuda de pistas visíveis ("conhecimento no mundo"). É **MUITO MAIS FÁCIL**. Ex: menus, ícones.
        *   **Recordação (Recall):** Lembrar sem ajuda ("conhecimento na cabeça"). Ex: linhas de comando.
    *   **Implicações no Design para Memória (Slide 36):**
        *   Reduzir carga cognitiva (evitar procedimentos longos e complicados).
        *   Promover **reconhecimento em vez de recordação** (usar padrões familiares, menus, ícones, consistência).
        *   Oferecer várias formas de organizar/identificar informação (pastas, categorias, cor, tags, datas, ícones).
*   **Atenção (Slides 11, 37-39):**
    *   **Atenção Seletiva (Slide 37):** Focar num estímulo e ignorar outros. Pode ser voluntária ou involuntária. Interfaces exploram isto (ex: notificações).
    *   **Cegueira por Desatenção (Inattentional Blindness - Slide 38):** Falha em notar um estímulo inesperado quando a atenção está focada noutra tarefa (ex: vídeo do gorila).
    *   **Implicações no Design para Atenção (Slide 39):**
        *   Tornar informação saliente quando requer atenção.
        *   Evitar interfaces "desarrumadas" (clutter) com demasiada informação.
        *   Suportar a mudança eficaz entre tarefas/interfaces.
*   **Aprendizagem (Learning - Slide 11, 40):**
    *   **Implicações no Design:**
        *   Encorajar a exploração.
        *   Restringir e guiar utilizadores iniciantes para ações apropriadas.
*   **Resolução de Problemas (Problem Solving - Slide 11, 41):**
    *   **Implicações no Design:**
        *   Fornecer informação e ajuda de fácil acesso.
        *   Usar funções simples e memoráveis para decisão rápida.
        *   Permitir que utilizadores definam/guardem preferências.

### 5.  **Emoção (Slides 10, 42-44):**
*   Envolve resposta cognitiva e física a estímulos.
*   **Afeto (Affect):** Resposta biológica que influencia como reagimos.
*   Citação de Donald Norman (Slide 42): "Afeto negativo pode dificultar tarefas fáceis; afeto positivo pode facilitar tarefas difíceis."
*   **Design Emocional (Slide 43, 44):** É uma parte crítica do design, especialmente para aplicações de lazer e para a experiência do utilizador (UX) no geral. Considerar como o design faz o utilizador sentir-se.







## Perguntas/Respostas:

1.  **Why is it fundamental to know the target user profile of any interactive system at the onset of its development?**
    É fundamental conhecer o perfil do utilizador-alvo desde o início para garantir que o sistema seja projetado para atender às suas necessidades, capacidades, limitações e contexto de uso reais. Sem esse conhecimento, os designers/desenvolvedores podem basear-se nas suas próprias preferências ou em suposições (lembra-te: "Tu não és o utilizador!" - Slide 52), o que frequentemente leva a sistemas difíceis de usar, ineficientes, frustrantes ou que simplesmente não resolvem o problema do utilizador. Conhecer o utilizador permite tomar decisões de design informadas que resultam em maior usabilidade, satisfação e eficácia do sistema.

2.  **Which are the most relevant aspects of the user profile to the design of an interactive system?**
    Os aspetos mais relevantes do perfil do utilizador incluem (combinando info dos Slides 4, 6, 50):
    *   **Sistema de Processamento de Informação Humano (HIPS):** Capacidades e limitações perceptuais, cognitivas (memória, atenção, etc.) e motoras.
    *   **Conhecimento e Experiência:** Nível de educação, literacia informática, experiência com sistemas semelhantes, experiência com a tarefa, língua materna.
    *   **Trabalho e Tarefa:** Objetivos do utilizador, frequência de uso do sistema, se o uso é obrigatório ou opcional, se recebe treino.
    *   **Características Físicas:** Idade, deficiências (visuais como daltonismo, auditivas, motoras), se é destro ou canhoto.
    *   **Ambiente/Contexto de Uso:** Onde o sistema será usado (ex: escritório, fábrica, em movimento), condições de iluminação, ruído, stress.
    *   **Aspetos Culturais:** Como a cultura pode influenciar a perceção e interação.

3.  **The HIPS is a relevant aspect of the user profile for the design of interactive systems and it includes several types of memory; which do you know? Briefly define each of them.**
    O HIPS inclui os seguintes tipos de memória, conforme o modelo de Atkinson-Shiffrin (Slides 27, 29):
    *   **Memória Sensorial (Sensory Memory):** É o primeiro estágio, atua como um buffer muito breve para os estímulos recebidos pelos sentidos (visual/icónica, auditiva/ecóica, tátil/h háptica). Retém informação por frações de segundo a poucos segundos, permitindo que o cérebro decida se a informação é relevante para processamento adicional.
    *   **Memória de Curto Prazo (Short-Term Memory - STM) / Memória de Trabalho (Working Memory):** É onde a informação atualmente em uso ou recentemente percebida é mantida e manipulada ativamente. Tem capacidade e duração limitadas. A memória de trabalho é um conceito mais recente que enfatiza o aspeto ativo de processamento da informação, e não apenas o armazenamento temporário.
    *   **Memória de Longo Prazo (Long-Term Memory - LTM):** É o armazém de conhecimento e experiências acumuladas ao longo da vida. Tem uma capacidade virtualmente ilimitada e a informação pode ser mantida por longos períodos, desde minutos a toda a vida.

4.  **One of those memories is considered the bottleneck of the HIPS; which and why?**
    A **Memória de Curto Prazo (STM) / Memória de Trabalho** é considerada o "gargalo" (bottleneck) do HIPS (Slide 11).
    **Porquê:** Devido à sua **capacidade limitada** (consegue reter aproximadamente 7 ± 2 "chunks" de informação) e à sua **curta duração** (a informação desaparece em cerca de 18-30 segundos se não for ativamente repetida ou processada). Isto significa que a quantidade de informação que podemos processar conscientemente num dado momento é restrita.

5.  **The long-term memory is considered a strong point of the HIPS; why?**
    A Memória de Longo Prazo (LTM) é considerada um ponto forte do HIPS devido à sua (Slides 29, 34):
    *   **Capacidade virtualmente ilimitada:** Pode armazenar uma vasta quantidade de informação.
    *   **Duração longa:** As memórias podem ser retidas por períodos muito extensos, potencialmente por toda a vida.

6.  **What is the capacity and for how long are memories stored in the short term (working) memory?**
    *   **Capacidade:** Aproximadamente **7 ± 2 itens ou "chunks"** de informação (Slides 29, 30, 31).
    *   **Duração:** A informação é armazenada por um período curto, tipicamente entre **18 a 30 segundos**, se não houver repetição (rehearsal) ou processamento ativo (Slides 29, 31).

7.  **What is chunking? Why should it be considered in the design of user interfaces?**
    *   **Chunking (Agrupamento):** É o processo de organizar itens individuais de informação em grupos ou "chunks" maiores e mais significativos (Slides 30, 32, 33). Um chunk é a maior unidade significativa que uma pessoa reconhece.
    *   **Por que considerar no design de interfaces:** Deve ser considerado porque ajuda a contornar as limitações da memória de curto prazo. Ao apresentar informação em chunks, a interface permite que o utilizador processe e memorize mais informação efetivamente, pois cada chunk conta como um "item" na STM. Isto reduz a carga cognitiva, facilita a compreensão e a memorização, tornando a interface mais fácil de usar (ex: números de telefone ou de cartão de crédito agrupados).

8.  **What are the main characteristics of the pattern recognition process that are relevant for interactive systems design?**
    As principais características do reconhecimento de padrões relevantes para o design de sistemas interativos são (Slide 18):
    *   **É um processo poderoso e rápido:** Os humanos são muito bons a reconhecer padrões.
    *   **É subconsciente:** Ocorre automaticamente sem esforço consciente.
    *   **Utiliza informação da memória:** Compara o estímulo atual com padrões armazenados.
    *   **Resolve ambiguidades:** O cérebro tenta "encaixar" o estímulo num padrão conhecido, mesmo com informação incompleta.
    *   **Relevância no Design:** Designers podem aproveitar isto usando elementos consistentes e familiares (ícones, layouts, terminologia) que os utilizadores reconhecem rapidamente, tornando a interface mais intuitiva e eficiente.

9.  **What human senses, besides vision and hearing, may be relevant in Virtual Reality systems? Why?**
    Além da visão e audição, os seguintes sentidos são relevantes em sistemas de Realidade Virtual (VR):
    *   **Tato (Touch):** Através de feedback háptico (vibrações, força), o tato pode simular o contacto com objetos virtuais, aumentando a sensação de imersão e realismo (Slide 23).
    *   **Propriocepção:** É a consciência da posição e orientação do nosso próprio corpo no espaço (Slide 12, 25). Em VR, é crucial para a navegação e para a sensação de "presença" no ambiente virtual.
    *   **Cinestesia (Kinaesthesia):** É a sensação de movimento do corpo. Juntamente com a propriocepção, permite interações mais naturais e imersivas.

10. **Why is short term memory or working memory a limitation that must be considered in user interface design? Give an example of a situation that does not comply with this limitation and mention how this could be corrected.**
    A STM/memória de trabalho é uma limitação devido à sua **capacidade restrita (7±2 chunks)** e **curta duração (18-30s)**. Se uma interface exigir que o utilizador retenha demasiada informação de uma vez ou por muito tempo sem apoio, a sobrecarga cognitiva levará a erros e frustração.
    *   **Exemplo de não conformidade:** Um formulário online que pede ao utilizador para memorizar um código de confirmação complexo (ex: `X7gT2!zP8k`) apresentado numa página, para depois o introduzir numa página seguinte sem que o código esteja visível.
    *   **Correção:**
        *   Manter o código visível na página onde precisa ser introduzido.
        *   Copiar automaticamente o código para a área de transferência.
        *   Simplificar o código ou usar métodos de confirmação alternativos (ex: link por email).
        *   Dividir a tarefa em passos menores, apresentando apenas a informação relevante para cada passo.

11. **Give an example illustrating how the involuntary selective attention process may be used to improve the usability of a user interface.**
    A atenção seletiva involuntária é capturada por estímulos salientes ou inesperados. Pode ser usada para melhorar a usabilidade ao direcionar o foco do utilizador para informações importantes ou críticas.
    *   **Exemplo:** Numa aplicação, quando ocorre um erro crítico, o sistema pode apresentar uma **caixa de diálogo modal com um ícone de aviso distintivo (ex: vermelho ou amarelo) e talvez um som de alerta subtil** (Slide 37 mostra ícones a piscar na barra de tarefas). Esta combinação de estímulos visuais (cor, ícone, possível animação) e auditivos captura a atenção involuntária do utilizador, garantindo que ele perceba a mensagem importante mesmo que estivesse focado noutra parte da interface.

12. **What kind of help (syntactic or semantic) do users having much task experience but low system experience need more? (E.g. a very experienced bank clerk using a new system)**
    Utilizadores com muita experiência na tarefa mas pouca experiência com o sistema precisam mais de **ajuda sintática** (Slide 51).
    *   **Explicação:** Eles sabem "o quê" precisa ser feito (conhecimento da tarefa - semântica), mas não sabem "como" fazer essa tarefa no novo sistema específico (conhecimento do sistema - sintaxe da interação, onde clicar, que comandos usar).

13. **One of Jakob Nielson's usability heuristics is “Recognition rather than recall”. Explain what it means and give an illustrative example of how it can be used when choosing interaction styles to use in a user interface.**
    *   **Explicação:** "Reconhecimento em vez de recordação" significa que é psicologicamente mais fácil para os utilizadores reconhecerem opções, comandos ou informações quando lhes são apresentados, do que terem de se lembrar ("recordar") deles a partir da memória sem pistas (Slide 35, 36). O reconhecimento minimiza a carga de memória do utilizador.
    *   **Exemplo na escolha de estilos de interação:**
        *   **Menus (Reconhecimento):** Um menu suspenso (dropdown) ou uma barra de menus apresentam as opções disponíveis ao utilizador. Ele apenas precisa de *reconhecer* a opção desejada.
        *   **Linha de Comando (Recordação):** Numa interface de linha de comando, o utilizador precisa de *recordar* o nome exato do comando e a sua sintaxe para executar uma ação.
        *   **Escolha:** Para a maioria dos utilizadores, especialmente os menos experientes, interfaces baseadas em menus (GUI) são preferíveis a interfaces de linha de comando porque promovem o reconhecimento, tornando o sistema mais fácil de aprender e usar.

14. **What users’ physical characteristics should be considered during the development of an interactive computer system? Give some examples of the impact they may have on the system UX.**
    Diversas características físicas devem ser consideradas (Slide 50):
    *   **Visão:**
        *   **Deficiências de visão de cores (Daltonismo):** Se a cor for o único meio de transmitir informação (ex: um status indicado apenas por um ponto verde ou vermelho), utilizadores daltónicos terão uma má UX, pois não conseguirão distinguir a informação.
        *   **Baixa acuidade visual:** Fontes pequenas ou baixo contraste dificultam a leitura, causando fadiga e erros, resultando numa má UX.
    *   **Capacidades Motoras:**
        *   **Destreza limitada (ex: devido a artrite, Parkinson):** Alvos de clique muito pequenos, ou a necessidade de movimentos precisos como drag-and-drop, podem ser impossíveis de usar, levando a frustração e ineficácia (má UX).
        *   **Ser canhoto/destro:** A disposição de controlos primários pode ser menos ergonómica para canhotos se o design for exclusivamente pensado para destros, afetando o conforto e a eficiência (UX menos boa).
    *   **Idade:**
        *   **Utilizadores mais velhos:** Podem ter visão reduzida, audição diminuída, e tempos de reação mais lentos. Interfaces com texto pequeno, alertas apenas sonoros, ou elementos que desaparecem rapidamente podem gerar uma má UX.
    *   **Impacto na UX:** Não considerar estas características leva a sistemas inacessíveis, frustrantes, ineficientes e que excluem grupos de utilizadores, resultando numa experiência do utilizador (UX) globalmente pobre.

15. **How can a User Interface promote a good user mental model?**
    Uma interface pode promover um bom modelo mental do utilizador (a compreensão do utilizador sobre como o sistema funciona) através de:
    *   **Consistência:** Usar terminologia, layouts, ícones e comportamentos consistentes em todo o sistema. Isto torna o sistema previsível.
    *   **Feedback claro e imediato:** Informar o utilizador sobre o resultado das suas ações (ex: uma mensagem de "ficheiro guardado", uma mudança visual num botão após o clique).
    *   **Affordances e Signifiers claros:** Os objetos da interface devem sugerir visualmente como podem ser usados (affordance) e ter sinais claros (signifiers) que comunicam essas possibilidades de uso.
    *   **Mapeamento com o mundo real:** Usar conceitos, metáforas e linguagem familiares ao utilizador (Princípio de Nielsen).
    *   **Visibilidade do estado do sistema:** Manter o utilizador informado sobre o que está a acontecer no sistema (ex: barras de progresso, indicadores de carregamento).
    *   **Simplicidade e Clareza:** Evitar complexidade desnecessária e apresentar a informação de forma clara e organizada.
    *   **Prevenção de erros e recuperação fácil:** Guiar o utilizador para evitar erros e, se ocorrerem, fornecer mensagens claras e opções para os corrigir.
