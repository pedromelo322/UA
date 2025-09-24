package Mediator;

// Uma implementação concreta de "Colleague".
public class CommercialAircraft extends Aircraft {

    public CommercialAircraft(IAirTrafficControl atc, String callSign) {
        super(atc, callSign);
    }

    @Override
    public void send(String message) {
        System.out.println(this.getCallSign() + " a enviar mensagem: '" + message + "'");
        // O avião não fala com outros aviões, fala com o mediador.
        this.atc.sendMessage(message, this);
    }

    @Override
    public void receive(String message) {
        System.out.println(this.getCallSign() + " recebeu a mensagem: '" + message + "'");
    }
}