package aula11;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Ex04 {
    public static void main(String[] args) {
        Voos voos = new Voos("aula11/voos.txt");
        Companhias companhias = new Companhias("aula11/companhias.txt");
        
        String tabela = printAll(voos, companhias);

        System.out.println(tabela);

        escrever("aula11/Infopublico.txt", tabela);

        String mediaAtrasos = mediaAtraso(companhias);

        System.out.println(mediaAtrasos);

        String chegadaCidade = chegadaCidade(voos);

        System.out.println(chegadaCidade);

        escrever("aula11/cidades.txt", chegadaCidade);

        
    }


    public static void escrever(String caminho, String conteudo){


        try (PrintWriter out = new PrintWriter(new File(caminho))){

            out.println(conteudo);
            System.out.println("Ficheiro escrito com sucesso");
            
        } catch (Exception e) {
            System.out.println(e);
        }


    }

    public static String mediaAtraso(Companhias companhias){

        String resultado = "";

        resultado += String.format("%-25s %-25s \n", "Companhia", "Media Atraso");

        List<Companhia> companhiasLista = companhias.getCompanhias();

        Map<String, Integer> mapa = new HashMap<>();

        for (Companhia companhia : companhiasLista) {
            mapa.put(companhia.getSigla(), companhia.mediaAtraso());
        }

        List<Map.Entry<String, Integer>> listaOrdenada = new ArrayList<>(mapa.entrySet());

        // Ordenar a lista com base nos valores dos pares
        Collections.sort(listaOrdenada, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
        });

        for (Map.Entry<String, Integer> entry : listaOrdenada) {
            resultado += String.format("%-25s %-25s \n", entry.getKey(), String.valueOf(Horas.SectoHora(entry.getValue())));
        }

        return resultado;

    }

    public static String chegadaCidade(Voos voos){

        Map<String, Integer> mapa = new HashMap<>();

        List<Voo> voosLista = voos.getLista();

        for (Voo voo : voosLista) {
            if (!mapa.containsKey(voo.getOrigem())) {
                mapa.put(voo.getOrigem(), 1);
            } else {
                mapa.put(voo.getOrigem(), mapa.get(voo.getOrigem()) + 1);
            }
        }

        List<Map.Entry<String, Integer>> listaOrdenada = new ArrayList<>(mapa.entrySet());

        Collections.sort(listaOrdenada, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });



        //ou voosLista.forEach(voo -> mapa.merge(voo.getOrigem(), 1, Integer::sum));

    
        String resultado = "";

        resultado += String.format("%-25s %-25s \n","Origem", "Voos");

        for (Map.Entry<String, Integer> entry : listaOrdenada){
            resultado += String.format("%-25s %-25s \n", entry.getKey(), String.valueOf(entry.getValue()));
        }

        


        return resultado;
    }


    public static String printAll(Voos voos,Companhias companhias){

        

        String resultado = "";

        List<Voo> voosLista = voos.getLista();


        resultado += String.format("%-25s %-25s %-25s %-25s %-25s %-25s\n","Hora","Voo","Companhia","Origem", "Atraso", "Obs");

        for (Voo voo : voosLista) {
            String cidade = voo.getOrigem();
            String vooNome = voo.getnome();
            String hora = voo.getHora();
            String atraso = voo.getAtraso();
            Companhia companhia = companhias.getCompanhia(voo.getnome());
            String companhiaName = "Desconhecido";
            if (companhia != null){
                companhiaName = companhia.getNome();
            }else{
                companhia = new Companhia(vooNome.split("\\s")[0], companhiaName);
                companhias.addCompanhia(companhia);
            }



            String obs = "";

            if (!atraso.equals("")){
                obs = calcularHorario(hora, atraso);
                companhia.adicionarAtraso(atraso);
            }


            
            resultado += String.format("%-25s %-25s %-25s %-25s %-25s %-25s\n",hora, vooNome,companhiaName, cidade, atraso, obs);
        }
        

        return resultado;
    }

    public static String calcularHorario(String horas, String atraso){

        String[] valoresHoras = horas.split("\\:", 2);
        String[] valoresAtraso = atraso.split("\\:", 2);

        int hora = Integer.parseInt(valoresHoras[0]);
        int min = Integer.parseInt(valoresHoras[1]);
        int horaAtraso = Integer.parseInt(valoresAtraso[0]);
        int minAtraso = Integer.parseInt(valoresAtraso[1]);

        


        int sec = Horas.HoratoSec(hora, min);  
        int secAtraso = Horas.HoratoSec(horaAtraso, minAtraso);   

        
        /*System.out.println("horas: " + horas);
        System.out.println("Atraso: " + atraso);
        System.out.println("hora: " + hora);
        System.out.println("min: " + min);
        System.out.println("sec: " + sec);
        System.out.println("horaAtraso: " + horaAtraso);
        System.out.println("minAtraso: " + minAtraso);
        System.out.println("secAtraso: " + secAtraso);*/

        int resultado = sec + secAtraso;


        return Horas.SectoHora(resultado);
    }
}
