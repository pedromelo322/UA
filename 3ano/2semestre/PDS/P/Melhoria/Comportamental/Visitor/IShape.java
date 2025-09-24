package Visitor;

// A interface "Element".
public interface IShape {
    
    // TODO: Parte 1
    // Defina o método 'accept'. Este método recebe um objeto 'Visitor'
    // como argumento. É a porta de entrada para que o visitante possa
    // operar sobre o elemento.
    // Ex: void accept(IShapeVisitor visitor);

    public void accept(IShapeVisitor visitor);

}