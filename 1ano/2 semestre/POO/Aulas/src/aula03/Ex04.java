package aula03;
import java.util.Scanner;
import java.util.Random;

public class Ex04 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        double notaP, notaT, notaMinima = 7.0;

        System.out.print("Número de alunos na turma: ");

        int numeroAlunos = scanner.nextInt(); 

        double [][] notasDosAlunos = new double[numeroAlunos][3];

        for (int i = 0; i < numeroAlunos; i++){
            notaP = random.nextDouble(0.0,20.1);
            notaT = random.nextDouble(0.0, 20.1);
            notasDosAlunos[i][0] = arredondar(notaT);
            notasDosAlunos[i][1] = arredondar(notaP);
            if (notasDosAlunos[i][0] < notaMinima || notasDosAlunos[i][1] < notaMinima){
                notasDosAlunos[i][2] = 66;
            }else{

                notasDosAlunos[i][2] = Math.round((notasDosAlunos[i][0]*0.4 + notasDosAlunos[i][1]*0.6));
            }
        }

        System.out.printf("%-10s %-10s %s\n","NotaT","NotaP","Pauta");

        System.out.println(notasDosAlunos[0][2]);

        for (int i = 0; i < numeroAlunos; i++){
            System.out.printf("%5.1f %10.1f %8d\n",notasDosAlunos[i][0],notasDosAlunos[i][1],(int) notasDosAlunos[i][2]);
        }
        scanner.close();
    }


    public static double arredondar(double numero){
        int num = (int) (numero*10); 
        double valor = (double) num/10;

        return valor;
    }

}
