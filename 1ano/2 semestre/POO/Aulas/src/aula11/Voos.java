package aula11;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Voos{

    List<Voo> lista = new ArrayList<>();

    
    
    public Voos(String caminho) {
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

                String[] valores = linha.split("\\t", 4);


                String hora = valores[0];
                String nome = valores[1];
                String origem = valores[2];
                String atraso = valores[3];

                
                Voo voo = new Voo(hora, nome, origem, atraso);

                addVoo(voo);

            }
            
        } catch (FileNotFoundException e) {
            System.out.println(e);
        }


    }

    public List<Voo> getLista() {
        return lista;
    }

    public void addVoo(Voo voo){

        this.lista.add(voo);

    }

    public void removeVoo(String nome){

        this.lista.remove(getVoo(nome));

    }

    public Voo getVoo(String nome){

        for (Voo voo : lista) {
            if (voo.getnome().equals(nome)){
                return voo;
            }
        }

        return null;

    }



}
