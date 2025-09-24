# Enunciado dos Exercícios GRASP

### **Exercício 1 (Information Expert & High Cohesion)**

**[3] Considere o seguinte código que gera um relatório de desempenho de um aluno. Reescreva-o, atendendo nomeadamente aos princípios GRASP de "Information Expert" e "High Cohesion". Justifique como a sua solução melhora a coesão das classes e o encapsulamento.**

```java
public class Grade { // Nota de uma disciplina
    private String courseName;
    private double score; // e.g., 15.5
    // Construtores, getters...
    public double getScore() { return score; }
}

public class Student {
    private String name;
    private List<Grade> grades;
    // Construtores, getters...
    public List<Grade> getGrades() { return grades; } // Expõe a lista interna
}

public class ReportService {
    // Serviço que calcula a média do aluno
    public double calculateAverageGrade(Student student) {
        double sum = 0;
        List<Grade> grades = student.getGrades(); // Pede os dados ao aluno
        
        if (grades.isEmpty()) {
            return 0;
        }

        for (Grade grade : grades) {
            sum += grade.getScore(); // Faz o cálculo externamente
        }
        return sum / grades.size();
    }
}
```

---

### **Exercício 2 (Creator)**

**[2] Considere o seguinte código de um jogo onde o nível principal é responsável por criar monstros e colocá-los numa masmorra. Reescreva o código de forma que a responsabilidade de criação seja atribuída segundo o princípio GRASP "Creator". Explique por que a sua solução é preferível.**

```java
public class Monster { /* ... */ }
public class Dungeon {
    private List<Monster> monsters;
    public void addMonster(Monster m) { this.monsters.add(m); }
    // ...
}

public class GameLevel {
    private Dungeon mainDungeon;

    // Método principal que cria e adiciona monstros
    public void spawnMonsters(int quantity) {
        for (int i = 0; i < quantity; i++) {
            Monster newMonster = new Monster(); // A classe GameLevel cria o monstro
            mainDungeon.addMonster(newMonster); // E adiciona-o à masmorra
        }
    }
}
```

---

### **Exercício 3 (Polymorphism & Protected Variations)**

**[3] Considere o seguinte código de um processador de documentos que desenha diferentes elementos na tela. O código atual usa `instanceof` para decidir como desenhar cada elemento. Refatore-o para usar o princípio GRASP "Polymorphism", eliminando as condicionais e tornando o sistema extensível a novos tipos de elementos.**

```java
public class Paragraph { /* ... */ }
public class Image { /* ... */ }
public class Table { /* ... */ }

public class DocumentRenderer {
    public void render(List<Object> elements) {
        for (Object element : elements) {
            if (element instanceof Paragraph) {
                // Lógica para desenhar um parágrafo
                System.out.println("A desenhar parágrafo...");
            } else if (element instanceof Image) {
                // Lógica para desenhar uma imagem
                System.out.println("A desenhar imagem...");
            } else if (element instanceof Table) {
                // Lógica para desenhar uma tabela
                System.out.println("A desenhar tabela...");
            }
        }
    }
}
```

---

### **Exercício 4 (Controller)**

**[3] Considere o código de uma janela de uma loja online, onde o código do botão "Adicionar ao Carrinho" está diretamente na classe da UI, manipulando o modelo e a base de dados. Explique como isto viola a separação de responsabilidades e refatore o código, introduzindo um "Controller" para mediar a interação entre a UI e o domínio do negócio.**

```java
public class ShoppingCart { /* ... */ }
public class ProductDAO { /* ... (acesso a dados do produto) ... */ }

public class ProductView extends JFrame {
    private JButton addToCartButton;
    private Product currentProduct;
    private ShoppingCart cart;

    public ProductView() {
        // ... inicialização da UI ...
        addToCartButton.addActionListener(e -> {
            // Lógica diretamente no listener da UI
            cart.addItem(currentProduct); // Manipula o modelo
            ProductDAO dao = new ProductDAO();
            dao.updateStock(currentProduct.getId(), -1); // Acede à base de dados
            
            JOptionPane.showMessageDialog(this, "Produto adicionado!");
        });
    }
}
```

---

### **Exercício 5 (Low Coupling & Law of Demeter)**

**[2] O código seguinte tenta obter o código postal do escritório de um gestor de departamento. Explique como a longa cadeia de chamadas (`get...().get...()`) viola o princípio "Low Coupling" (especificamente, a Lei de Demeter). Refatore o código para que a classe `Company` não precise de conhecer a estrutura interna dos seus departamentos.**

```java
public class Address { public String getPostalCode() { return "1234-567"; } }
public class Office { private Address address; public Address getAddress() { return address; } }
public class Manager { private Office office; public Office getOffice() { return office; } }
public class Department { private Manager manager; public Manager getManager() { return manager; } }

public class Company {
    public void printManagerPostalCode(Department dept) {
        // Violação: "falar com estranhos"
        String postalCode = dept.getManager().getOffice().getAddress().getPostalCode();
        System.out.println("Código Postal do Gestor: " + postalCode);
    }
}
```

---

### **Exercício 6 (Pure Fabrication)**

**[3] Uma classe de domínio `User` está a tornar-se pouco coesa porque contém lógica de negócio e, também, a responsabilidade de se guardar numa base de dados SQL. Explique como isto viola a "High Cohesion" e o "Low Coupling". Refatore o código usando o princípio "Pure Fabrication" para separar a lógica de persistência da lógica de negócio.**

```java
public class User {
    private String username;
    private String email;

    // ... getters, setters e lógica de negócio ...
    public boolean hasValidEmail() {
        return email != null && email.contains("@");
    }
    
    // Responsabilidade que não pertence ao domínio
    public void saveToDatabase() {
        // Código SQL complexo para inserir ou atualizar o utilizador na BD
        // Ex: Connection conn = ...; PreparedStatement stmt = ...;
        System.out.println("A guardar " + username + " na base de dados...");
    }
}
```

---

### **Exercício 7 (Low Coupling & Information Expert)**

**[2] Num sistema de faturação, a classe `AccountingSystem` é responsável por decidir se uma fatura pode ser enviada a um cliente, verificando o seu estado de crédito. Isto cria um acoplamento entre `AccountingSystem` e `Customer`. Refatore o código para que a responsabilidade de decisão seja atribuída ao "Information Expert" correto, reduzindo o acoplamento geral.**

```java
public class Customer {
    public boolean hasGoodCredit() { /* ... verifica o estado de crédito ... */ return true; }
}
public class Invoice {
    private Customer customer;
    public Customer getCustomer() { return customer; }
    public void send() { System.out.println("A enviar fatura..."); }
}

public class AccountingSystem {
    public void processAndSendInvoice(Invoice invoice) {
        // ... outro processamento ...

        // Sistema de contabilidade toma a decisão, acoplando-se a Customer
        if (invoice.getCustomer().hasGoodCredit()) {
            invoice.send();
        } else {
            System.out.println("Não foi possível enviar a fatura. Mau crédito.");
        }
    }
}
```

---

### **Exercício 8 (Indirection & Protected Variations)**

**[3] Uma aplicação de meteorologia obtém dados de um serviço externo cuja API é complexa e instável. A classe `WeatherReport` está diretamente acoplada a este serviço. Use os princípios "Indirection" e "Protected Variations" para introduzir uma camada de abstração (um "Adapter") que proteja a sua aplicação de futuras alterações na API externa.**

```java
// API Externa - Não pode ser alterada
public class ExternalWeatherAPI {
    // Método complexo que devolve dados num formato proprietário
    public ProprietaryWeatherData fetchWeatherData(String location) { /* ... */ return null; }
}

public class WeatherReport {
    public void generateReport(String city) {
        ExternalWeatherAPI externalAPI = new ExternalWeatherAPI();
        // Acoplamento direto à API externa e seu formato de dados
        ProprietaryWeatherData data = externalAPI.fetchWeatherData(city);
        // ... lógica para converter dados proprietários e gerar o relatório ...
        System.out.println("Relatório gerado para " + city);
    }
}
// Classe auxiliar que não pode ser alterada
class ProprietaryWeatherData { /* ... */ }
```

---

### **Exercício 9 (High Cohesion)**

**[2] Uma classe utilitária `DataProcessor` foi criada para conter várias operações relacionadas com dados. Com o tempo, acumulou responsabilidades de leitura, formatação e envio de dados, tornando-se pouco coesa. Explique como isto viola o princípio "High Cohesion" e refatore a classe, dividindo-a em classes menores e mais focadas.**

```java
public class DataProcessor {
    public String readDataFromUrl(String url) {
        // Lógica para fazer um pedido HTTP e ler os dados
        return "dados brutos";
    }

    public String formatAsJson(String rawData) {
        // Lógica para converter os dados para o formato JSON
        return "{'data': '" + rawData + "'}";
    }
    
    public void sendToApiEndpoint(String jsonData, String endpoint) {
        // Lógica para enviar os dados JSON para uma API
        System.out.println("A enviar dados para " + endpoint);
    }
}
```

---

### **Exercício 10 (Creator & Information Expert)**

**[3] Num sistema de uma pizzaria, a classe `OrderService` recebe um pedido e é responsável por criar o objeto `Pizza`, adicionando os ingredientes um a um. Reescreva o código de forma que as responsabilidades de criação e configuração da pizza sejam atribuídas de forma mais lógica, seguindo os princípios "Creator" e "Information Expert".**

```java
public class Ingredient { /* ... */ }
public class Pizza {
    private List<Ingredient> toppings;
    public void addTopping(Ingredient topping) { /* ... */ }
}

public class OrderService {
    public Pizza createMargheritaPizza() {
        // O serviço de encomendas conhece os detalhes de como fazer uma pizza
        Pizza pizza = new Pizza(); // O serviço cria a pizza
        
        Ingredient tomato = new Ingredient("Tomate");
        Ingredient cheese = new Ingredient("Queijo");
        Ingredient basil = new Ingredient("Manjericão");
        
        pizza.addTopping(tomato); // O serviço adiciona os ingredientes
        pizza.addTopping(cheese);
        pizza.addTopping(basil);
        
        return pizza;
    }
}
```