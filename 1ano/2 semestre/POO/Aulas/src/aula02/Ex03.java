package aula02;
import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("quantidade de água M(em quilogramas): ");
        double quantidadeAguaQuilogramas = sc.nextDouble();
        System.out.print("temperatura inicial da água (em graus Celsius): ");
        double temperaturaIncialAguaCelsius = sc.nextDouble();
        System.out.print("temperatura final da água (em graus Celsius): ");
        double temperaturaFinalAguaCelsius = sc.nextDouble();

        double EnergiaJoules = quantidadeAguaQuilogramas * (temperaturaFinalAguaCelsius- temperaturaIncialAguaCelsius) * 4148;

        System.out.printf("A energia necessária para aquecer %f Litros de água desde de %f graus Celcius até  %f graus Celcius é %f Joules.", quantidadeAguaQuilogramas, temperaturaIncialAguaCelsius, temperaturaFinalAguaCelsius, EnergiaJoules);

        sc.close();

    }
}
