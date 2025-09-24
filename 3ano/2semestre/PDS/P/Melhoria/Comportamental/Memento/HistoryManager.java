package Memento;

import java.util.Stack;

// O "Caretaker". Guarda os Mementos, mas não acede ao seu conteúdo.
public class HistoryManager {
    
    // TODO: Parte 6
    // Crie uma pilha (Stack) para armazenar os Mementos.
    private final Stack<TextEditorMemento> history = new Stack<>();


    // TODO: Parte 7
    // Crie o método 'saveState(TextEditor editor)'.
    // Ele deve pedir ao editor para criar um Memento do seu estado atual
    // e guardá-lo (fazer push) na pilha de histórico.
    
    // ... seu método saveState() aqui ...

    public void saveState(TextEditor editor){
        history.add(editor.save());
    }
    
    
    // TODO: Parte 8
    // Crie o método 'undo(TextEditor editor)'.
    // 1. Verifique se a pilha de histórico não está vazia.
    // 2. Se não estiver, retire (faça pop) o último Memento da pilha.
    // 3. Peça ao editor para restaurar o seu estado usando esse Memento.
    
    // ... seu método undo() aqui ...

    public void undo(TextEditor editor){
        if (!history.empty()){
            editor.restore(history.pop());
        }
    }
}