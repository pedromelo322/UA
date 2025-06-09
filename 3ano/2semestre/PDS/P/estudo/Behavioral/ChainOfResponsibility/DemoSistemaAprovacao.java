package Behavioral.ChainOfResponsibility;


// Exemplo da classe PedidoDespesa
class PedidoDespesa {
    private String descricao;
    private double valor;
    private boolean aprovado = false; // Para rastrear o status
    private String aprovadoPor = "Ninguém";

    public PedidoDespesa(String descricao, double valor) {
        this.descricao = descricao;
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public double getValor() {
        return valor;
    }

    public boolean isAprovado() {
        return aprovado;
    }

    public void setAprovado(boolean aprovado, String nomeAprovador) {
        this.aprovado = aprovado;
        this.aprovadoPor = nomeAprovador;
    }

    public String getAprovadoPor() {
        return aprovadoPor;
    }

    @Override
    public String toString() {
        return "PedidoDespesa{" +
               "descricao='" + descricao + '\'' +
               ", valor=" + valor +
               ", aprovado=" + aprovado +
               ", aprovadoPor='" + aprovadoPor + '\'' +
               '}';
    }
}






interface Handler{


    void setNext(Handler h);
    void handle(PedidoDespesa p);

}




class BaseHandler implements Handler{

    private Handler next;


    @Override
    public void handle(PedidoDespesa p){
        if (next != null){
            next.handle(p);
        }else{
            System.out.println("Ninguem pode lidar");
        }
    }


    @Override
    public void setNext(Handler h) {
        this.next = h;
        
    }



} 



class SupervisorImediato extends BaseHandler{


    String name;


    @Override
    public void handle(PedidoDespesa p) {
        if (p.getValor() <= 500.00){
            p.setAprovado(true, this.name);
        }else{
            super.handle(p);
        }
        
    }


    public SupervisorImediato(String name){
        this.name = name;
    }


}




class GerenteDepartamento extends BaseHandler{


    String name;


    @Override
    public void handle(PedidoDespesa p) {
        if (p.getValor() <= 2000.00){
            p.setAprovado(true, this.name);
        }else{
            super.handle(p);
        }
        
    }


    public GerenteDepartamento(String name){
        this.name = name;
    }


}




class DiretorFinanceiro extends BaseHandler{


    String name;


    @Override
    public void handle(PedidoDespesa p) {
        if (p.getValor() <= 10000.00){
            p.setAprovado(true, this.name);
        }else{
            super.handle(p);
        }
        
    }


    public DiretorFinanceiro(String name){
        this.name = name;
    }


}



class CEO extends BaseHandler{


    String name;


    @Override
    public void handle(PedidoDespesa p) {
        
        p.setAprovado(true, this.name);
        
        
    }


    public CEO(String name){
        this.name = name;
    }


}



// (Supondo que você criou a classe PedidoDespesa, a classe/interface Aprovador,
// e as classes concretas Supervisor, GerenteDepartamento, DiretorFinanceiro, CEO)

public class DemoSistemaAprovacao {

    public static void main(String[] args) {
        // 1. Criar os handlers (aprovadores)
        // Substitua pelos nomes das suas classes concretas de Aprovador
        Handler supervisor = new SupervisorImediato("Ana Supervisora");
        Handler gerente = new GerenteDepartamento("Carlos Gerente");
        Handler diretor = new DiretorFinanceiro("Beatriz Diretora");
        Handler ceo = new CEO("Roberto CEO");

        // 2. Configurar a cadeia de responsabilidade
        // supervisor -> gerente -> diretor -> ceo
        supervisor.setNext(gerente);
        gerente.setNext(diretor);
        diretor.setNext(ceo);
        // O CEO é o último, não precisa de um próximo (ou pode ter um handler de rejeição final)

        // 3. Criar alguns pedidos de despesa
        PedidoDespesa pedido1 = new PedidoDespesa("Material de escritório", 350.00);
        PedidoDespesa pedido2 = new PedidoDespesa("Viagem a conferência", 1800.00);
        PedidoDespesa pedido3 = new PedidoDespesa("Compra de novo servidor", 7500.00);
        PedidoDespesa pedido4 = new PedidoDespesa("Almoço com cliente importante", 450.00);
        PedidoDespesa pedido5 = new PedidoDespesa("Investimento em nova filial", 50000.00);
        PedidoDespesa pedido6 = new PedidoDespesa("Cafézinho", 50.00);


        System.out.println("--- Processando Pedidos ---");
        // 4. Enviar os pedidos para o início da cadeia (supervisor)
        System.out.println("Processando pedido 1 (" + pedido1.getValor() + "):");
        supervisor.handle(pedido1);
        System.out.println(pedido1);

        System.out.println("\nProcessando pedido 2 (" + pedido2.getValor() + "):");
        supervisor.handle(pedido2);
        System.out.println(pedido2);

        System.out.println("\nProcessando pedido 3 (" + pedido3.getValor() + "):");
        supervisor.handle(pedido3);
        System.out.println(pedido3);

        System.out.println("\nProcessando pedido 4 (" + pedido4.getValor() + "):");
        supervisor.handle(pedido4);
        System.out.println(pedido4);

        System.out.println("\nProcessando pedido 5 (" + pedido5.getValor() + "):");
        supervisor.handle(pedido5);
        System.out.println(pedido5);
        
        System.out.println("\nProcessando pedido 6 (" + pedido6.getValor() + "):");
        supervisor.handle(pedido6);
        System.out.println(pedido6);

        // Opcional: Testar um pedido que pode ser rejeitado se o CEO tiver um limite ou lógica de rejeição
        // PedidoDespesa pedidoMuitoAlto = new PedidoDespesa("Compra de um jato particular", 100000000.00);
        // System.out.println("\nProcessando pedido muito alto (" + pedidoMuitoAlto.getValor() + "):");
        // supervisor.processarPedido(pedidoMuitoAlto);
        // System.out.println(pedidoMuitoAlto);
    }
}