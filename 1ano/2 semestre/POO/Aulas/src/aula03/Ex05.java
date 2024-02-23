package aula03;

import java.util.Scanner;


public class Ex05 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        int mes = 0, ano = 0;


        while(true){

            System.out.print("Data (no formato mm/yyyy): ");
            String data = scanner.nextLine();


            if (data.contains("/")){
                String[] dataDividida = data.split("/");
                mes = Integer.parseInt(dataDividida[0]);
                ano = Integer.parseInt(dataDividida[1]);

                if (mes >= 1 && mes <= 12 && ano > 0) {
                    break;
                } else {
                    System.out.println("Data inválida");
                }
            } else {
                System.out.println("Formato inválido");
            }

        }

        int diaSemana = 0;

        while(true){
            System.out.print("dia da semana em que começa esse mês \n(1 = Segunda, 2 = Terça, 3 = Quarta, 4 = Quinta, 5 = Sexta, 6 = Sábado, 7 = Domingo): ");
            diaSemana = scanner.nextInt();

            if (diaSemana >= 1 && diaSemana <= 7){
                break;
            }else{
                System.out.println("Indique um dia da semana válido");
            }
        }

        scanner.close();  

        int numDias;
        
        switch (mes) {
            case 4:
            case 6:
            case 9:
            case 11:
                numDias = 30;
                break;
            case 2:
                if ((ano % 4 == 0 && ano % 100 != 0) || ano % 400 == 0) {
                    numDias = 29;
                } else {
                    numDias = 28;
                }
                break;
            default:
                numDias = 31;
                break;
        }


        int count = 0, i = 0 ,valorInteiro = 0;

        if (diaSemana == 7){
            diaSemana = 0;
        }

        valorInteiro = (numDias + diaSemana)/7;
        double valorResto = (numDias + diaSemana)%7;

        if (valorResto != 0){
            valorInteiro += 1;
        }

        int elementos = valorInteiro * 7;

        String [] calendario = new String [elementos];

        for(i=0; i < elementos; i++){
            if (i >= (diaSemana) && count < numDias){
                count ++;
                calendario[i] = Integer.toString(count);
            }else{
                calendario[i] = " ";
            }


        }

        String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
                    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};

        
        int largura = 28;
        String cabecalho = meses[mes-1] + " " + ano;
        String espacos = " ".repeat((largura - cabecalho.length()) / 2);
        String cabecalhoCentralizado = espacos + cabecalho + espacos;
        System.out.printf("%-" + largura + "s%n", cabecalhoCentralizado);
                    

        System.out.printf("%-3s %-3s %-3s %-3s %-3s %-3s %-3s\n","Dom","Seg","Ter","Qua","Qui","Sex","Sáb");
                    

        for (i = 0; i<valorInteiro;i++){

            System.out.printf("%-3s %-3s %-3s %-3s %-3s %-3s %-3s\n",calendario[0 + i*7],calendario[1 + i*7],calendario[2 + i*7],calendario[3 + i*7],calendario[4 + i*7],calendario[5 + i*7],calendario[6 + i*7]);

        }
  

    }
}
