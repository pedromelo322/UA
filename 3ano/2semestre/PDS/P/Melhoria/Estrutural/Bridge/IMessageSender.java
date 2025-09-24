package Bridge;

// A interface "Implementor". Define a operação de baixo nível (enviar uma mensagem).
public interface IMessageSender {
    // TODO: Parte 1
    // Defina o método que todos os canais de envio devem ter.
    // Exemplo: void sendMessage(String subject, String body);
    
    // ... seu método aqui ...
    public void sendMessage(String subject, String body);
}