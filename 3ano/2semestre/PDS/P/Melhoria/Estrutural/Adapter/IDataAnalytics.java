package Adapter;

// A "Target Interface" - a interface que o nosso sistema entende.
public interface IDataAnalytics {
    // O nosso sistema espera um método que processe dados em formato XML.
    void processXmlData(String xmlData);
}