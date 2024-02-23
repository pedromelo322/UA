package aula11;

public class Horas {
    

    public static int HoratoSec(int hora, int min){

        int resultado = 0;

            resultado += hora*3600 + min*60;


        return resultado;
    }

    public static String SectoHora(int sec){


           int horas = sec / 3600;

           int minutos = (sec % 3600)/60;

           String resultado  = String.format("%02d:%02d",horas,minutos);

        return resultado;
    }
}
