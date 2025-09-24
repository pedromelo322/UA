package Visitor;

// A interface "Visitor".
public interface IShapeVisitor {
    
    // TODO: Parte 4
    // Defina um método 'visit' sobrecarregado (overloaded) para CADA
    // tipo concreto de elemento que o visitante pode "visitar".
    // Ex: void visit(Circle circle);
    // Ex: void visit(Square square);
    
    // ... seus métodos visit aqui ...

    public void visit(Circle circle);


    public void visit(Square square);


}