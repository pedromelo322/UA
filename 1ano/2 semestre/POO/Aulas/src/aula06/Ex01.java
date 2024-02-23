package aula06;

import aula05.DateYMD;

import java.time.LocalDate;
import java.util.Objects;

class Pessoa{

    private String name;
    private int cc;
    private DateYMD dataNasc;

    public Pessoa(String name, int cc, DateYMD dataNasc) {
        this.name = name;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }


    public String getName() {
        return this.name;
    }

    public int getCc() {
        return this.cc;
    }

    public DateYMD getDataNasc() {
        return this.dataNasc;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Pessoa)) {
            return false;
        }
        Pessoa pessoa = (Pessoa) o;
        return Objects.equals(name, pessoa.name) && cc == pessoa.cc && Objects.equals(dataNasc, pessoa.dataNasc);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, cc, dataNasc);
    }

    @Override
    public String toString() {
        return getName() + "; CC: " + getCc() + "; Data de Nascimento: " + getDataNasc();
    }
    

}

class Aluno extends Pessoa{

    static int numeroMecanograficoBase = 100;
    int numeroMecanografico;
    DateYMD dataInsciracao;


    public Aluno(String Nome, int cc , DateYMD dataNasc, DateYMD dataInsciracao) {
        super(Nome, cc, dataNasc);
        this.numeroMecanografico = numeroMecanograficoBase++;
        this.dataInsciracao = dataInsciracao;
    }

    public Aluno(String Nome, int cc, DateYMD dataNasc) {
        super(Nome, cc, dataNasc);
        this.numeroMecanografico = numeroMecanograficoBase++;

        LocalDate dataAtual = LocalDate.now();

        this.dataInsciracao = new DateYMD(dataAtual.getDayOfMonth(), dataAtual.getMonthValue(), dataAtual.getYear());
    }


    public int getNMec() {
        return this.numeroMecanografico;
    }

    public DateYMD getDataInsciracao() {
        return this.dataInsciracao;
    }



    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Aluno)) {
            return false;
        }
        Aluno aluno = (Aluno) o;
        return numeroMecanografico == aluno.numeroMecanografico && Objects.equals(dataInsciracao, aluno.dataInsciracao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(numeroMecanografico, dataInsciracao);
    }


    @Override
    public String toString() {
        return super.toString() + "; Numero Mecanográfico: " + getNMec() + "; Data de Inscrição: " + getDataInsciracao();
    }



}


class Bolseiro extends Aluno{

    Professor orientador;
    int bolsa;


    public Bolseiro(String Nome, int cc , DateYMD dataNasc, Professor orientador, int bolsa) {
        super(Nome, cc, dataNasc);
        this.orientador = orientador;
        this.bolsa = bolsa;
    }

    public Bolseiro(String Nome, int cc , DateYMD dataNasc,  DateYMD dataInsciracao, Professor orientador, int bolsa) {
        super(Nome, cc, dataNasc, dataInsciracao);
        this.orientador = orientador;
        this.bolsa = bolsa;
    }


    public Professor getOrientador() {
        return this.orientador;
    }

    public void setOrientador(Professor orientador) {
        this.orientador = orientador;
    }

    public int getBolsa() {
        return this.bolsa;
    }

    public void setBolsa(int bolsa) {
        this.bolsa = bolsa;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Bolseiro)) {
            return false;
        }
        Bolseiro bolseiro = (Bolseiro) o;
        return Objects.equals(orientador, bolseiro.orientador) && Objects.equals(bolsa, bolseiro.bolsa);
    }

    @Override
    public int hashCode() {
        return Objects.hash(orientador, bolsa);
    }

    @Override
    public String toString() {
        return super.toString() + "; Orientador: " + getOrientador() + "; Bolsa: " + getBolsa();
    }


}



enum cargo{

    Auxiliar, Associado, Catedrático

}

class Professor extends Pessoa{

    String categoria;
    String departamento;


    public Professor(String Name, int cc, DateYMD dataNasc, String categoria, String departamento){

        super(Name,cc,dataNasc);
        this.departamento = departamento;

        for (cargo c : cargo.values()){

            if (c.name().equals(categoria)){
                this.categoria = categoria;
            }

        }

    }

    public String getCategoria() {

        return this.categoria;
    }


    public String getDepartamento() {
        return this.departamento;
    }


    

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Professor)) {
            return false;
        }
        Professor professor = (Professor) o;
        return Objects.equals(categoria, professor.categoria) && Objects.equals(departamento, professor.departamento);
    }

    @Override
    public int hashCode() {
        return Objects.hash(categoria, departamento);
    }

    @Override
    public String toString() {
        return super.toString() + "; categoria: " + getCategoria() + "; departamento: " + getDepartamento();
    }


}

public class Ex01{

    public static void main(String[] args) {
        Aluno al = new Aluno ("Andreia Melo", 9855678, new DateYMD(18, 7, 1990), new DateYMD(1, 9, 2018));
        Professor p1 = new Professor("Jorge Almeida", 3467225, new DateYMD(13, 3, 1967),"Associado", "Informática");
        Bolseiro bls = new Bolseiro ("Igor Santos", 8976543, new DateYMD(11, 5, 1985), p1,900);
        bls.setBolsa(1050);
        System.out.println("Aluno: " + al.getName());
        System.out.println(al);
        System.out.println("Bolseiro: " + bls.getName() + ", NMec: "
        + bls.getNMec() + ", Bolsa: " + bls.getBolsa() + ", Orientador: " +
        bls.getOrientador());
        System.out.println(bls);
    }

}