package Structural.Bridge;

// Abstração de alto nível para um botão
abstract class Botao {
    protected String rotulo;
    protected renderizarUI render;
    int x,y;

    public Botao(String rotulo, renderizarUI render, int x, int y) {
        this.rotulo = rotulo;
        this.render = render;
        this.x = x;
        this.y = y;
    }

    public void desenhar(){
        render.renderizarBotao(x, y, rotulo);
    }
    public void onClick() {
        System.out.println("Botão '" + rotulo + "' clicado!");
    }
}


class BotaoSimples extends Botao{

    public BotaoSimples(String rotulo, renderizarUI render, int x, int y){
        super(null, render, x, y);
    }

}


// Abstração de alto nível para uma janela
abstract class Janela {
    protected String titulo;
    protected renderizarUI render;
    int x,y,largura, altura;

    public Janela(String titulo, renderizarUI render, int x, int y, int altura, int largura) {
        this.titulo = titulo;
        this.x = x;
        this.y = y;
        this.largura = largura;
        this.altura = altura;
    }

    public void desenhar(){


        render.renderizarBotao(x, y, titulo);

    }

    public void fechar() {
        System.out.println("Janela '" + titulo + "' fechada.");
    }
}

class JanelaSimples extends Janela{

    public JanelaSimples(String titulo, renderizarUI render, int x, int y, int altura, int largura){
        super(titulo, render, x, y, altura, largura);
    }

}



// Interface para a API de renderização do Windows
interface WindowsAPI {
    void renderizarBotaoWindows(int x, int y, String texto);
    void renderizarJanelaWindows(int x, int y, int largura, int altura, String tituloJanela);
}

// Simulação da API do Windows
class WindowsRenderer implements WindowsAPI {
    @Override
    public void renderizarBotaoWindows(int x, int y, String texto) {
        System.out.println("WindowsAPI: Desenhando botão '" + texto + "' em (" + x + "," + y + ") com estilo Windows.");
    }
    @Override
    public void renderizarJanelaWindows(int x, int y, int largura, int altura, String tituloJanela) {
        System.out.println("WindowsAPI: Desenhando janela '" + tituloJanela + "' em (" + x + "," + y + ") com L=" + largura + ", A=" + altura + " com estilo Windows.");
    }
}

// Interface para a API de renderização do macOS
interface MacOSAPI {
    void desenharBotaoMacOS(String label, int posX, int posY);
    void desenharJanelaMacOS(String windowTitle, int posX, int posY, int width, int height);
}

// Simulação da API do macOS
class MacOSRenderer implements MacOSAPI {
    @Override
    public void desenharBotaoMacOS(String label, int posX, int posY) {
        System.out.println("MacOSAPI: Desenhando botão '" + label + "' em (" + posX + "," + posY + ") com estilo macOS.");
    }
    @Override
    public void desenharJanelaMacOS(String windowTitle, int posX, int posY, int width, int height) {
        System.out.println("MacOSAPI: Desenhando janela '" + windowTitle + "' em (" + posX + "," + posY + ") com L=" + width + ", A=" + height + " com estilo macOS.");
    }
}




interface renderizarUI{

    void renderizarBotao(int x, int y, String texto);
    void renderizarJanela(int x, int y, int largura, int altura, String tituloJanela);
}



class RenderizarWindows implements renderizarUI{



    private WindowsAPI api = new WindowsRenderer();

    @Override
    public void renderizarBotao(int x, int y, String texto) {
        
        api.renderizarBotaoWindows(x, y, texto);
    }

    @Override
    public void renderizarJanela(int x, int y, int largura, int altura, String tituloJanela) {
        
        api.renderizarJanelaWindows(x, y, largura, altura, tituloJanela);
        
    }

}



class RenderizarMac implements renderizarUI{


    private MacOSAPI api = new MacOSRenderer();

    @Override
    public void renderizarBotao(int x, int y, String texto) {
        
        api.desenharBotaoMacOS(texto, x, y);
    }

    @Override
    public void renderizarJanela(int x, int y, int largura, int altura, String tituloJanela) {
        
        api.desenharJanelaMacOS(tituloJanela, x, y, largura, altura);
        
    }



}