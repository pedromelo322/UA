package Visitor;

// O "ConcreteVisitor". Implementa a operação a ser realizada.

// TODO: Parte 5
// Crie a classe 'XMLExportVisitor' que implementa a interface 'IShapeVisitor'.
// Implemente cada método 'visit'. A lógica dentro de cada método deve
// imprimir a representação XML da forma específica que recebeu.
// Ex: no visit(Circle circle), imprima "<circle radius='...' />".

// ... sua classe XMLExportVisitor aqui ...


public class XMLExportVisitor implements IShapeVisitor{

    @Override
    public void visit(Circle circle) {
        System.out.println("<circle radius= " + circle.getRadius() + ">");
    }

    @Override
    public void visit(Square square) {
        System.out.println("<square side= " + square.getSide() + ">");
        
    }

    

}



class AreaCalculatorVisitor implements IShapeVisitor{

    @Override
    public void visit(Circle circle) {
        System.out.println("<circle area= " + Math.PI * circle.getRadius() * circle.getRadius() + ">");
    }

    @Override
    public void visit(Square square) {
        System.out.println("<square area= " + square.getSide() * square.getSide() + ">");
        
    }

    

}
