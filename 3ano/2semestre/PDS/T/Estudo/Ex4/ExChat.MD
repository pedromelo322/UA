
### **Exercício 1**

**[3] Considere o seguinte código para um sistema de gestão de configurações. Complete-o e/ou reescreva-o de forma a garantir que existe apenas uma única instância da classe `AppConfig` em toda a aplicação, e que o acesso a essa instância é controlado e centralizado.**

```java
public class AppConfig {
    
    private String databaseUrl;
    private int maxConnections;

    // O construtor é público, permitindo múltiplas instâncias
    public AppConfig() {
        // Simula a leitura de configurações de um ficheiro
        this.databaseUrl = "jdbc:mysql://localhost/prod_db";
        this.maxConnections = 100;
        System.out.println("Instância de AppConfig criada.");
    }

    public String getDatabaseUrl() {
        return databaseUrl;
    }
}

// Exemplo de uso problemático em várias partes do código:
public class DatabaseConnector {
    public void connect() {
        AppConfig config = new AppConfig(); // Cria uma nova instância
        System.out.println("A ligar a: " + config.getDatabaseUrl());
    }
}

public class ReportGenerator {
    public void generate() {
        AppConfig config = new AppConfig(); // Cria outra nova instância
        // ...
    }
}
```

---

### **Exercício 2**

**[3] Considere o seguinte excerto de código para uma aplicação de desenho gráfico. A classe `Canvas` precisa de criar diferentes formas geométricas, mas o código atual está fortemente acoplado às classes concretas. Refatore a estrutura para que a `Canvas` possa delegar a decisão de qual forma criar para as suas subclasses (`PosterCanvas`, `BlueprintCanvas`), sem alterar o seu método principal `drawDesign`.**

```java
// Hierarquia de produtos
abstract class Shape { /* ... */ }
class Circle extends Shape { /* ... */ }
class Square extends Shape { /* ... */ }

// A classe base que usa os produtos
abstract class Canvas {
    
    // Este método usa um objeto 'Shape', mas não sabe como criá-lo
    public void drawDesign() {
        Shape newShape = createShape(); // Como implementar isto?
        // ... lógica para desenhar a forma na tela ...
        System.out.println("Forma desenhada na tela.");
    }

    // Este método está por definir
    protected abstract Shape createShape();
}

// Subclasses que deveriam decidir qual forma criar
class PosterCanvas extends Canvas {
    // Como fazer com que esta classe crie sempre um Circle?
    @Override
    protected Shape createShape() {
        return new Circle(); // Exemplo de como poderia ser
    }
}

class BlueprintCanvas extends Canvas {
    // Como fazer com que esta classe crie sempre um Square?
    @Override
    protected Shape createShape() {
        return new Square(); // Exemplo de como poderia ser
    }
}
```

---

### **Exercício 3**

**[2] Considere o seguinte excerto de código e complete a classe `Document` de forma que a seguinte implementação para criar documentos com diferentes configurações seja possível e legível.**

```java
public class Main {
    public static void main(String[] args) {
        
        // Queremos construir um objeto 'Document' passo a passo
        Document report = new Document()
                            .setTitle("Relatório Anual")
                            .setAuthor("Ana Silva")
                            .setPageSize("A4")
                            .setEncrypted(true);

        System.out.println("Documento criado: " + report);
    }
}

// A classe a ser completada:
public class Document {
    private String title;
    private String author;
    private String pageSize;
    private boolean isEncrypted;

    // Como implementar os métodos para que o encadeamento funcione?
    // Como é que o objeto final é construído?
}
```

---

### **Exercício 4**

**[3] Considere o seguinte sistema para montar computadores. Um `ComputerShop` precisa de montar um computador, mas os componentes (CPU e RAM) variam consoante o tipo de computador (ex: "Gaming" ou "Office"). O código atual mistura a lógica de montagem com a criação dos componentes. Refatore o código para que a loja (`ComputerShop`) possa montar um computador sem saber os tipos concretos das peças, delegando a criação da "família" de componentes a uma fábrica.**

```java
// Família de produtos 1: Gaming
class GamingCPU { /* ... */ }
class GamingRAM { /* ... */ }

// Família de produtos 2: Office
class OfficeCPU { /* ... */ }
class OfficeRAM { /* ... */ }

public class ComputerShop {
    
    // Método que está acoplado a uma família de componentes
    public void assembleGamingComputer() {
        GamingCPU cpu = new GamingCPU();
        GamingRAM ram = new GamingRAM();
        // ... lógica de montagem com as peças de gaming ...
        System.out.println("Computador Gaming montado.");
    }
    
    // Para montar um computador de escritório, seria necessário outro método
    public void assembleOfficeComputer() {
        OfficeCPU cpu = new OfficeCPU();
        OfficeRAM ram = new OfficeRAM();
        // ... lógica de montagem com as peças de escritório ...
        System.out.println("Computador de Escritório montado.");
    }
}
```

---

### **Exercício 5**

**[3] Considere o seguinte código de um jogo onde a criação de um `Monster` é um processo complexo. Para evitar recriar monstros do zero, o sistema precisa de um "registo" de monstros pré-configurados que possam ser clonados para criar novas instâncias. Complete a classe `MonsterRegistry` e modifique a `Monster` para que a criação de novos monstros seja feita através da clonagem de um protótipo.**

```java
// A classe Monster precisa de ser clonável
public class Monster {
    private String type;
    private int health;
    private int attackPower;

    public Monster(String type, int health, int attackPower) {
        this.type = type;
        this.health = health;
        this.attackPower = attackPower;
    }
    // ... como tornar esta classe clonável? ...
}

public class MonsterRegistry {

    private Map<String, Monster> prototypes = new HashMap<>();

    public MonsterRegistry() {
        // Carrega os protótipos iniciais
        prototypes.put("Goblin", new Monster("Goblin", 50, 5));
        prototypes.put("Ogre", new Monster("Ogre", 200, 20));
    }

    // Como implementar este método para devolver um CLONE do protótipo?
    public Monster createMonster(String type) {
        // ???
    }
}

// Exemplo de uso desejado
public class Game {
    public static void main(String[] args) {
        MonsterRegistry registry = new MonsterRegistry();
        Monster goblin1 = registry.createMonster("Goblin");
        Monster goblin2 = registry.createMonster("Goblin"); // Deve ser uma nova instância
    }
}
```

---

### **Exercício 6**

**[2] Considere a criação de ligações a uma base de dados. Este é um processo dispendioso e o sistema não deve criar uma nova ligação sempre que precisar de uma. Complete o código da classe `DatabaseConnectionPool` para que ela gira um número limitado de ligações, emprestando-as aos clientes quando necessário e recebendo-as de volta quando o uso termina, em vez de as fechar.**

```java
// A ligação à BD (um objeto caro de criar)
public class DatabaseConnection {
    public DatabaseConnection() {
        // Simula o processo demorado de estabelecer a ligação
        try { Thread.sleep(1000); } catch (InterruptedException e) {}
        System.out.println("Nova ligação à BD criada.");
    }
    public void executeQuery(String query) { /* ... */ }
}

public class DatabaseConnectionPool {

    private List<DatabaseConnection> availableConnections;
    private List<DatabaseConnection> usedConnections;
    private final int MAX_POOL_SIZE = 3;

    public DatabaseConnectionPool() {
        availableConnections = new ArrayList<>();
        usedConnections = new ArrayList<>();
        // Pré-carrega a pool com algumas ligações
        for (int i = 0; i < MAX_POOL_SIZE; i++) {
            availableConnections.add(new DatabaseConnection());
        }
    }

    // Como implementar o método para "emprestar" uma ligação?
    public DatabaseConnection acquireConnection() {
        // ???
    }

    // Como implementar o método para "devolver" uma ligação à pool?
    public void releaseConnection(DatabaseConnection connection) {
        // ???
    }
}
```