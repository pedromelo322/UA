package Structural.Composite;
import java.util.*;

interface Entity {

    abstract String getNome();
    abstract void exibirDetalhes(String indentacao);
    abstract double getCustoTotalSalarios();

}

// Exemplo de como poderia ser a classe Funcionario
class Funcionario implements Entity{ // Esta será uma "Folha" (Leaf) na sua estrutura Composite
    private String nome;
    private String cargo;
    private double salario;

    public Funcionario(String nome, String cargo, double salario) {
        this.nome = nome;
        this.cargo = cargo;
        this.salario = salario;
    }

    @Override
    public String getNome() {
        return nome;
    }

    public String getCargo() {
        return cargo;
    }

    public double getSalario() {
        return salario;
    }

    @Override
    public double getCustoTotalSalarios(){
        return getSalario();
    }


    @Override
    public void exibirDetalhes(String indentacao) {
        System.out.println(indentacao + "- " + nome + " (" + cargo + ") - Salário: " + salario);
    }
}



// Esqueleto da classe Departamento (Este será um "Composto" na sua estrutura Composite)
// Você precisará adicionar a lógica para armazenar membros (funcionários e sub-departamentos)
// e implementar os métodos de forma que usem esses membros.
class Departamento implements Entity{
    private String nome;
    // Você precisará de uma coleção aqui para armazenar Funcionario e outros Departamento
    private List<Entity> content = new ArrayList<>();

    public Departamento(String nome) {
        this.nome = nome;
        // Inicializar a coleção de membros
    }

    public String getNome() {
        return nome;
    }

    // Métodos que você precisará implementar:
    public void adicionarMembro(Entity e){
        content.add(e);
    }
    public void removerMembro(Entity e){
        content.remove(e);
    }
    public double getCustoTotalSalarios(){
        double custo = 0;

        for (Entity e: content){
            custo += e.getCustoTotalSalarios();
        }

        return custo;

    }



    @Override
    public void exibirDetalhes(String indentacao) {
        System.out.println(indentacao + "- " + nome + " [");
        for (Entity entity : content) {
            entity.exibirDetalhes(indentacao);
        }
    }
}



// (Supondo que você criou a interface/classe abstrata ComponenteOrganizacional,
// e suas classes Funcionario e Departamento a implementam/estendem corretamente)

public class DemoOrganograma {

    public static void main(String[] args) {
        // Criando Funcionários (Folhas)
        // Suponha que Funcionario agora implementa/estende sua interface ComponenteOrganizacional
        // e tem um método getSalario() (para um único funcionário, retorna o próprio salário)
        // e exibirDetalhes(String indent).

        // Exemplo de como Funcionario poderia ser se fizesse parte do Composite:
        // public class Funcionario implements ComponenteOrganizacional { ... }
        
        Entity joao = new Funcionario("João Silva", "Engenheiro de Software", 7000.00);
        Entity maria = new Funcionario("Maria Santos", "Designer UX", 6500.00);
        Entity pedro = new Funcionario("Pedro Alves", "Gerente de Projetos", 9000.00);

        Entity ana = new Funcionario("Ana Costa", "Analista de Marketing", 5500.00);
        Entity carlos = new Funcionario("Carlos Dias", "Especialista em SEO", 6000.00);

        Entity sofia = new Funcionario("Sofia Lima", "CEO", 25000.00);

        // Criando Departamentos (Compostos)
        // Suponha que Departamento agora implementa/estende ComponenteOrganizacional
        // e tem métodos como adicionarMembro, getCustoTotalSalarios e exibirDetalhes.

        Departamento depEngenharia = new Departamento("Engenharia");
        depEngenharia.adicionarMembro(joao);
        depEngenharia.adicionarMembro(maria);
        depEngenharia.adicionarMembro(pedro);

        Departamento depMarketing = new Departamento("Marketing");
        depMarketing.adicionarMembro(ana);
        depMarketing.adicionarMembro(carlos);

        Departamento diretoria = new Departamento("Diretoria Executiva");
        diretoria.adicionarMembro(sofia);
        // A diretoria também pode conter outros departamentos como membros
        diretoria.adicionarMembro(depEngenharia);
        diretoria.adicionarMembro(depMarketing);


        System.out.println("--- Detalhes do Organograma ---");
        // O cliente pode chamar exibirDetalhes no nível mais alto (Diretoria)
        // e a estrutura inteira deve ser exibida recursivamente.
        diretoria.exibirDetalhes("");

        System.out.println("\n--- Custos Salariais ---");
        System.out.println("Custo Salarial do Funcionário João: " + joao.getCustoTotalSalarios()); // Para um funcionário, é o seu salário
        System.out.println("Custo Salarial do Departamento de Engenharia: " + depEngenharia.getCustoTotalSalarios());
        System.out.println("Custo Salarial do Departamento de Marketing: " + depMarketing.getCustoTotalSalarios());
        System.out.println("Custo Salarial Total da Diretoria (Empresa): " + diretoria.getCustoTotalSalarios());


        // Teste de remoção (opcional, se você implementou)
        // depEngenharia.removerMembro(maria);
        // System.out.println("\nCusto Salarial da Engenharia após remover Maria: " + depEngenharia.getCustoTotalSalarios());
        // System.out.println("Custo Salarial Total da Diretoria após remover Maria: " + diretoria.getCustoTotalSalarios());
        // System.out.println("\n--- Detalhes do Organograma após remoção ---");
        // diretoria.exibirDetalhes("");
    }
}

