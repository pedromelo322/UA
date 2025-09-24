package Command;

// "Receiver" 1: Uma luz inteligente.
class Light {
    public void turnOn() { System.out.println("A luz está LIGADA."); }
    public void turnOff() { System.out.println("A luz está DESLIGADA."); }
}

// "Receiver" 2: Uma porta de garagem.
class GarageDoor {
    public void open() { System.out.println("A porta da garagem está ABERTA."); }
    public void close() { System.out.println("A porta da garagem está FECHADA."); }
}