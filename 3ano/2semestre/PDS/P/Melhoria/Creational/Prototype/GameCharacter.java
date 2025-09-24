package Prototype;

// Esta classe deve ser o nosso "Prototype".
public abstract class GameCharacter {

    private String type;
    private int health;
    private int attack;
    // ... imagine outros atributos pesados como modelos 3D, texturas, etc.

    public GameCharacter(String type, int health, int attack) {
        // Simula o carregamento dispendioso de recursos
        System.out.println("A carregar recursos pesados para o protótipo: " + type);
        this.type = type;
        this.health = health;
        this.attack = attack;
    }

    protected GameCharacter(GameCharacter source) {
        this.type = source.type;
        this.health = source.health;
        this.attack = source.attack;
    }


    // TODO: Parte 1
    // Defina um método abstrato para a clonagem.
    // O nome convencional é 'clone()' ou 'copy()'. Este método deve
    // retornar um objeto do tipo GameCharacter.
    public abstract GameCharacter clone();

    // ... seu método abstrato aqui ...
    
    @Override
    public String toString() {
        // O hashCode() ajuda a verificar que os clones são objetos diferentes.
        return "GameCharacter [Tipo=" + type + ", Saúde=" + health + ", Ataque=" + attack + ", HashCode=" + this.hashCode() + "]";
    }
}
