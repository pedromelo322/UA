package Creational.Singleton;

class GerenciadorDeTemaUI{


    private String temaAtual = "Claro";

    static  private GerenciadorDeTemaUI instance = null;


    static public synchronized GerenciadorDeTemaUI getInstance(){

        if (instance == null){

            instance = new GerenciadorDeTemaUI();

        }

        return instance;

    }



    public String getTemaAtual(){
        return temaAtual;
    }



    public void setTemaAtual(String novoTema){

        temaAtual = novoTema;
    }


}



class PainelConfiguracoes {
    private GerenciadorDeTemaUI gerenciadorTema;
    
    public PainelConfiguracoes() {
        // Obtém a única instância do GerenciadorDeTemaUI
        this.gerenciadorTema = GerenciadorDeTemaUI.getInstance();
    }
    
    public void selecionarTema(String tema) {
        gerenciadorTema.setTemaAtual(tema);
        System.out.println("Tema alterado pelo Painel de Configurações para: " + tema);
    }
    
    // Método para fins de verificação na AplicacaoPrincipal
    public GerenciadorDeTemaUI getGerenciadorTema() {
        return gerenciadorTema;
    }
}




class BarraDeFerramentas {
    private GerenciadorDeTemaUI gerenciadorTema;
    
    public BarraDeFerramentas() {
        // Obtém a única instância do GerenciadorDeTemaUI
        this.gerenciadorTema = GerenciadorDeTemaUI.getInstance();
    }
    
    public void exibirTemaNaBarra() {
        System.out.println("Barra de Ferramentas usando tema: [" + gerenciadorTema.getTemaAtual() + "]");
    }
    
    // Método para fins de verificação na AplicacaoPrincipal
    public GerenciadorDeTemaUI getGerenciadorTema() {
        return gerenciadorTema;
    }
}




public class AplicacaoPrincipal {
    public static void main(String[] args) {
        // Criar instâncias dos componentes da aplicação
        PainelConfiguracoes painel = new PainelConfiguracoes();
        BarraDeFerramentas barra = new BarraDeFerramentas();
        
        // Exibe o tema inicial
        System.out.println("Estado inicial:");
        barra.exibirTemaNaBarra();
        
        // Altera o tema para "Escuro" e verifica
        System.out.println("\nAlterando tema para 'Escuro':");
        painel.selecionarTema("Escuro");
        barra.exibirTemaNaBarra();
        
        // Altera o tema para "Azul" e verifica
        System.out.println("\nAlterando tema para 'Azul':");
        painel.selecionarTema("Azul");
        barra.exibirTemaNaBarra();
        
        // Verifica se as instâncias são as mesmas (característica essencial do Singleton)
        boolean mesmaInstancia = painel.getGerenciadorTema() == barra.getGerenciadorTema();
        System.out.println("\nVerificação de instância única:");
        System.out.println("O gerenciador do Painel e da Barra é a mesma instância? " + mesmaInstancia);
        
        if (mesmaInstancia) {
            System.out.println("Padrão Singleton implementado com sucesso!");
        } else {
            System.out.println("ERRO: O padrão Singleton não está funcionando corretamente!");
        }
    }
}