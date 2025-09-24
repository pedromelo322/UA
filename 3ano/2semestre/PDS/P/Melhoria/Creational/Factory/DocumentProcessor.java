// O "Creator" abstrato. Define o fluxo de trabalho e o método fábrica.
public abstract class DocumentProcessor {

    // TODO: Parte 1
    // Defina o método fábrica abstrato.
    // Este método será responsável por criar um objeto 'Document'.
    // Qual deve ser o nome e a assinatura deste método?
    // Pense em algo como "createDocument".
    
    // ... seu código aqui ...
    public abstract Document createDocument();
    
    // Este é o método principal que define o fluxo de trabalho.
    // Ele não sabe qual tipo de documento está a processar, apenas que é um 'Document'.
    public void processDocument() {
        // Usa o método fábrica para obter o objeto a ser processado
        Document doc = createDocument(); // <- O método que você definiu

        doc.open();
        doc.process();
        doc.save();
    }
}

// TODO: Parte 2
// Crie a classe 'ReportProcessor', uma subclasse concreta de DocumentProcessor.
// Esta classe deve implementar o método fábrica para criar um 'ReportDocument'.

// ... sua classe ReportProcessor aqui ...

class ReportProcessor extends DocumentProcessor{


    public Document createDocument(){
        return new ReportDocument();
    }

}


// TODO: Parte 3 (Desafio extra)
// Crie outra classe concreta, 'LetterProcessor', que cria um 'LetterDocument'.

// ... sua classe LetterProcessor aqui ...

class LetterProcessor extends DocumentProcessor{


    public Document createDocument(){
        return new LetterDocument();
    }

}