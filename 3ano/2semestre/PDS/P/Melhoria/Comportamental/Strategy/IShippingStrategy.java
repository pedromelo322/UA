package Strategy;

// A interface "Strategy". Define o método que todos os algoritmos devem implementar.
public interface IShippingStrategy {
    
    // TODO: Parte 1
    // Defina o método para calcular o custo do envio.
    // Este método precisa de receber a encomenda (Order) como parâmetro
    // para poder usar os seus dados (como o peso) no cálculo.
    // Ex: double calculate(Order order);
    
    // ... seu método aqui ...

    public double calculate(Order order);
}