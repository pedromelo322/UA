package Memento;

public class Main {
    public static void main(String[] args) {
        TextEditor editor = new TextEditor();
        HistoryManager history = new HistoryManager();

        // Escrever texto e guardar o estado a cada passo
        history.saveState(editor); // Guardar o estado inicial (vazio)
        System.out.println("Estado atual: '" + editor.getText() + "'");

        editor.write("Olá ");
        history.saveState(editor);
        System.out.println("Estado atual: '" + editor.getText() + "'");
        
        editor.write("Mundo!");
        history.saveState(editor);
        System.out.println("Estado atual: '" + editor.getText() + "'");

        editor.write(" Como estás?");
        // Não vamos guardar este último estado
        System.out.println("Estado atual: '" + editor.getText() + "'");
        
        System.out.println("\n--- A anular as alterações ---");

        // Anular a última alteração guardada
        history.undo(editor);
        System.out.println("Depois do 1º undo: '" + editor.getText() + "'");

        // Anular novamente
        history.undo(editor);
        System.out.println("Depois do 2º undo: '" + editor.getText() + "'");

        // Anular para o estado inicial
        history.undo(editor);
        System.out.println("Depois do 3º undo: '" + editor.getText() + "'");
        
        // Tentar anular mais uma vez (não deve fazer nada, pois o histórico está vazio)
        history.undo(editor);
        System.out.println("Depois do 4º undo: '" + editor.getText() + "'");
    }
}