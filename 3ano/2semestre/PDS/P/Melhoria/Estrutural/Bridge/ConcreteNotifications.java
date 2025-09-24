package Bridge;

// TODO: Parte 5
// Crie a classe 'UrgentNotification' que herda de 'Notification'.
// Implemente o método 'send'. A sua lógica deve adicionar um prefixo "URGENTE:"
// ao assunto e depois usar o objeto 'sender' (da classe base) para enviar a mensagem.

// ... sua classe UrgentNotification aqui ...

class UrgentNotification extends Notification{

    public UrgentNotification(IMessageSender sender){
        super(sender);
    }

    @Override
    public void send(String subject, String message) {
        super.send("URGENTE: " + subject, message);
    }
}


// TODO: Parte 6 (Desafio extra)
// Crie a classe 'InformativeNotification' que herda de 'Notification'.
// A sua lógica deve adicionar o prefixo "INFO:" ao assunto antes de enviar.

// ... sua classe InformativeNotification aqui ...




class InformativeNotification extends Notification{

    public InformativeNotification(IMessageSender sender){
        super(sender);
    }

    @Override
    public void send(String subject, String message) {
        super.send("INFO: " + subject, message);
    }
}