package Adapter;

// O "Adapter". Ele implementa a interface que o nosso sistema quer (IDataAnalytics)
// e contém (embrulha) uma instância do objeto que queremos adaptar (SuperAnalyticsLib).

// TODO: Parte 1
// Faça com que esta classe implemente a interface IDataAnalytics.
public class AnalyticsAdapter implements IDataAnalytics{

    // TODO: Parte 2
    // Crie um atributo privado para guardar uma instância da SuperAnalyticsLib (o adaptee).
    
    // ... seu atributo aqui ...
    private SuperAnalyticsLib superanalyticsLib;
    
    
    // TODO: Parte 3
    // Crie um construtor que inicialize o atributo com uma nova instância da SuperAnalyticsLib.
    
    // ... seu construtor aqui ...

    public AnalyticsAdapter(){
        this.superanalyticsLib = new SuperAnalyticsLib();
    }


    // TODO: Parte 4
    // Implemente o método 'processXmlData' da interface IDataAnalytics.
    // Dentro deste método, precisa de fazer a "tradução":
    // 1. Converta os dados de XML para JSON (pode ser uma conversão simulada).
    // 2. Chame o método 'analyzeJsonData' do objeto SuperAnalyticsLib, passando os dados convertidos.


    @Override
    public void processXmlData(String xmlData) {
        System.out.println("Adapter: Recebi dados XML. A iniciar tradução...");
        
        // ... seu código de tradução e delegação aqui ...
        this.superanalyticsLib.analyzeJsonData(convertXmlToJson(xmlData));
        
        
        System.out.println("Adapter: Tradução e delegação concluídas.");
    }
    
    // Método auxiliar privado para simular a conversão
    private String convertXmlToJson(String xmlData) {
        System.out.println("Adapter: A converter '" + xmlData + "' para JSON...");
        // Simulação simples
        return "{ \"data\": \"" + xmlData.replaceAll("<data>", "").replaceAll("</data>", "") + "\" }";
    }
}