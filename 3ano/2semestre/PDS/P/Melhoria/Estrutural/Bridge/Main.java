package Bridge;

public class Main {
    public static void main(String[] args) {
        // Criar as implementações dos canais de envio
        IMessageSender emailSender = new EmailSender();
        IMessageSender smsSender = new SmsSender();

        // --- Combinações ---

        // 1. Enviar uma notificação urgente por email
        System.out.println("A enviar notificação urgente por email...");
        Notification urgentEmail = new UrgentNotification(emailSender);
        urgentEmail.send("O Servidor está em baixo!", "O servidor principal caiu. Ação imediata necessária.");
        
        // 2. Enviar uma notificação informativa por SMS
        System.out.println("A enviar notificação informativa por SMS...");
        Notification informativeSms = new InformativeNotification(smsSender);
        informativeSms.send("Manutenção Agendada", "Haverá uma paragem de 5 minutos às 2h da manhã.");

        // 3. Enviar a MESMA notificação urgente, mas agora por SMS, trocando a implementação
        System.out.println("A enviar a mesma notificação urgente, mas por SMS...");
        Notification urgentSms = new UrgentNotification(smsSender);
        urgentSms.send("O Servidor está em baixo!", "O servidor principal caiu.");
    }
}