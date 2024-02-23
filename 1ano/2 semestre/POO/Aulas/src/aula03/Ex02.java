package aula03;
import java.util.Scanner;

public class Ex02 {
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);

        int num;
        double taxa;
        double valormensal;

        do{
            System.out.print("Caralho de um número positivo e multiplo de mil: ");
            num = sc.nextInt();
        }while(!validacaovalor(num));

        valormensal = num;

        do{
            System.out.print("Caralho de um taxa entre 0% e 5%: ");
            taxa = sc.nextInt();
        }while(!validacaotaxa(taxa));

        for (int i = 0; i<12; i++){
            valormensal += valormensal * (taxa/100);

            System.out.printf("%d: %f euros, ", i+1, valormensal);
        }

        System.out.println();

        System.out.printf("o valor mensal do fundo nos próximos 12 meses é %f", valormensal);


        sc.close();
    }

    public static boolean validacaovalor(int num){


        if (num > 0 & num % 1000==0){
            return true;
        }


        return false;
    }

        public static boolean validacaotaxa(double num){


        if (num >= 0 & num <= 5){
            return true;
        }


        return false;
    }
}
