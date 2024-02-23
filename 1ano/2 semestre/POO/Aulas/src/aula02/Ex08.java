package aula02;
import java.util.Scanner;
import java.lang.Math;

public class Ex08 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Cateto A: ");
        double cA = sc.nextDouble();
        System.out.print("Cateto B: ");
        double cB = sc.nextDouble();

        double cC = Math.sqrt(Math.pow(cA,2) + Math.pow(cB,2));

        double graucAcB = Math.toDegrees(Math.acos(cA/cC));

        System.out.printf("A hipotenusa do Cateto A e cateto B é %f e o grau entre o cateto A e a hipotenusa é %f º", cC, graucAcB);

        sc.close();
    }
}
