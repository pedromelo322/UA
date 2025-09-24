package Decorator;

// O "ConcreteComponent". O objeto base ao qual adicionaremos funcionalidades.
public class SimpleCoffee implements ICoffee {
    
    @Override
    public double getCost() {
        return 2.0; // O custo de um café simples é 2.0
    }

    @Override
    public String getDescription() {
        return "Café simples";
    }
}