package aula08;

import java.util.HashMap;

interface Produto {
    String getNome();
    double getPreco();
    int getQuantidade();
    void adicionarQuantidade(int quantidade);
    void removerQuantidade(int quantidade);
}


class ProdutoGenerico implements Produto{

    private String nome;
    private double preco;
    private int quantidade;

    public ProdutoGenerico(String nome, double preco, int quantidade){

        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;

    }

    public String getNome() {
        return this.nome;
    }


    public double getPreco() {
        return this.preco;
    }

    public int getQuantidade() {
        return this.quantidade;
    }

    public void adicionarQuantidade(int quantidade){
        this.quantidade += quantidade;
    }
    
    
    public void removerQuantidade(int quantidade){
        this.quantidade -= quantidade;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((this.nome == null) ? 0 : this.nome.hashCode());
        long temp;
        temp = Double.doubleToLongBits(this.preco);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        result = prime * result + this.quantidade;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ProdutoGenerico other = (ProdutoGenerico) obj;
        if (this.nome == null) {
            if (other.nome != null)
                return false;
        } else if (!this.nome.equals(other.nome))
            return false;
        if (Double.doubleToLongBits(this.preco) != Double.doubleToLongBits(other.preco))
            return false;
        if (this.quantidade != other.quantidade)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "ProdutoGenerico [nome=" + this.nome + ", preco=" + this.preco + ", quantidadeStock=" + this.quantidade + "]";
    }
    
}


class ProdutoComDesconto extends ProdutoGenerico{


    private double disconto;

    public ProdutoComDesconto(String nome, double preco, int quantidade, double disconto){
        super(nome, preco, quantidade);
        this.disconto = disconto;

    }

    public double getDisconto() {
        return disconto;
    }

    public void setDisconto(double disconto) {
        this.disconto = disconto;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        long temp;
        temp = Double.doubleToLongBits(disconto);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        ProdutoComDesconto other = (ProdutoComDesconto) obj;
        if (Double.doubleToLongBits(disconto) != Double.doubleToLongBits(other.disconto))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "ProdutoComDesconto [nome=" + super.getNome() + ", preco=" + super.getPreco() + ", quantidadeStock=" + super.getQuantidade() + "," + "disconto=" + this.disconto + "]";
    }

}


interface Compra {
    void adicionarProduto (Produto produto, int quantidade);
    void listarProdutos();
    double calcularTotal();
}

class CarrinhoDeCompras implements Compra{

    private HashMap<Produto, Integer> produtos;

    public CarrinhoDeCompras(){
        this.produtos = new HashMap<>();
    }

    public void adicionarProduto(Produto produto, int quantidade){
        if (produto.getQuantidade() >= quantidade){
            produto.removerQuantidade(quantidade);
            produtos.put(produto, quantidade);
        }else{
            System.out.println("Essa quantidade não está disponivel");
        }
    }
    
    public void listarProdutos(){

        for (Produto e : produtos.keySet()) {

            System.out.println(e.toString() + " , " + produtos.get(e));
            
        }

    }

    public double calcularTotal(){

        double resultado = 0;
        double preco;


        for (Produto e : produtos.keySet()) {

            if (e instanceof ProdutoComDesconto){
                ProdutoComDesconto ed = (ProdutoComDesconto) e;
                preco = ed.getPreco()*((100-ed.getDisconto())/100);
            }else{
                preco = e.getPreco();
            }

            resultado += preco * produtos.get(e);
            
        }

        return resultado;

    }


}


public class Ex03 {
    public static void main(String[] args) {
        Produto p1 = new ProdutoGenerico("Camisolas", 10, 3);
        Produto p2 = new ProdutoGenerico("Calças", 30, 1);
        Produto p3 = new ProdutoComDesconto("Sapatilhas", 50, 2, 50);
        Produto p4 = new ProdutoComDesconto("Casacos", 100, 1, 10);
        
        CarrinhoDeCompras carrinho = new CarrinhoDeCompras();
        carrinho.adicionarProduto(p1, 1);
        carrinho.adicionarProduto(p2, 5);
        carrinho.adicionarProduto(p3, 2);
        carrinho.adicionarProduto(p4, 1);

        carrinho.listarProdutos();
        System.out.printf("Preço total da compra %.2f\n", carrinho.calcularTotal());
    }
}
