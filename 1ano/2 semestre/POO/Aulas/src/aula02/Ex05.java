package aula02;
import java.util.Scanner;

public class Ex05 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("velocidade da primeira viagem(qm/m): ");
        double v1 = sc.nextDouble();
        System.out.print("distancia da primeira viagem(qm): ");
        double d1 = sc.nextDouble();
        System.out.print("velocidade da segunda viagem(qm/m): ");
        double v2 = sc.nextDouble();
        System.out.print("distancia da segunda viagem(qm): ");
        double d2 = sc.nextDouble();

        double vm = (v1 * d1 + v2 * d2) / (d1 + d2);

        System.out.printf("A velocidade média da viagem de %f quilómetros foi %f qm/m", d1 + d2, vm);

        sc.close();
    }
}
