package aula02;
import java.util.Scanner;

public class Ex11 {
    public static void main(String[] args) {
    
        Scanner sc = new Scanner(System.in);

        System.out.print("Dá-me o crlh de um numero inteiro entre 1000 e 6000: ");

        int num = sc.nextInt();

        if (validacao(num)){
            System.out.println("És lindo.");
        }else{
            System.out.println("És defeciente.");
        }

        sc.close();


    }

    public static boolean validacao(int num){

        if (num >= 1000 & num <= 6000){
            return true;
        }

        return false;

    }

    
}
