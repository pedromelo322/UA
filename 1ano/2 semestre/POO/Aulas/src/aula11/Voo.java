package aula11;

public class Voo {
    String hora, nome, origem, atraso;

    public Voo(String hora, String nome, String origem, String atraso) {
        this.hora = hora;
        this.nome = nome;
        this.origem = origem;
        this.atraso = atraso;
    }

    public String getHora() {
        return hora;
    }

    public String getnome() {
        return nome;
    }

    public String getOrigem() {
        return origem;
    }

    public String getAtraso() {
        return atraso;
    }

    @Override
    public String toString() {
        return "Voo [hora=" + hora + ", nome=" + nome + ", origem=" + origem + ", atraso=" + atraso + "]";
    }
}
