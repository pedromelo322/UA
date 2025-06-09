interface ElementoGrafico{

    void desenhar();

}



class CirculoRenderer implements ElementoGrafico{

    @Override
    public void desenhar(){
        System.out.println("Desenhando Círculo");
    }

}


class RetanguloRenderer implements ElementoGrafico{

    @Override
    public void desenhar(){
        System.out.println("Desenhando Retângulo");
    }

}



abstract class AplicacaoRenderizadora{


    abstract ElementoGrafico create();


    void renderizarElemento(){

        ElementoGrafico elemento = create();
        elemento.desenhar();

    };

}




class AplicacaoCirculo extends AplicacaoRenderizadora{

    @Override
    ElementoGrafico create(){
        return new CirculoRenderer();
    }

}



class AplicacaoRetangulo extends AplicacaoRenderizadora{

    @Override
    ElementoGrafico create(){
        return new RetanguloRenderer();
    }

}




public class Factoory{

    public static void main(String[] args) {
        AplicacaoRenderizadora circuloRenderizador = new AplicacaoCirculo();

        circuloRenderizador.renderizarElemento();



        AplicacaoRenderizadora retanguloRenderizador = new AplicacaoRetangulo();

        retanguloRenderizador.renderizarElemento();
    }


}