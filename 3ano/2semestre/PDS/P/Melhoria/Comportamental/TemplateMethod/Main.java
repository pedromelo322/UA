package TemplateMethod;

public class Main {
    public static void main(String[] args) {
        
        System.out.println("--- A processar um ficheiro CSV ---");
        DataProcessor csvProcessor = new CsvDataProcessor();
        // O cliente chama apenas o método modelo.
        csvProcessor.processFile("dados_vendas.csv");

        System.out.println("\n--------------------------------------\n");

        System.out.println("--- A processar um ficheiro JSON ---");
        DataProcessor jsonProcessor = new JsonDataProcessor();
        // O cliente chama o mesmo método modelo.
        jsonProcessor.processFile("configuracoes_app.json");
    }
}