package TemplateMethod;

// TODO: Parte 3
// Crie a classe 'CsvDataProcessor' que herda de 'DataProcessor'.
// Implemente apenas os métodos abstratos 'extractData' e 'analyzeData'
// com a lógica específica para ficheiros CSV.

// ... sua classe CsvDataProcessor aqui ...

class CsvDataProcessor extends DataProcessor{


    public void extractData(String filePath){
        System.out.println("A extrair dados do ficheiro CSV, linha por linha...");
    }


    public void analyzeData(String filePath){
        System.out.println("A analisar os dados de vendas para gerar um relatório...");
    }

}


// TODO: Parte 4 (Desafio extra)
// Crie a classe 'JsonDataProcessor' que herda de 'DataProcessor'.
// Implemente os métodos abstratos com a lógica específica para ficheiros JSON.

// ... sua classe JsonDataProcessor aqui ...


class JsonDataProcessor extends DataProcessor{


    public void extractData(String filePath){
        System.out.println("A extrair dados do ficheiro JSON...");
    }


    public void analyzeData(String filePath){
        System.out.println("A validar o esquema e os tipos de dados da configuração...");
    }

}
