package Bridge;

// Implementação concreta para envio por Email.
class EmailSender implements IMessageSender {
    @Override
    public void sendMessage(String subject, String body) {
        System.out.println("--- A enviar por Email ---");
        System.out.println("Assunto: " + subject);
        System.out.println("Corpo: " + body);
        System.out.println("------------------------\n");
    }
}

// Implementação concreta para envio por SMS.
class SmsSender implements IMessageSender {
    @Override
    public void sendMessage(String subject, String body) {
        System.out.println("--- A enviar por SMS ---");
        // SMS não tem assunto, por isso combinamos tudo
        System.out.println("Mensagem: " + subject + " - " + body);
        System.out.println("----------------------\n");
    }
}