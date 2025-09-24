package Observer;

// A interface "Observer". Define o método que o Subject chamará para notificar.
public interface IInvestor {
    
    // TODO: Parte 1
    // Defina o método que será chamado quando o estado do Subject mudar.
    // O nome convencional é 'update'. Este método deve receber a nova informação
    // como parâmetro. Neste caso, o novo preço da ação.
    // Ex: void update(String stockSymbol, double newPrice);

    // ... seu método aqui ...



    public void update(String stockSymbol, double newPrice);
}