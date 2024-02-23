package aula11;

import java.util.ArrayList;
import java.util.List;

public class Companhia {
    String  sigla, nome;
    List<Integer> atrasos = new ArrayList<>();

    public Companhia(String sigla, String nome) {
        this.sigla = sigla;
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public String getNome() {
        return nome;
    }


    public void adicionarAtraso(String atraso){

        String[] valoresAtraso = atraso.split("\\:", 2);

        int sec = Horas.HoratoSec(Integer.parseInt(valoresAtraso[0]), Integer.parseInt(valoresAtraso[1]));  

        this.atrasos.add(sec);

    }

    public int mediaAtraso(){

        int total = 0;
        int media = 0;

        for (int i = 0; i < this.atrasos.size(); i++) {
            total += atrasos.get(i);
        }

        if (this.atrasos.size() != 0){
            media = total/this.atrasos.size();
        }

        return media;

    }


    @Override
    public String toString() {
        return "Companhia [Sigla=" + this.sigla + ", Companhia=" + this.nome + "]";
    }

    
}
