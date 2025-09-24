package Memento;

// O "Memento". Contém o estado a ser guardado.
public class TextEditorMemento {
    
    // TODO: Parte 1
    // Crie um atributo PRIVADO para guardar o estado (o texto).
    // Use 'private final String textState;' para garantir que o estado
    // de um memento nunca muda depois de criado.
    
    // ... seu atributo aqui ...

    private final String textState;


    // TODO: Parte 2
    // Crie um construtor que recebe o estado (String) e o guarda no atributo.
    // Este construtor deve ter visibilidade 'package-private' (sem public/private)
    // para que apenas classes no mesmo pacote (como o TextEditor) o possam usar.
    
    // ... seu construtor aqui ...

    protected TextEditorMemento(String textState){
        this.textState = textState;
    }
    

    // TODO: Parte 3
    // Crie um método 'getState()' para que o Originator (TextEditor) possa
    // recuperar o estado guardado. Este método também deve ser 'package-private'.
    
    // ... seu método getState() aqui ...

    protected String getState(){
        return textState;
    }

}