package Behavioral.Command;

// Exemplo da classe LuzInteligente
class LuzInteligente {
    private String localizacao;
    private boolean estaLigada = false;

    public LuzInteligente(String localizacao) {
        this.localizacao = localizacao;
    }

    public void ligar() {
        this.estaLigada = true;
        System.out.println("Luz da " + localizacao + " LIGADA.");
    }

    public void desligar() {
        this.estaLigada = false;
        System.out.println("Luz da " + localizacao + " DESLIGADA.");
    }

    public boolean isLigada() {
        return estaLigada;
    }
}



// Exemplo da classe VentiladorDeTeto
class VentiladorDeTeto {
    private String comodo;
    public static final int DESLIGADO = 0;
    public static final int BAIXA = 1;
    public static final int MEDIA = 2;
    public static final int ALTA = 3;
    private int velocidade = DESLIGADO;

    public VentiladorDeTeto(String comodo) {
        this.comodo = comodo;
    }

    public void ligar() { // Liga na velocidade BAIXA por padrão
        setVelocidade(BAIXA);
        System.out.println("Ventilador do(a) " + comodo + " LIGADO na velocidade BAIXA.");
    }

    public void desligar() {
        setVelocidade(DESLIGADO);
        System.out.println("Ventilador do(a) " + comodo + " DESLIGADO.");
    }

    public void aumentarVelocidade() {
        if (velocidade < ALTA) {
            velocidade++;
        }
        System.out.println("Ventilador do(a) " + comodo + " velocidade aumentada para " + getNomeVelocidade());
    }

    public void diminuirVelocidade() {
        if (velocidade > DESLIGADO) { // Não pode diminuir se já estiver desligado
            velocidade--;
             if(velocidade == DESLIGADO){
                System.out.println("Ventilador do(a) " + comodo + " DESLIGADO.");
             } else {
                System.out.println("Ventilador do(a) " + comodo + " velocidade diminuída para " + getNomeVelocidade());
             }
        }
    }
    
    public void setVelocidade(int novaVelocidade) {
        if (novaVelocidade >= DESLIGADO && novaVelocidade <= ALTA) {
            this.velocidade = novaVelocidade;
        }
    }

    public int getVelocidade() {
        return velocidade;
    }

    public String getNomeVelocidade() {
        switch (velocidade) {
            case DESLIGADO: return "DESLIGADO";
            case BAIXA: return "BAIXA";
            case MEDIA: return "MEDIA";
            case ALTA: return "ALTA";
            default: return "DESCONHECIDA";
        }
    }
}


class ControleRemotoSimples{

    private Comando commandA;
    private Comando commandB;




    public void setComandoBotaoA(Comando command){

        this.commandA = command;

    }


    public void setComandoBotaoB(Comando command){

        this.commandB = command;
        
    }


    public void pressionarBotaoA(){

        commandA.execute();

    }

    public void pressionarBotaoB(){

        commandB.execute();

    }


}




interface Comando{

    void execute();


}



class ComandoLigarLuz implements Comando{


    private LuzInteligente luz;

    @Override
    public void execute() {
        luz.ligar();
        
    }


    public ComandoLigarLuz(LuzInteligente luz){

        this.luz = luz;

    }

} 

class ComandoDesligarLuz implements Comando{

    private LuzInteligente luz;

    @Override
    public void execute() {
        luz.desligar();        
    }


    public ComandoDesligarLuz(LuzInteligente luz){


        this.luz = luz;

    }

} 

class ComandoLigarVentilador implements Comando{

    private VentiladorDeTeto ventilador;


    @Override
    public void execute() {

        ventilador.ligar();
        
    }


    public ComandoLigarVentilador(VentiladorDeTeto ventilador){


        this.ventilador = ventilador;

    }

} 

class ComandoDesligarVentilador implements Comando{

    private VentiladorDeTeto ventilador;


    @Override
    public void execute() {
        
        ventilador.desligar();
        
    }


    public ComandoDesligarVentilador(VentiladorDeTeto ventilador){


        this.ventilador = ventilador;

    }

} 

class ComandoAumentarVelocidadeVentilador implements Comando{

    private VentiladorDeTeto ventilador;

    @Override
    public void execute() {
        ventilador.aumentarVelocidade();
        
    }


    public ComandoAumentarVelocidadeVentilador(VentiladorDeTeto ventilador){

        this.ventilador = ventilador;

    }

}  

class ComandoDiminuirVelocidadeVentilador implements Comando{

    private VentiladorDeTeto ventilador;

    @Override
    public void execute() {
        ventilador.diminuirVelocidade();
        
    }

    public ComandoDiminuirVelocidadeVentilador(VentiladorDeTeto ventilador){

        this.ventilador = ventilador;

    }

} 





// (Supondo que você criou as classes LuzInteligente, VentiladorDeTeto,
// a interface Comando, as classes de Comando Concretas,
// e a classe ControleRemotoSimples)

public class DemoControleRemoto {

    public static void main(String[] args) {
        // 1. Criar os Receivers (dispositivos)
        LuzInteligente luzDaSala = new LuzInteligente("Sala de Estar");
        VentiladorDeTeto ventiladorDoQuarto = new VentiladorDeTeto("Quarto");

        // 2. Criar o Invoker (Controle Remoto)
        // Suponha que ControleRemotoSimples tenha pelo menos um slot.
        // Exemplo: ControleRemotoSimples controle = new ControleRemotoSimples(2); // 2 slots
        ControleRemotoSimples controle = new ControleRemotoSimples(); // Ou com slots nomeados

        // 3. Criar os Comandos Concretos, associando-os aos receivers
        Comando ligarLuzSalaCmd = new ComandoLigarLuz(luzDaSala);
        Comando desligarLuzSalaCmd = new ComandoDesligarLuz(luzDaSala);

        Comando ligarVentiladorQuartoCmd = new ComandoLigarVentilador(ventiladorDoQuarto);
        //Comando desligarVentiladorQuartoCmd = new ComandoDesligarVentilador(ventiladorDoQuarto);
        Comando aumentarVelocidadeVentiladorCmd = new ComandoAumentarVelocidadeVentilador(ventiladorDoQuarto);
        //Comando diminuirVelocidadeVentiladorCmd = new ComandoDiminuirVelocidadeVentilador(ventiladorDoQuarto);

        System.out.println("--- Configurando e Testando Controle Remoto ---");

        // 4. Configurar os botões do controle com os comandos
        // Exemplo se tiver slots numerados:
        //.setComando(0, ligarLuzSalaCmd, desligarLuzSalaCmd); // Slot 0 para ligar/desligar luz da sala
        //controle.setComando(1, ligarVentiladorQuartoCmd, desligarVentiladorQuartoCmd);

        // Exemplo com slots nomeados (conforme desafio)
        controle.setComandoBotaoA(ligarLuzSalaCmd);
        controle.setComandoBotaoB(ligarVentiladorQuartoCmd);

        System.out.println("Pressionando Botão A (Ligar Luz Sala):");
        controle.pressionarBotaoA();
        System.out.println("Pressionando Botão B (Ligar Ventilador Quarto):");
        controle.pressionarBotaoB();

        System.out.println("\nReconfigurando Botão A para Desligar Luz e Botão B para Aumentar Velocidade:");
        controle.setComandoBotaoA(desligarLuzSalaCmd);
        controle.setComandoBotaoB(aumentarVelocidadeVentiladorCmd);

        System.out.println("Pressionando Botão A (Desligar Luz Sala):");
        controle.pressionarBotaoA();
        System.out.println("Pressionando Botão B (Aumentar Velocidade Ventilador):");
        controle.pressionarBotaoB();
        System.out.println("Pressionando Botão B novamente (Aumentar Velocidade Ventilador):");
        controle.pressionarBotaoB(); // Aumenta mais uma vez

        // Teste do Desafio Adicional (Undo)
        // if (controle tem método undo) {
        //     System.out.println("\n--- Testando Desfazer ---");
        //     System.out.println("Pressionando Desfazer (deve diminuir velocidade do ventilador):");
        //     controle.pressionarBotaoDesfazer();
        //     System.out.println("Pressionando Desfazer novamente (deve diminuir mais ou desligar):");
        //     controle.pressionarBotaoDesfazer();
        //     System.out.println("Pressionando Desfazer (deve ligar a luz da sala):");
        //     controle.pressionarBotaoDesfazer();
        // }
    }
}