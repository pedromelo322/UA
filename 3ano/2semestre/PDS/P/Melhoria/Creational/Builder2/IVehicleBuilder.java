package Builder2;

// A interface "Builder". Define os passos de construção.
public interface IVehicleBuilder {

    // TODO: Parte 1
    // Defina os métodos para cada passo da construção.
    // Pense em: construir chassi, motor, rodas e pintar.
    // Lembre-se, estes métodos devem retornar 'void'.
    
    // ... seus métodos abstratos aqui ...
    public void buildChassi();

    public void buildMotor();

    public void buildRodas();

    public void buildPintar();

    // TODO: Parte 2
    // Defina um método para obter o produto final construído.
    // Exemplo: Vehicle getResult();
    
    // ... seu método aqui ...
    public Vehicle getResult();
}