package aula02;
import java.util.Scanner;

public class Ex09 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("N: ");

        int N = sc.nextInt();

        for (int i=N; i>=0; i--){
            System.out.printf("%d,",i);
        }

        sc.close();
    }
}
