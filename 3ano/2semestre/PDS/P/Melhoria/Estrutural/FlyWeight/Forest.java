package FlyWeight;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Forest {
    private List<Tree> trees = new ArrayList<>();
    private static final int NUMBER_OF_TREES = 1_000_000;

    public void plantTree(int x, int y, int size, String name, String model, String bark, String leaves) {
        TreeType type = TreeFactory.getTreeType(name, model, bark, leaves);
        Tree tree = new Tree(x, y, size, type);
        trees.add(tree);
    }
    
    public void draw() {
        System.out.println("\n--- A desenhar a floresta ---");
        trees.forEach(Tree::draw);
    }
    
    public static void main(String[] args) {
        Forest forest = new Forest();
        Random random = new Random();

        System.out.println("--- A plantar " + NUMBER_OF_TREES + " árvores ---");

        // Plantar milhões de árvores, mas apenas de 2 tipos diferentes
        for (int i = 0; i < NUMBER_OF_TREES / 2; i++) {
            forest.plantTree(random.nextInt(1000), random.nextInt(1000), random.nextInt(50), 
                             "Carvalho", "carvalho.model", "casca_carvalho.tex", "folha_carvalho.tex");
        }
        for (int i = 0; i < NUMBER_OF_TREES / 2; i++) {
            forest.plantTree(random.nextInt(1000), random.nextInt(1000), random.nextInt(50), 
                             "Pinheiro", "pinheiro.model", "casca_pinheiro.tex", "folha_pinheiro.tex");
        }

        System.out.println("\n--- Árvores plantadas. A memória está estável. ---");
        // Se quiséssemos desenhar, chamaríamos forest.draw()
    }
}