public interface Elemento{
    void render();
}

public class Paragraph implements Elemento{
    @Override void render(){
        System.out.println("A desenhar parágrafo...");
    };
}
public class Image implements Elemento{ 
    @Override void render(){
        System.out.println("A desenhar imagem...");
    }
}
public class Table implements Elemento{ 
    @Override void render(){
        System.out.println("A desenhar tabela...");
    }
}

public class DocumentRenderer {
    public void render(List<Elemento> elements) {
        for (Elemento element : elements) {
            element.render();
        }
    }
}

/*A solução usa Polymorphism para delegar a responsabilidade de desenhar a cada elemento individual.
 A classe DocumentRenderer agora depende de uma abstração (IDocumentElement), ficando protegida contra 
 as variações de novos tipos de elementos (Protected Variations).
  O sistema torna-se extensível: para adicionar um novo elemento, 
  basta criar uma nova classe que implemente a interface, sem modificar o DocumentRenderer. */