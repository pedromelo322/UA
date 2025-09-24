package Visitor;

// "ConcreteElement" 1
class Circle implements IShape {
    private int radius;
    public Circle(int radius) { this.radius = radius; }
    public int getRadius() { return radius; }
    

    // TODO: Parte 2
    // Implemente o método 'accept' para a classe Circle.
    // A sua única responsabilidade é chamar o método 'visit' do visitante,
    // passando a si mesmo (this) como argumento.
    // Ex: visitor.visit(this);
    
    // ... seu método accept aqui ...

    @Override
    public void accept(IShapeVisitor visitor) {
        visitor.visit(this);
    }

    
}

// "ConcreteElement" 2
class Square implements IShape {
    private int side;
    public Square(int side) { this.side = side; }
    public int getSide() { return side; }

    // TODO: Parte 3
    // Faça o mesmo para a classe Square. Implemente o método 'accept'.
    
    // ... seu método accept aqui ...


    @Override
    public void accept(IShapeVisitor visitor) {
        visitor.visit(this);
    }

}