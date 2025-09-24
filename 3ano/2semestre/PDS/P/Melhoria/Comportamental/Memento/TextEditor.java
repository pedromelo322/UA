package Memento;

// O "Originator". O objeto cujo estado queremos guardar.
public class TextEditor {
    private String currentText;

    public TextEditor() {
        this.currentText = "";
    }
    
    public void write(String text) {
        this.currentText += text;
    }
    
    public String getText() {
        return currentText;
    }

    // TODO: Parte 4
    // Crie o método 'save()', que cria e retorna um Memento do estado atual.
    // Ele deve criar uma nova instância de TextEditorMemento, passando-lhe
    // o 'currentText' atual.
    
    // ... seu método save() aqui ...

    public TextEditorMemento save(){
        return new TextEditorMemento(currentText);
    }
    
    
    // TODO: Parte 5
    // Crie o método 'restore(TextEditorMemento memento)', que restaura o estado
    // do editor a partir de um Memento.
    // Ele deve obter o estado guardado do memento (usando getState()) e
    // atribuí-lo ao 'currentText'.

    // ... seu método restore() aqui ...
    public void restore(TextEditorMemento memento){
        this.currentText = memento.getState();
    }
}