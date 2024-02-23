package aula02;
import java.util.Scanner;
import java.lang.Math;

public class Ex07 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Ponto 1 cordenadas x: ");
        double p1x = sc.nextDouble(); 
        System.out.print("Ponto 1 cordenadas y: ");
        double p1y = sc.nextDouble(); 
        System.out.print("Ponto 2 cordenadas x: ");
        double p2x = sc.nextDouble(); 
        System.out.print("Ponto 2 cordenadas y: ");
        double p2y = sc.nextDouble(); 

        double distancia = Math.sqrt(Math.pow((p1x - p2x),2) + Math.pow((p1y - p2y),2));

        System.out.print("A distancia entre os dois pontos é " + distancia);

        sc.close();
    }
}
