package aula05;
import java.util.Scanner;
import java.lang.Math;


public class DateYMDTest{

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        DateYMD data = null;
        int escolha;
        boolean vld = true;

        while (vld){
        
            System.out.println("Date operations: ");

            System.out.println("1 - Create New Date");
            System.out.println("2 - Show Current Date");
            System.out.println("3 - increment Date");
            System.out.println("4 - decrement Date");
            System.out.println("0 - exit");

            System.out.print("Escolha: ");

            escolha = sc.nextInt();

            switch(escolha){

                case 1: 

                    int day, month, year;

                    do {

                        day = (int) (Math.random() * 32);
                        month = (int) (Math.random() * 13);
                        year = (int) (Math.random() * 10001);


                    }while(!DateYMD.valid(day, month, year));

                    data = new DateYMD(day, month, year);
                    

                    break;

                case 2: 
                    System.out.println(data.toString());
                    break;
                case 3:
                    data.increment();
                    break;

                case 4:
                    data.decrement();
                    break;

                default:
                    vld = false;
                    break;
            }

            
        }

        sc.close();

    }

}
