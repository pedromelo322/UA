package aula02;
import java.util.Scanner;

public class Ex02 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Temperatura em Graus Celsius: ");

        double temperaturaGrausCelsius = sc.nextDouble();

        double temperaturaGrausFahrenheit = temperaturaGrausCelsius * 1.8 + 32;

        System.out.printf("%f Graus Celsius são %f Graus Fahrenheit", temperaturaGrausCelsius, temperaturaGrausFahrenheit);

        sc.close();
        
    }
}
