package aula03;
import java.util.Random;
import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) {
        
        Scanner sc = new Scanner(System.in);

        Random rd = new Random();

        int numEsc = rd.nextInt(99) + 1;

        int num;

        do{

            System.out.print("Insere o crlh de um número entre 1 e 100 se não fores gay: ");

            num = sc.nextInt();
        }while(!acerto(num, numEsc));

        sc.close();

    }

    public static boolean acerto(int num, int numEsc){

        if (num == numEsc){
            System.out.println("Parabéns burro acertastes");
            return true;
        }else if(num > numEsc){
            System.out.println("Estás a acima oh defeciente");
        }else{
            System.out.println("Estás a baixo oh defeciente");
        }


        return false;
    }
}
