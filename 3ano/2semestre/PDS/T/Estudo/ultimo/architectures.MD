### **1. Layered Architecture (Arquitetura em Camadas)**

*   **Conceito:** Organiza o sistema em camadas horizontais empilhadas umas sobre as outras. Cada camada tem uma responsabilidade específica e, por norma, a comunicação só é permitida com a camada imediatamente adjacente (geralmente a de baixo).


---

### **2. Event-Driven Architecture (Arquitetura Orientada a Eventos)**

*   **Conceito:** A comunicação entre os componentes do sistema é feita através da produção e consumo de eventos. Os componentes são altamente desacoplados e reagem a eventos em vez de se chamarem diretamente.


---

### **3. Microkernel Architecture (ou Plugin Architecture)**

*   **Conceito:** Consiste num sistema "core" mínimo (o **Microkernel**) que fornece a funcionalidade essencial e um mecanismo de "plugin" que permite estender essa funcionalidade.


### **4. Microservices Architecture (Arquitetura de Microsserviços)**

*   **Conceito:** Decompõe uma aplicação grande e monolítica num conjunto de serviços pequenos, independentes e focados numa única capacidade de negócio. Cada microsserviço é desenvolvido, implementado e escalado de forma autónoma.


### **5. Space-Based Architecture (ou Cloud Architecture Pattern)**

*   **Conceito:** Uma arquitetura desenhada para resolver problemas de alta escalabilidade e concorrência, evitando o problema do "funil" da base de dados. A lógica de negócio e os dados são colocados juntos em unidades de processamento auto-suficientes.
