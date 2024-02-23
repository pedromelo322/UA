package aula02;
import java.util.Scanner;

public class Ex06 {
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);

        System.out.print("Tempo em s: ");
        int tempoSegundos = sc.nextInt();

        int horas = tempoSegundos / 3600;
        int restohoras = tempoSegundos % 3600;
        int minutos = restohoras / 60;
        int segundos = restohoras % 60;

        System.out.printf("%d segundos em formato HH:MM:SS é %d:%d:%d", tempoSegundos, horas, minutos, segundos);


        sc.close();
    }
}
