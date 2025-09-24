package Visitor;

import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // 1. Criar a estrutura de objetos (os elementos)
        List<IShape> shapes = Arrays.asList(
            new Circle(10),
            new Square(20),
            new Circle(5)
        );

        // 2. Criar uma instância do visitante para a operação que queremos executar
        IShapeVisitor xmlExporter = new XMLExportVisitor();
        IShapeVisitor areaCalculator = new AreaCalculatorVisitor();

        System.out.println("--- A exportar formas para XML usando o Visitor ---");
        
        // 3. Iterar pelos elementos e dizer a cada um para "aceitar" o visitante
        for (IShape shape : shapes) {
            shape.accept(xmlExporter);
            shape.accept(areaCalculator);
        }
    }
}