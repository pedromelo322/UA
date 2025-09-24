package Command;

public class Main {
    public static void main(String[] args) {
        // 1. Criar os aparelhos (os receivers)
        Light livingRoomLight = new Light();
        GarageDoor garageDoor = new GarageDoor();

        // 2. Criar os objetos de comando, associando cada um a um receiver
        ICommand lightOn = new LightOnCommand(livingRoomLight);
        ICommand lightOff = new LightOffCommand(livingRoomLight);
        ICommand garageOpen = new GarageDoorOpenCommand(garageDoor);
        ICommand garageClose = new GarageDoorCloseCommand(garageDoor);
        
        // 3. Criar o controlo remoto (o invoker)
        RemoteControl remote = new RemoteControl();

        // 4. Programar e usar o controlo remoto
        System.out.println("--- A programar botão para ligar a luz ---");
        remote.setCommand(lightOn);
        remote.pressButton();

        System.out.println("\n--- A programar botão para abrir a garagem ---");
        remote.setCommand(garageOpen);
        remote.pressButton();

        System.out.println("\n--- A programar botão para fechar a garagem ---");
        remote.setCommand(garageClose);
        remote.pressButton();

        System.out.println("\n--- A programar botão para desligar a luz ---");
        remote.setCommand(lightOff);
        remote.pressButton();
    }
}