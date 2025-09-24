package FlyWeight;

// O "ConcreteFlyweight". Armazena o estado intrínseco (partilhado).

// TODO: Parte 2
// Crie a classe 'TreeType' que implementa a interface 'ITreeType'.
// 1. Deve ter atributos PRIVADOS e FINAIS para o estado intrínseco:
//    name (ex: "Carvalho"), model3D, barkTexture, leavesTexture.
// 2. Crie um construtor que inicialize todos estes atributos.
//    No construtor, imprima uma mensagem a indicar que os dados pesados
//    estão a ser carregados, para que possamos ver quando isto acontece.
// 3. Implemente o método 'draw'. Este método deve usar os seus dados intrínsecos
//    (name, model, etc.) e os dados extrínsecos recebidos (x, y, size) para
//    simular a renderização de uma árvore.
public class TreeType implements ITreeType {
    // ... seus atributos, construtor e método draw aqui ...

    private final String name;
    private final String model3D;
    private final String barkTexture;
    private final String leavesTexture;



    public TreeType(String name, String model, String bark, String leaves){
        this.name = name;
        this.model3D = model;
        this.barkTexture = bark;
        this.leavesTexture = leaves;

        System.out.println("A carregar dados pesados para o tipo de árvore: " + this.name);

    }

    @Override
    public void draw(int x, int y, int size){
        System.out.println("Simular renderização de " +this.name + "model: " + this.model3D  + "barkTexture:" + barkTexture + "leavesTexture" + this.leavesTexture +"na pos: (" + x + "," + y + ") size: "+size);
    }
}
