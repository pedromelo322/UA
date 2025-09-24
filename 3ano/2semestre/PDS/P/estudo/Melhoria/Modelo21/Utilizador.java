public class Utilizador {

    private String nome;
    private String localidade;
    private int idade;

    public Utilizador(String nome, String localidade, int idade) {
        this.nome = nome;
        this.localidade = localidade;
        this.idade = idade;
    }

    public String toString() {
        return nome;
    }

}
