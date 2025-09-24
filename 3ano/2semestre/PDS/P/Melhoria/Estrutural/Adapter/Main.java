package Adapter;

public class Main {
    public static void main(String[] args) {
        // Dados no formato que o nosso sistema usa
        String xmlData = "<data>Informação importante</data>";

        // O cliente só conhece a interface IDataAnalytics.
        // Ele não sabe (nem quer saber) que por baixo está a SuperAnalyticsLib.
        IDataAnalytics analyticsTool = new AnalyticsAdapter();
        
        System.out.println("Cliente: A processar dados com a minha ferramenta de analytics...");
        analyticsTool.processXmlData(xmlData);
        System.out.println("Cliente: Processamento terminado.");
    }
}