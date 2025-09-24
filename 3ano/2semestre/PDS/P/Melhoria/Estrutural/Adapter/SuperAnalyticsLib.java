package Adapter;

// O "Adaptee" - a classe existente com uma interface incompatível.
public class SuperAnalyticsLib {

    // Esta biblioteca só trabalha com dados em formato JSON.
    public void analyzeJsonData(String jsonData) {
        System.out.println("SuperAnalyticsLib: A analisar dados JSON -> " + jsonData);
        // ... lógica de análise super avançada ...
        System.out.println("SuperAnalyticsLib: Análise concluída com sucesso!");
    }
}