package aula02;
import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Insira uma distancia em quilémetros: ");
        double quilometros = sc.nextDouble();
        double milhas = quilometros / 1.609;
        System.out.printf("%4f quilómetros são %.4f milhas", quilometros, milhas);
        sc.close();
    }
}
