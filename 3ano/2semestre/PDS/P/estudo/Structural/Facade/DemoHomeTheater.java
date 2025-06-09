package Structural.Facade;

// --- Classes do Subsistema ---
class Amplificador {
    public void ligar() { System.out.println("Amplificador ligado"); }
    public void desligar() { System.out.println("Amplificador desligado"); }
    public void setVolume(int nivel) { System.out.println("Amplificador: Volume ajustado para " + nivel); }
    public void setModoSurround(boolean ativo) { System.out.println("Amplificador: Modo Surround " + (ativo ? "ativado" : "desativado")); }
}

class Projetor {
    public void ligar() { System.out.println("Projetor ligado"); }
    public void desligar() { System.out.println("Projetor desligado"); }
    public void modoWideScreen() { System.out.println("Projetor: Modo Widescreen ativado"); }
    public void modoNormalScreen() { System.out.println("Projetor: Modo Normal ativado"); }
}

class PlayerBluRay {
    private String filme;
    public void ligar() { System.out.println("Player Blu-ray ligado"); }
    public void desligar() { System.out.println("Player Blu-ray desligado"); }
    public void carregarFilme(String filme) { this.filme = filme; System.out.println("Player Blu-ray: Carregando filme '" + filme + "'"); }
    public void reproduzir() { System.out.println("Player Blu-ray: Reproduzindo '" + (filme != null ? filme : "nenhum filme") + "'"); }
    public void pausar() { System.out.println("Player Blu-ray: Filme pausado"); }
    public void parar() { System.out.println("Player Blu-ray: Filme parado"); }
}

class LuzesAmbiente {
    public void ligar() { System.out.println("Luzes ambiente acesas"); }
    public void desligar() { System.out.println("Luzes ambiente apagadas"); }
    public void setIntensidade(int nivel) { // Nível de 0 a 10
        System.out.println("Luzes ambiente: Intensidade ajustada para " + nivel);
    }
}

class MaquinaDePipoca {
    public void ligar() { System.out.println("Máquina de pipoca ligada"); }
    public void desligar() { System.out.println("Máquina de pipoca desligada"); }
    public void prepararPipoca() { System.out.println("Máquina de pipoca: Preparando pipoca..."); }
    public void ejetarPipoca() { System.out.println("Máquina de pipoca: Pipoca pronta!"); }
}



class HomeTheaterFacade{

    private Amplificador amplificador = new Amplificador();
    private Projetor projetor = new Projetor();
    private PlayerBluRay playerBluRay = new PlayerBluRay();
    private LuzesAmbiente luzesAmbiente = new LuzesAmbiente();
    private MaquinaDePipoca maquinaDePipoca = new MaquinaDePipoca();


    public void assistirFilme(String nomeDoFilme){
        maquinaDePipoca.ligar();
        luzesAmbiente.setIntensidade(2);
        projetor.ligar();
        projetor.modoWideScreen();
        amplificador.ligar();
        amplificador.setModoSurround(true);
        amplificador.setVolume(7);
        playerBluRay.ligar();
        playerBluRay.carregarFilme(nomeDoFilme);
        playerBluRay.reproduzir();
        maquinaDePipoca.ejetarPipoca();
    }


    public void pararFilme() {
        playerBluRay.parar();
        playerBluRay.desligar();
        amplificador.desligar();
        projetor.desligar();
        luzesAmbiente.setIntensidade(8);
        maquinaDePipoca.desligar();
    }


    public HomeTheaterFacade(Amplificador amplificador, Projetor projetor, PlayerBluRay playerBluRay, LuzesAmbiente luzesAmbiente, MaquinaDePipoca maquinaDePipoca){
        this.amplificador = amplificador;
        this.projetor = projetor;
        this.playerBluRay = playerBluRay;
        this.luzesAmbiente = luzesAmbiente;
        this.maquinaDePipoca = maquinaDePipoca;
    }




}



// (Supondo que você criou as classes do subsistema: Amplificador, Projetor, etc.
// e a sua classe HomeTheaterFacade)

public class DemoHomeTheater {

    public static void main(String[] args) {
        // Inicializar todos os componentes do subsistema que a Façade vai usar
        Amplificador amp = new Amplificador();
        Projetor projetor = new Projetor();
        PlayerBluRay player = new PlayerBluRay();
        LuzesAmbiente luzes = new LuzesAmbiente();
        MaquinaDePipoca pipoqueira = new MaquinaDePipoca();

        // Criar a Façade, passando os componentes do subsistema para ela
        // (ou a Façade pode instanciá-los internamente, mas passá-los é mais flexível)
        HomeTheaterFacade homeTheater = new HomeTheaterFacade(amp, projetor, player, luzes, pipoqueira);

        System.out.println("=== PREPARANDO PARA ASSISTIR FILME ===");
        // O cliente só precisa chamar um método simples na Façade
        homeTheater.assistirFilme("Matrix Revolutions");

        System.out.println("\n=== FILME TERMINADO, DESLIGANDO TUDO ===");
        // O cliente só precisa chamar outro método simples na Façade
        homeTheater.pararFilme();

        // Opcional: Mostrar que os clientes avançados ainda podem acessar os componentes
        // System.out.println("\n--- Controle manual (se necessário) ---");
        // amp.ligar();
        // amp.setVolume(5);
        // amp.desligar();
    }
}