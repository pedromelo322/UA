package Strategy;

// O "Contexto". Usa um objeto Strategy para realizar o seu trabalho.
public class ShippingCalculator {
    
    // TODO: Parte 5
    // Crie um atributo para guardar a estratégia de cálculo de portes atual.
    private IShippingStrategy shippingStrategy;


    // TODO: Parte 6
    // Crie um método 'setStrategy(IShippingStrategy strategy)' para permitir
    // que o cliente troque o algoritmo de cálculo em tempo de execução.
    
    // ... seu método setStrategy aqui ...


    public void setStrategy(IShippingStrategy strategy){

        this.shippingStrategy = strategy;

    }


    // TODO: Parte 7
    // Crie um método 'calculateShippingCost(Order order)'.
    // Este método não deve ter lógica de cálculo. A sua única responsabilidade
    // é delegar o cálculo para o objeto 'shippingStrategy' atual.
    // Não se esqueça de verificar se uma estratégia foi definida antes de a usar.
    
    // ... seu método calculateShippingCost aqui ...


    public double calculateShippingCost(Order order){
        return this.shippingStrategy.calculate(order);
    }

}