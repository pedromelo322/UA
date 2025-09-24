package Proxy;

// O "Proxy". Atua como um substituto leve para o RealImage.

// TODO: Parte 1
// Faça com que esta classe implemente a interface IImage.
public class ImageProxy implements IImage{

    // TODO: Parte 2
    // Crie um atributo privado para guardar a instância do RealImage.
    // Inicialize-o como 'null'. Ele só será criado quando for necessário.
    private RealImage realImage;
    
    // TODO: Parte 3
    // Crie um atributo privado para guardar a informação necessária para criar
    // o RealImage mais tarde (neste caso, o nome do ficheiro).
    private String filename;

    
    // TODO: Parte 4
    // Crie um construtor que receba e guarde APENAS o nome do ficheiro.
    // IMPORTANTE: O construtor do Proxy NÃO deve criar o RealImage.
    // Deve ser uma operação rápida.

    // ... seu construtor aqui ...7
    public ImageProxy(String filename){

        this.filename = filename;

    }
    
    
    // TODO: Parte 5
    // Implemente o método 'display()' da interface IImage.
    // Esta é a lógica do "lazy loading":
    // 1. Verifique se a instância de 'realImage' é nula.
    // 2. Se for nula, crie a instância de 'RealImage' (usando o filename guardado)
    //    e guarde-a no atributo. Esta é a primeira e única vez que a imagem será carregada.
    // 3. Independentemente de ter sido criada agora ou já existir, chame o método
    //    'display()' do objeto 'realImage' para delegar o trabalho.
    @Override
    public void display() {
        // ... seu código de lazy loading aqui ...

        if (realImage == null){
            realImage = new RealImage(this.filename);
        }

        realImage.display();

    }
}