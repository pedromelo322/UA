package aula02;
import java.util.ArrayList;
import java.util.Scanner;

public class Ex10 {
    public static void main(String[] args) {
        

        ArrayList<Integer> lista = new ArrayList<>();
        Scanner sc = new Scanner(System.in);
        System.out.print("Número: ");
        lista.add(sc.nextInt());
        do{
            System.out.print("Número: ");
            lista.add(sc.nextInt());
        }while(lista.get(0) != lista.get(lista.size() - 1));

        lista.remove(lista.size() - 1);


        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;

        int media = 0;

        for (int e : lista){
            if (e > max){
                max = e;
            }

            if (e < min){
                min = e;
            }

            media += e;

        }

        media = media / lista.size();

        System.out.printf("Min: %d, Max: %d, Media: %d, total de numeros: %d", min, max, media, lista.size());

        sc.close();
    }
}
