package Bridge;

// A "Abstraction" base. Contém uma referência ao Implementor (a ponte).
public abstract class Notification {

    // TODO: Parte 2
    // Crie um atributo protegido para guardar a referência ao IMessageSender.
    // Esta é a "ponte" que liga a Abstração à Implementação.
    
    // ... seu atributo aqui ...
    protected IMessageSender sender;
    

    // TODO: Parte 3
    // Crie um construtor que recebe um IMessageSender e o guarda no atributo.
    
    // ... seu construtor aqui ...
    public Notification(IMessageSender sender){
        this.sender = sender;
    }


    // TODO: Parte 4
    // Crie um método abstrato 'send' que as subclasses deverão implementar
    // para definir a sua lógica específica.
    
    // ... seu método abstrato aqui ...
    public void send(String subject, String message){
        sender.sendMessage(subject, message);
    }
}