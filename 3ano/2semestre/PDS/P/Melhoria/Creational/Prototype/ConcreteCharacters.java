package Prototype;

// TODO: Parte 2
// Crie a classe 'Goblin' que herda de 'GameCharacter'.
// 1. Crie um construtor que chame o construtor da superclasse com valores base
//    para um Goblin (ex: "Goblin", 50, 5).
// 2. Implemente o método de clonagem. Este método deve criar e retornar uma nova
//    instância de Goblin, copiando os valores do protótipo atual.
//    (Dica: Pode criar um construtor de cópia para facilitar).

// ... sua classe Goblin aqui ...

class Goblin extends GameCharacter{
    public Goblin(){
        super("Goblin", 50, 5);
    }

    private Goblin(Goblin source){
        super(source);
    }

    public GameCharacter clone(){
        return new Goblin(this);
    }
}


// TODO: Parte 3 (Desafio extra)
// Faça o mesmo para uma classe 'Zombie'.
// Dê-lhe valores diferentes (ex: "Zombie", 100, 10).

// ... sua classe Zombie aqui ...
class Zombie extends GameCharacter{
    public Zombie(){
        super("Zombie", 100, 10);
    }

    private Zombie(Zombie source){
        super(source);
    }

    public GameCharacter clone(){
        return new Zombie(this);
    }
}