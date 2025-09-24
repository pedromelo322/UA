Ótima ideia. Adicionar a pergunta conceptual torna os exercícios muito mais completos. Aqui estão os 5 exercícios, com nomes genéricos e uma pergunta conceptual para cada um.

---

### **Exercício 1**

**Considere o seguinte excerto de código:**
```java
public class ConfigurableThing {
    private final Object partA;
    private final Object partB;

    private ConfigurableThing(SetupHelper helper) {
        this.partA = helper.partA;
        this.partB = helper.partB;
    }

    public static class SetupHelper {
        private Object partA;
        private Object partB;
        public SetupHelper withPartA(Object a) { this.partA = a; return this; }
        public SetupHelper withPartB(Object b) { this.partB = b; return this; }
        public ConfigurableThing create() { return new ConfigurableThing(this); }
    }
}
```
**a. Indique de que padrão se trata.**

**Padrão:** Builder

**b. Explique qual a principal vantagem desta abordagem em comparação com o uso de múltiplos construtores (padrão "construtor telescópico").**

A principal vantagem do padrão Builder é a clareza e a flexibilidade na criação de objetos com muitos parâmetros, especialmente os opcionais.

---

### **Exercício 2**

**Considere o seguinte excerto de código:**
```java
public class CentralManager {
    private static CentralManager managerInstance;

    private CentralManager() { /* Inicialização dispendiosa */ }

    public static synchronized CentralManager getManager() {
        if (managerInstance == null) {
            managerInstance = new CentralManager();
        }
        return managerInstance;
    }
    
    public void doWork() { /* ... */ }
}
```
**a. Indique de que padrão se trata.**

**Padrão:** Singleton

**b. Para além de garantir uma única instância, qual o propósito da palavra-chave `synchronized` no método de acesso e por que é ela importante?**

O propósito da palavra-chave synchronized é garantir a segurança em ambientes com múltiplas threads (thread-safety). A sua importância é crítica para evitar uma "race condition": se duas threads chamassem o método getManager() ao mesmo tempo e a instância ainda fosse nula, ambas poderiam passar pela verificação if (managerInstance == null) antes que qualquer uma delas tivesse tempo de criar o objeto. O resultado seria a criação de duas instâncias, violando o princípio fundamental do Singleton.




---

### **Exercício 3**

**Considere o seguinte excerto de código:**
```java
public interface Part1 { /* ... */ }
public interface Part2 { /* ... */ }

public interface AssemblyKit {
    Part1 producePart1();
    Part2 producePart2();
}
```
**a. Indique de que padrão se trata.**

**Padrão:** Abstract Factory

**b. Explique como este padrão ajuda a garantir a consistência entre os diferentes tipos de "partes" criadas.**

Este padrão garante a consistência ao agrupar a criação de uma família de objetos relacionados numa única fábrica concreta.

---

### **Exercício 4**

**Considere o seguinte excerto de código:**
```java
public abstract class MainProcess {
    public void run() {
        // ... lógica comum ...
        SubTask task = createSubTask();
        task.execute();
        // ... mais lógica comum ...
    }
    
    protected abstract SubTask createSubTask();
}
```
**a. Indique de que padrão se trata.**

**Padrão:** Factory

**b. Explique como este padrão permite que uma classe base defina um "esqueleto" de um algoritmo, enquanto adia a implementação de alguns passos para as suas subclasses.**

O "esqueleto" do algoritmo é o método run() na classe base (MainProcess). Ele define a sequência de operações de alto nível, que são comuns a todas as variações do processo.

---

### **Exercício 5**

**Considere o seguinte excerto de código:**
```java
public interface Copiable {
    Copiable copy();
}

public class MyItem implements Copiable {
    @Override
    public Copiable copy() {
        // ... lógica para criar uma cópia ...
        return new MyItem();
    }O "esqueleto" do algoritmo é o método run() na classe base (MainProcess). Ele define a sequência de operações de alto nível, que são comuns a todas as variações do processo.
}
```
**a. Indique de que padrão se trata.**

**Padrão:** Prototype

**b. Descreva um cenário em que a criação de um objeto através da cópia de um existente é mais vantajosa do que usar um construtor `new` do zero.**

A cópia de um objeto existente é mais vantajosa quando o processo de inicialização de um novo objeto é muito dispendioso em termos de recursos ou tempo. 



### **Exercício 6**

**Considere o seguinte excerto de código:**
```java
public class ReusableWorker {
    public void performTask() { /* ... Lógica de trabalho ... */ }
    public void reset() { /* ... Limpa o estado para reutilização ... */ }
}

public class WorkerProvider {
    private List<ReusableWorker> pool = new ArrayList<>();

    public synchronized ReusableWorker getWorker() {
        if (!pool.isEmpty()) {
            return pool.remove(0);
        }
        // Se a pool estiver vazia, cria um novo
        return new ReusableWorker();
    }
    
    public synchronized void returnWorker(ReusableWorker worker) {
        worker.reset();
        pool.add(worker);
    }
}
```

**a. Indique de que padrão se trata.**

**Padrão:** ObjectPool

**b. Explique por que este padrão é particularmente útil para objetos cuja criação é "dispendiosa" (custosa), como ligações a bases de dados ou threads.**

Este padrão é útil para objetos "dispendiosos" porque ataca diretamente o principal problema de desempenho: o alto custo de inicialização e destruição.