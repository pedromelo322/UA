package aula12;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;

public class Ficheiro {
    List<String> palavrasTotais = new ArrayList<>();
    Set<String> palavras = new HashSet<>();


    public void addfile(String caminho){

        try (Scanner sc = new Scanner( new File(caminho))){

            while(sc.hasNextLine()){
                String linhas = sc.nextLine();
                String[] words = linhas.split("\\W");

                for (String string : words) {
                    palavrasTotais.add(string);
                    palavras.add(string);
                }



            }


        }catch(FileNotFoundException e){
            System.out.println(e);
        }

    }

    @Override
    public String toString(){

        String resultado = "";

        resultado += String.format("Número Total de Palavras: %d\n", this.palavrasTotais.size());
        resultado += String.format("Número de Diferentes Palavras: %d\n", this.palavras.size());

        return resultado;
    }
    
}
