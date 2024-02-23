package aula10;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Palavras {

    private String caminho;
    private List<String> lista;
    
    public Palavras(String caminho){
        this.caminho = caminho;
        this.lista = new ArrayList<>();
        palavras();
    }

    private void palavras(){

        try (Scanner input = new Scanner(new File(this.caminho), "utf-8")){ // ou  Scanner input = new Scanner(new FileReader(this.caminho))
            while (input.hasNext()) {
                String word = input.next();

                if (word.matches("[a-zA-Z_0-9]{2,}")){
                    this.lista.add(word);
                }


            }
        } catch (FileNotFoundException e) {
            System.out.println("Ficheiro não encontrado");
        }
    }

    public String palavrasAcabadasS(){

        String resultado = "";

            for (String e : this.lista){
                if (e.endsWith("s")){
                    resultado += e + ";\n";
                }
            }

        return resultado;
    }

    public void removerNaoLetras(){

        List<String> listaPalavras = new ArrayList<>();

        for (String e : this.lista){
            if (e.matches("[a-zA-Z]{2,}")){
                listaPalavras.add(e);
            }
        }

        this.lista = listaPalavras;

        try (PrintWriter write = new PrintWriter(new File(this.caminho))){ // ou para dar append FileWriter write = new FileWrtiter(this.caminho, true)
            for (String e : listaPalavras){
                write.print(e + " ");
            }



        } catch (Exception e) {
            System.out.println("Ficheiro não encontrado");
        }



    }

    @Override
    public String toString() {

        String resultado = "";

        for (String e : this.lista){
            resultado += e + " ";
        }

        return resultado;
    }

}
