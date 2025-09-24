package Decorator;

public class Main {
    public static void main(String[] args) {
        
        // 1. Criar um café simples
        ICoffee myCoffee = new SimpleCoffee();
        System.out.println("Pedido 1: " + myCoffee.getDescription() + " | Custo: " + myCoffee.getCost());
        
        // 2. Decorar o café com leite
        myCoffee = new MilkDecorator(myCoffee);
        System.out.println("Pedido 2: " + myCoffee.getDescription() + " | Custo: " + myCoffee.getCost());

        // 3. Decorar o mesmo café agora também com chocolate
        myCoffee = new ChocolateDecorator(myCoffee);
        System.out.println("Pedido 3: " + myCoffee.getDescription() + " | Custo: " + myCoffee.getCost());
        
        System.out.println("\n--- Outro Pedido ---");

        // 4. Criar um novo café complexo de uma só vez
        ICoffee anotherCoffee = new SugarDecorator(new MilkDecorator(new SimpleCoffee()));
        System.out.println("Pedido 4: " + anotherCoffee.getDescription() + " | Custo: " + anotherCoffee.getCost());
    }
}