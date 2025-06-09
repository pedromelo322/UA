package Creational.builder.Ex1;
import java.util.*;


enum priority{


    NORMAL, BAIXA, Alta

}


class Email{


    private String destinatario;
    private String assunto;
    private String remetente;
    private String corpo;
    private List<String> cc = new ArrayList<>();
    private List<String> cco = new ArrayList<>();
    private List<String> anexos = new ArrayList<>();
    private priority prioridade;

    public static class Builder{

        private String destinatario;
        private String assunto;
        private String remetente;
        private String corpo;
        private List<String> cc = new ArrayList<>();
        private List<String> cco = new ArrayList<>();
        private List<String> anexos = new ArrayList<>();
        private priority prioridade;



        public Builder(String destinatario, String assunto) { // Parâmetros obrigatórios no construtor do Builder
            this.destinatario = destinatario;
            this.assunto = assunto;
        }


        public Builder comRemetente(String rem){

            this.remetente = rem;

            return this;

        }

        public Builder comCorpo(String corpo){

            this.corpo = corpo;

            return this;

        }

        public Builder adicionarCc(String emailCc){

            this.cc.add(emailCc);

            return this;

        }
        
        
        
        public Builder adicionarCco(String emailCco){
            this.cco.add(emailCco);
            return this;
        }
        
        
        
        public Builder adicionarAnexo(String caminhoAnexo){

            this.anexos.add(caminhoAnexo);
            return this;

        }
        
        
        
        
        public Builder comPrioridade(priority prioridade){

            this.prioridade = prioridade;

            return this;

        }


        public Email build(){


            return new Email(this);

        }


    }

    private Email(Builder builder){
            
        this.destinatario = builder.destinatario;
        this.assunto = builder.assunto;
        this.remetente = builder.remetente;
        this.corpo = builder.corpo;
        this.cc = builder.cc;
        this.cco = builder.cco;
        this.anexos = builder.anexos;
        this.prioridade = builder.prioridade;


    }



    @Override
    public String toString() {
        return "Email{" +
                "destinatario='" + destinatario + '\'' +
                ", assunto='" + assunto + '\'' +
                ", remetente='" + remetente + '\'' +
                ", corpo='" + corpo + '\'' +
                ", cc=" + cc +
                ", cco=" + cco +
                ", anexos=" + anexos +
                ", prioridade=" + prioridade +
                '}';
    }


}


public class ClienteEmail {
    public static void main(String[] args) {
        // 1. Email simples apenas com destinatário e assunto
        Email emailSimples = new Email.Builder("destinatario@exemplo.com", "Reunião")
                .build();
        
        // 2. Email com destinatário, assunto, corpo e um destinatário em CC
        Email emailMedio = new Email.Builder("colega@empresa.com", "Relatório mensal")
                .comCorpo("Segue em anexo o relatório do mês de Maio.")
                .comRemetente("gerente@empresa.com")
                .adicionarCc("supervisor@empresa.com")
                .build();
        
        // 3. Email completo com todos os campos preenchidos
        Email emailCompleto = new Email.Builder("cliente@empresa.com", "Proposta comercial")
                .comRemetente("vendas@empresa.com")
                .comCorpo("Conforme conversamos, segue a proposta comercial detalhada.")
                .adicionarCc("gerente.vendas@empresa.com")
                .adicionarCc("financeiro@empresa.com")
                .adicionarCco("diretor@empresa.com")
                .adicionarCco("registro.vendas@empresa.com")
                .adicionarAnexo("/documentos/proposta.pdf")
                .adicionarAnexo("/documentos/termos.pdf")
                .comPrioridade(priority.Alta)
                .build();
                
        // Exibir os emails criados
        System.out.println("\n----- Email Simples -----");
        System.out.println(emailSimples);
        
        System.out.println("\n----- Email Médio -----");
        System.out.println(emailMedio);
        
        System.out.println("\n----- Email Completo -----");
        System.out.println(emailCompleto);
    }
}