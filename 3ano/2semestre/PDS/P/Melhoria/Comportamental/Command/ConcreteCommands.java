package Command;

// TODO: Parte 2
// Crie a classe 'LightOnCommand' que implementa 'ICommand'.
// 1. Deve ter um atributo privado para guardar uma referência ao 'Receiver'
//    (neste caso, o objeto 'Light').
// 2. Crie um construtor que receba o objeto 'Light' e o guarde.
// 3. Implemente o método 'execute()'. A sua única responsabilidade é chamar
//    o método apropriado no 'Receiver' (ex: light.turnOn()).

// ... sua classe LightOnCommand aqui ...


class LightOnCommand implements ICommand{
    private Light light;

    public LightOnCommand(Light light){
        this.light = light;
    }

    public void execute(){
        light.turnOn();
    }

}


// TODO: Parte 3
// Faça o mesmo para as seguintes classes de comando:
// - LightOffCommand (que chama light.turnOff())
// - GarageDoorOpenCommand (que chama garageDoor.open())
// - GarageDoorCloseCommand (que chama garageDoor.close())

// ... suas outras classes de comando aqui ...

class LightOffCommand implements ICommand{
    private Light light;

    public LightOffCommand(Light light){
        this.light = light;
    }

    public void execute(){
        light.turnOff();
    }

}


class GarageDoorOpenCommand implements ICommand{
    private GarageDoor garageDoor;

    public GarageDoorOpenCommand(GarageDoor garageDoor){
        this.garageDoor = garageDoor;
    }

    public void execute(){
        garageDoor.open();
    }

}



class GarageDoorCloseCommand implements ICommand{
    private GarageDoor garageDoor;

    public GarageDoorCloseCommand(GarageDoor garageDoor){
        this.garageDoor = garageDoor;
    }

    public void execute(){
        garageDoor.close();
    }

}


