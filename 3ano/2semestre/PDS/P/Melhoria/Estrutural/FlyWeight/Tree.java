package FlyWeight;

// O "Contexto" ou cliente do Flyweight.
// Armazena o estado extrínseco e uma referência ao Flyweight.
public class Tree {
    private int x, y, size; // Estado extrínseco (único para cada árvore)
    private TreeType type; // Referência ao objeto Flyweight partilhado

    public Tree(int x, int y, int size, TreeType type) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.type = type;
    }

    public void draw() {
        // Delega a renderização para o objeto Flyweight, passando o estado extrínseco.
        type.draw(x, y, size);
    }
}