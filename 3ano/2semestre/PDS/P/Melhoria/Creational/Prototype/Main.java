package Prototype;

public class Main {
    public static void main(String[] args) {
        CharacterRegistry registry = new CharacterRegistry();

        // 1. Carregar os protótipos uma única vez (operação dispendiosa)
        System.out.println("--- A carregar protótipos para o nível ---");
        registry.addPrototype("GOBLIN", new Goblin());
        registry.addPrototype("ZOMBIE", new Zombie());

        System.out.println("\n--- A criar exército de inimigos usando clonagem ---");
        
        // 2. Criar vários inimigos a partir dos protótipos (operação rápida)
        GameCharacter goblin1 = registry.createCharacter("GOBLIN");
        GameCharacter goblin2 = registry.createCharacter("GOBLIN");
        GameCharacter zombie1 = registry.createCharacter("ZOMBIE");

        System.out.println("\n--- Exército criado ---");
        System.out.println("Goblin 1: " + goblin1);
        System.out.println("Goblin 2: " + goblin2);
        System.out.println("Zombie 1: " + zombie1);

        System.out.println("\n--- Verificação ---");
        if (goblin1 != goblin2) {
            System.out.println("Sucesso: Goblin 1 e Goblin 2 são instâncias diferentes.");
        } else {
            System.out.println("Erro: Os goblins são a mesma instância.");
        }
    }
}