public class Monster { /* ... */ }
public class Dungeon {
    private List<Monster> monsters;
    public void addMonster(Monster m) {  }
    // ...
    // Método principal que cria e adiciona monstros
    public void spawnMonster() {
        Monster newMonster = new Monster();
        this.monsters.add(newMonster);
    }
}

public class GameLevel {
    private Dungeon mainDungeon;

    public void spawnMonsters(int quantity){
        for (int i = 0; i < quantity; i++) {
            mainDungeon.spawnMonster();
        }
    }
    
}


/*
 *A responsabilidade de criar Monster foi atribuída à classe Dungeon, 
 *que é o Creator natural, pois agrega e gere a coleção de monstros. 
 *Isto melhora a coesão da Dungeon e reduz as responsabilidades da GameLevel, 
 *que agora apenas coordena a ação de "spawnar", sem precisar de saber como um monstro é criado.
 */


 //Eu acho que não se passa o for também 
 //porque a quantidade de monstos está associado ao nivel do Jogo