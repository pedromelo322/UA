package aula02;
import java.util.Scanner;

public class Ex04 {
    public static void main(String[] args) {
     
        Scanner sc = new Scanner(System.in);

        System.out.print("montante investido: ");

        double montanteInvestido = sc.nextDouble();

        System.out.print("taxa de juro mensal: ");

        double taxaJuroMensal = sc.nextDouble();

        System.out.print("Duração em meses: ");

        double duracaoMeses = sc.nextInt();

        double investimento = montanteInvestido;

        for (int i=0; i<duracaoMeses; i++){

            investimento += investimento * (taxaJuroMensal/100);

        }

        System.out.printf("para um investimento de %f euros e uma taxa de %f o montante ao fim de %f meses será de %f euros", montanteInvestido, taxaJuroMensal, duracaoMeses, investimento);

        sc.close();

    }
}
