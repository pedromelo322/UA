package Mediator;

// A classe base "Colleague".
public abstract class Aircraft {
    
    // TODO: Parte 2
    // Crie os atributos que cada avião terá:
    // 1. Uma referência à torre de controlo (o mediador). Ex: protected IAirTrafficControl atc;
    // 2. O seu próprio nome ou identificador. Ex: protected String callSign;
    
    // ... seus atributos aqui ...

    protected IAirTrafficControl atc;
    protected String callSign;

    // TODO: Parte 3
    // Crie um construtor que receba o mediador e o seu identificador.
    // Dentro do construtor, o avião deve registar-se imediatamente no mediador.
    
    // ... seu construtor aqui ...

    public Aircraft(IAirTrafficControl atc, String callSign){

        this.atc = atc;
        this.atc.registerAircraft(this);
        this.callSign = callSign;
        

    }
    
    
    // Métodos para enviar e receber mensagens.
    public abstract void send(String message);
    public abstract void receive(String message);

    public String getCallSign() {
        return callSign;
    }
}