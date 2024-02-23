package aula03;
import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
        
        Scanner  sc = new Scanner(System.in);

        int num;

        do{

            System.out.print("Dá-me um caralho de um número: ");

            num = sc.nextInt();

        }while(!validacao(num));

        int soma = 0;

        for (int i=1; i<=num;i++){
            if (isPrime(i)){
                soma += i;
            }
        }

        System.out.printf("A soma de todos os números primos até %d é %d", num,soma);

        sc.close();

    }

    public static boolean isPrime(int i){

        if (i <= 1){
            return false;
        }

        for (int e=2; e <= Math.sqrt(i); e++){
            if (i % e == 0){
                return false;
            }
        }

        return true;
    }

    public static boolean validacao(int num){

        if (num > 0){
            return true;
        }

        return false;
    }
}
