package Command;

// O "Invoker". Guarda um comando e invoca-o quando solicitado.
public class RemoteControl {
    private ICommand command;

    // Configura o comando que o botão vai executar.
    public void setCommand(ICommand command) {
        this.command = command;
    }

    // Simula o premir de um botão.
    public void pressButton() {
        System.out.println("Controlo remoto: botão premido.");
        if (command != null) {
            command.execute(); // Executa o comando configurado.
        }
    }
}