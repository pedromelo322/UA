package aula11;


import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.File;
import java.util.Scanner;
import java.util.TreeMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Manipulacao {
    
    private String caminho;
    private Map<String, Map<String, Integer>> lista;

    public Manipulacao(String caminho) {
        this.caminho = caminho;
        lista = new TreeMap<>();
        abrirFicheiro();
    }

    public void abrirFicheiro(){
        try(Scanner sc = new Scanner(new File(this.caminho), "utf-8")){

            List<String> listapalavras = new ArrayList<>();     
    

            while(sc.hasNextLine()){
                String linha = sc.nextLine();
                String[] words = linha.split("\\W+");
                for (String word : words){
                    if (word.matches("\\w{3,}")){
                        listapalavras.add(word.toLowerCase());
                    }
                } 
            }

            //System.out.println(listapalavras);

            for (int i = 0; i < listapalavras.size() - 1; i++){

                if (!this.lista.keySet().contains(listapalavras.get(i))){
                    Map<String, Integer> mapa = new TreeMap<>();
                    mapa.put(listapalavras.get(i+1), 1);
                    lista.put(listapalavras.get(i), mapa);
                }else{
                    if (this.lista.get(listapalavras.get(i)).keySet().contains(listapalavras.get(i + 1))){
                        int valor = this.lista.get(listapalavras.get(i)).get(listapalavras.get(i+1));
                        this.lista.get(listapalavras.get(i)).put(listapalavras.get(i+1), valor + 1);
                    }else{
                        this.lista.get(listapalavras.get(i)).put(listapalavras.get(i+1),1);
                    }
                }

            }
            


        }catch (FileNotFoundException e){
            System.out.println(e);
        }
    }

    public static void escreverFicheiro(String conteudo){

        try{
            PrintWriter out = new PrintWriter(new File("aula11/file.txt"));
            out.println(conteudo);
            out.close();
        }catch(FileNotFoundException e){
            System.out.println(e);
        }

    }

    public String getCaminho() {
        return caminho;
    }

    public Map<String, Map<String, Integer>> getLista() {
        return lista;
    }

    @Override
    public String toString() {
        return "Manipulacao [caminho=" + caminho + ", lista=" + lista + "]";
    }


}
