package Structural.Decorator;



interface FormatadorTexto{
    String getConteudoFormatado();
}


// Exemplo de como poderia ser a classe TextoSimples (ConcreteComponent)
// Ela precisará implementar a interface Component que você vai criar.
class TextoSimples implements FormatadorTexto /* implements FormatadorTexto */ {
    private String texto;

    public TextoSimples(String texto) {
        this.texto = texto;
    }

    @Override
    public String getConteudoFormatado() {
        return texto;
    }
}



abstract class TextoDecorator implements FormatadorTexto {
    protected FormatadorTexto t;
    public TextoDecorator(FormatadorTexto t) { 
        this.t = t; 
    }


    @Override
    public String getConteudoFormatado() {
        return t.getConteudoFormatado(); 
    }
}




class Negrito extends TextoDecorator {
    Negrito(FormatadorTexto t) { super(t); }
    
    @Override 
    public String getConteudoFormatado(){ 

        String texto = "**";

        texto =  texto + t.getConteudoFormatado();

        texto = texto + "**";

        return texto;

    }

}




class Italico extends TextoDecorator {
    Italico(FormatadorTexto t) { super(t); }
    
    @Override 
    public String getConteudoFormatado(){ 

        String texto = "*";

        texto =  texto + t.getConteudoFormatado();

        texto = texto + "*";

        return texto;

    }

}


class Sublinhado extends TextoDecorator {
    Sublinhado(FormatadorTexto t) { super(t); }
    
    @Override 
    public String getConteudoFormatado(){ 

        String texto = "_";

        texto =  texto + t.getConteudoFormatado();

        texto = texto + "_";

        return texto;

    }

}


class CorFonte extends TextoDecorator {
    private String cor;
    CorFonte(FormatadorTexto t, String cor) { super(t); this.cor = cor;}
    
    @Override 
    public String getConteudoFormatado(){ 

        String texto = "[cor: " +this.cor+"]";

        texto =  texto + t.getConteudoFormatado();

        texto = texto + "[/cor]";

        return texto;

    }

}



// (Supondo que você criou a interface FormatadorTexto, a classe TextoSimples,
// a classe abstrata DecoradorDeFormato, e os ConcreteDecorators:
// NegritoDecorador, ItalicoDecorador, SublinhadoDecorador, CorFonteDecorador)

public class DemoEditorTexto {

    public static void main(String[] args) {
        // 1. Começa com um texto simples (ConcreteComponent)
        FormatadorTexto meuTexto = new TextoSimples("Olá Mundo do Design Patterns!");

        System.out.println("Original: " + meuTexto.getConteudoFormatado());

        // 2. Decorando com Negrito
        meuTexto = new Negrito(meuTexto);
        System.out.println("Com Negrito: " + meuTexto.getConteudoFormatado());

        // 3. Decorando com Itálico (sobre o texto já em negrito)
        meuTexto = new Italico(meuTexto);
        System.out.println("Com Negrito e Itálico: " + meuTexto.getConteudoFormatado());

        // 4. Decorando com Cor da Fonte (sobre o texto já em negrito e itálico)
        // Suponha que CorFonteDecorador receba a cor no construtor
        meuTexto = new CorFonte(meuTexto, "azul");
        System.out.println("Com Negrito, Itálico e Cor Azul: " + meuTexto.getConteudoFormatado());

        // 5. Outra combinação: Texto simples, depois Sublinhado, depois Cor
        FormatadorTexto outroTexto = new TextoSimples("Este é um teste de decorador.");
        outroTexto = new Sublinhado(outroTexto);
        outroTexto = new CorFonte(outroTexto, "vermelho");
        System.out.println("\nOutro Texto: " + outroTexto.getConteudoFormatado());

        // 6. Apenas Itálico e Cor
        FormatadorTexto textoFinal = new TextoSimples("Apenas itálico e cor.");
        textoFinal = new Italico(textoFinal);
        textoFinal = new CorFonte(textoFinal, "verde");
        System.out.println("Texto Final: " + textoFinal.getConteudoFormatado());


        // Verificando a composição (apenas para fins de exemplo,
        // o resultado da formatação já demonstra isso)
        // Se meuTexto = new CorFonteDecorador(new ItalicoDecorador(new NegritoDecorador(new TextoSimples(...))))
        // Então meuTexto.getConteudoFormatado() irá chamar CorFonteDecorador, que chama ItalicoDecorador,
        // que chama NegritoDecorador, que chama TextoSimples.
    }
}