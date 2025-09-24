package Mediator;

// A interface "Mediator".
public interface IAirTrafficControl {
    
    // TODO: Parte 1
    // Defina os métodos que o mediador oferece aos "colegas" (aviões).
    // 1. Um método para um avião se registar na torre de controlo.
    //    Ex: void registerAircraft(Aircraft aircraft);
    // 2. Um método para um avião enviar uma mensagem (ex: pedido para aterrar).
    //    Este método deve receber a mensagem e uma referência ao avião que a enviou.
    //    Ex: void sendMessage(String message, Aircraft sender);
    
    // ... seus métodos aqui ...

    void registerAircraft(Aircraft aircraft);
    void sendMessage(String message, Aircraft sender);
}