package TemplateMethod;

// A classe base abstrata.
public abstract class DataProcessor {

    // TODO: Parte 1
    // Este é o "Template Method". Deve ser 'final' para que as subclasses
    // não possam alterar a sequência de passos do algoritmo.
    // Ele define o esqueleto do processo.
    // Sequência: openFile -> extractData -> analyzeData -> closeFile
    public final void processFile(String filePath) {
        // ... chame os 4 métodos na ordem correta aqui ...
        openFile(filePath);
        extractData(filePath);
        analyzeData(filePath);
        closeFile(filePath);
    }


    // TODO: Parte 2
    // Defina os métodos que representam os passos do algoritmo.
    // - Os passos que são variáveis (extractData e analyzeData) devem ser 'abstract'.
    // - Os passos que são comuns (openFile e closeFile) podem ter uma implementação padrão aqui.
    
    // Método comum a todos
    private void openFile(String filePath) {
        System.out.println("A abrir o ficheiro: " + filePath);
    }

    // Passos variáveis (a serem implementados pelas subclasses)
    // ... defina os seus métodos abstratos aqui ...

    protected abstract void extractData(String filePath);


    protected abstract void analyzeData(String filePath);
    
    // Método comum a todos
    private void closeFile(String filePath) {
        System.out.println("A fechar o ficheiro: " + filePath);
    }
}