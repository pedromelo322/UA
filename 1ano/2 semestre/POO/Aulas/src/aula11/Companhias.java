package aula11;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Companhias {
    
    List<Companhia> lista = new ArrayList<>();

    public Companhias(String caminho) {
        load(caminho);
    }


    public void load(String caminho){
        boolean primeiraLinhaLida = false;

        try (Scanner sc = new Scanner(new File(caminho))){
            

            while(sc.hasNextLine()){
                String linha = sc.nextLine();

                if (!primeiraLinhaLida) {
                    primeiraLinhaLida = true;
                    continue;
                }

                String[] valores = linha.split("\\t", 2);
            

                
                String sigla = valores[0];
                String nome = valores[1];
                
                Companhia companhia = new Companhia(sigla, nome);

                addCompanhia(companhia);

            }
            
        } catch (FileNotFoundException e) {
            System.out.println(e);
        }

        


    }

    public void addCompanhia(Companhia companhia){

        this.lista.add(companhia);

    }

    public void removeCompanhia(String sigla){

        this.lista.remove(getCompanhia(sigla));

    }

    public Companhia getCompanhia(String sigla){

        for (Companhia companhia : this.lista) {
            if (sigla.contains(companhia.getSigla())){
                return companhia;
            }
        }

        return null;

    }


    public List<Companhia> getCompanhias() {
        return lista;
    }


}
