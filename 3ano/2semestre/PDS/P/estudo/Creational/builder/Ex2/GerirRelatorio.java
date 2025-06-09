package Creational.builder.Ex2;

import java.util.*;



class Relatorio{

    private StringBuilder conteudo = new StringBuilder();

    public void adicionarConteudo(String parte){
        conteudo.append(parte);
        conteudo.append("\n");
    }


    public String getRelatorioFinal(){
        return conteudo.toString();
    }


    @Override
    public String toString(){
        return getRelatorioFinal();
    }



}






interface ConstrutorRelatorio{

    void construirCabecalho(String tituloEmpresa);

    void construirSecaoDados(List<String> dadosDeVenda);

    void construirRodape(String informacoesContato);

    Relatorio getRelatorio();

    void reset();



}




class ConstrutorRelatorioTexto implements ConstrutorRelatorio{


    private Relatorio relatorio;

    @Override
    public void construirCabecalho(String tituloEmpresa){
        relatorio.adicionarConteudo(tituloEmpresa);
    }

    @Override
    public void construirSecaoDados(List<String> dadosDeVenda){
        
        for (String dadoDeVenda: dadosDeVenda){
            relatorio.adicionarConteudo(dadoDeVenda);
        }


    }

    @Override
    public void construirRodape(String informacoesContato){

        relatorio.adicionarConteudo(informacoesContato);

    }

    @Override
    public Relatorio getRelatorio(){
        
        Relatorio r = relatorio;
        reset();
        return r;


    }

    @Override
    public void reset(){
        this.relatorio = new Relatorio();
    }


    public void ConstrutorRelatorio(){
        this.reset();
    }


}




class ConstrutorRelatorioHTML implements ConstrutorRelatorio{


    private Relatorio relatorio;

    @Override
    public void construirCabecalho(String tituloEmpresa){
        relatorio.adicionarConteudo("<h1>" + tituloEmpresa + "</h1>");
    }

    @Override
    public void construirSecaoDados(List<String> dadosDeVenda){
        
        for (String dadoDeVenda: dadosDeVenda){
            relatorio.adicionarConteudo("<tr>" + dadoDeVenda + "</tr>");
        }


    }

    @Override
    public void construirRodape(String informacoesContato){

        relatorio.adicionarConteudo("<p>" + informacoesContato + "</p>");

    }

    @Override
    public Relatorio getRelatorio(){
        
        Relatorio r = relatorio;
        reset();
        return r;


    }

    @Override
    public void reset(){
        this.relatorio = new Relatorio();
    }


    public void ConstrutorRelatorio(){
        this.reset();
    }


}




class GeradorDeRelatorios{

    private ConstrutorRelatorio construtorRelatorio;


    public void setConstrutor(ConstrutorRelatorio builder){

        construtorRelatorio = builder;

    }

    public void gerarRelatorioDeVendas(String tituloEmpresa, List<String> dados, String contato){

        construtorRelatorio.construirCabecalho(tituloEmpresa);
        construtorRelatorio.construirSecaoDados(dados);
        construtorRelatorio.construirRodape(contato);

    }


    public Relatorio getRelataRelatorio(){

        return construtorRelatorio.getRelatorio();

    }


}














public class GerirRelatorio {
    
    public static void main(String[] args) {
        // Criando instâncias dos ConcreteBuilders
        ConstrutorRelatorioTexto construtorTexto = new ConstrutorRelatorioTexto();
        ConstrutorRelatorioHTML construtorHTML = new ConstrutorRelatorioHTML();
        
        // Inicialização do construtor de texto (devido a um erro no construtor)
        construtorTexto.reset();
        construtorHTML.reset();
        
        // Criando uma instância do GeradorDeRelatorios
        GeradorDeRelatorios gerador = new GeradorDeRelatorios();
        
        // Dados para o relatório
        String tituloEmpresa = "Relatório de Vendas da Empresa XYZ";
        List<String> dadosVendas = new ArrayList<>();
        dadosVendas.add("Produto A: 150 unidades");
        dadosVendas.add("Produto B: 75 unidades");
        dadosVendas.add("Produto C: 200 unidades");
        String informacoesContato = "Contato: vendas@xyz.com | Tel: (11) 1234-5678";
        
        // Gerar relatório em formato texto
        gerador.setConstrutor(construtorTexto);
        gerador.gerarRelatorioDeVendas(tituloEmpresa, dadosVendas, informacoesContato);
        Relatorio relatorioTexto = gerador.getRelataRelatorio();
        
        // Gerar relatório em formato HTML
        gerador.setConstrutor(construtorHTML);
        gerador.gerarRelatorioDeVendas(tituloEmpresa, dadosVendas, informacoesContato);
        Relatorio relatorioHTML = gerador.getRelataRelatorio();
        
        // Imprimir os relatórios
        System.out.println("===== RELATÓRIO EM FORMATO TEXTO =====");
        System.out.println(relatorioTexto);
        
        System.out.println("\n===== RELATÓRIO EM FORMATO HTML =====");
        System.out.println(relatorioHTML);
    }
}