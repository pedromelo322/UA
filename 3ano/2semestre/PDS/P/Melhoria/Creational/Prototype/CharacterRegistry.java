package Prototype;

import java.util.HashMap;
import java.util.Map;

// Esta classe funciona como uma fábrica que usa protótipos.
public class CharacterRegistry {
    private Map<String, GameCharacter> prototypes = new HashMap<>();

    public void addPrototype(String key, GameCharacter prototype) {
        prototypes.put(key, prototype);
    }

    public GameCharacter createCharacter(String key) {
        GameCharacter prototype = prototypes.get(key);
        if (prototype != null) {
            // Usa o método de clonagem para criar uma nova instância
            return prototype.clone();
        }
        throw new IllegalArgumentException("Protótipo '" + key + "' não existe.");
    }
}
