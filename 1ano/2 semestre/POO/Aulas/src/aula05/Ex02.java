package aula05;

import java.util.Scanner;


public class Ex02 {
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        int opcao = 5 ,ano = 0, diaSemana = 0;;
        Calendar calendario = null;

        do{
            System.out.println("Escolha uma opção: ");
            System.out.println("1 - Criar novo calendário");
            System.out.println("2 - Mostrar calendário do mes");
            System.out.println("3 - Mostrar calendário");
            System.out.println("4 - Adicionar evento");
            System.out.println("5 - Remover evento");
            System.out.println("0 - Sair");
            System.out.print("Opção: ");
            opcao = scanner.nextInt();
            switch(opcao){
                case 1:
                    do{
                        System.out.println("--------------------");
                        System.out.print("Ano: ");
                        ano = scanner.nextInt();
                        System.out.println("--------------------");

                        
                        System.out.println("1 - Domingo");
                        System.out.println("2 - Segunda");
                        System.out.println("3 - Terça");
                        System.out.println("4 - Quarta");
                        System.out.println("5 - Quinta");
                        System.out.println("6 - Sexta");
                        System.out.println("7 - Sábado");
                        System.out.println("--------------------");
                        System.out.print("dia da semana em que começa o ano: ");
                        
                        diaSemana = scanner.nextInt();

                    }while(!(ano > 0 && diaSemana > 0 && diaSemana <= 7));
                    calendario = new Calendar(diaSemana, ano);
                    break;
                case 2:
                if (calendario != null){
                    System.out.print("Mês: ");
                    int mes = scanner.nextInt();
                    calendario.toString(mes);
                }else{
                    System.out.println("Não foi criado um calendário");
                }
                break;
                case 3:
                    if (calendario != null){
                        calendario.toStringTotal();
                    }else{
                        System.out.println("Não foi criado um calendário");
                    }
                    break;

                case 4:
                    if (calendario != null){
                        System.out.print("Dia: ");
                        int dia = scanner.nextInt();
                        System.out.print("Mês: ");
                        int mes = scanner.nextInt();


                        DateYMD data = new DateYMD(dia, mes, ano);

                        calendario.addEvent(data);
                    }else{
                        System.out.println("Não foi criado uma data");
                    }
                    break;

                case 5:
                    if (calendario != null){
                        System.out.print("Dia: ");
                        int dia = scanner.nextInt();
                        System.out.print("Mês: ");
                        int mes = scanner.nextInt();

                        DateYMD data = new DateYMD(dia, mes, ano);

                        calendario.removeEvent(data);
                    }else{
                        System.out.println("Não foi criado uma data");
                    }
                    break;

                default:
                    System.out.println("Opção inválida");
                    break;
                }

        }while(opcao != 0);
        scanner.close();
    }
}

class Calendar{
    private int diaSemanaInicial;
    private int year;
    private Integer[] diasCalendario;
    private StringBuilder builder;


    public Calendar(int diaSemanaInicial, int year) {
        this.diaSemanaInicial = diaSemanaInicial;
        this.year = year;
        this.diasCalendario = diasMes(diaSemanaInicial,year);
        StringBuilder builder = new StringBuilder();
        this.builder = builder;
    }

    public int getdiaSemanaInicial() {
        return this.diaSemanaInicial;
    }


    public int getYear() {
        return this.year;
    }

    public int getDiaSemana(int month) {
        return this.diasCalendario[month];
    }


    public void addEvent(DateYMD date) {
        builder.append(date.toString());
    }

    public void removeEvent(DateYMD date) {
        int index = builder.indexOf(date.toString());
        if (index != -1){
            builder.delete(index, index + date.toString().length());
        }else{
            System.out.println("Não existe evento nessa data");
        }


    }
    


    public static Integer[] diasMes(int diaSemana, int year){

        int numDias = 0;

        Integer[] diasCalendario = new Integer[12];
        diasCalendario[0] = diaSemana;

        for (int i=0; i<11; i++){
            numDias = DateYMD.monthDays(i+1, year);
            for (int j=0; j<numDias; j++){
                diaSemana += 1;
                if (diaSemana == 8){
                    diaSemana = 1;
                }
            }
            diasCalendario[i+1] = diaSemana;
        }

        return diasCalendario;

    }


    public void toStringTotal() {

        for (int i=0; i<12; i++){
            toString(i+1);
        }
    }


    public String toString(int month) {
        int diaSemana = this.diasCalendario[month-1];
        int count = 0, i = 0 ,valorInteiro = 0;
        int numDias = DateYMD.monthDays(month, this.year);


        valorInteiro = (numDias + diaSemana)/7;
        double valorResto = (numDias + diaSemana)%7;

        if (valorResto != 0){
            valorInteiro += 1;
        }

        int elementos = valorInteiro * 7;
        DateYMD data;
        int index;

        String [] calendario = new String [elementos];

        for(i=0; i < elementos; i++){
            if (i >= (diaSemana)-1 && count < numDias){
                count ++;
                data = new DateYMD(count, month, this.year);
                index = builder.indexOf(data.toString());
                if (index != -1){
                    calendario[i] = "*" + Integer.toString(count);
                }else{
                    calendario[i] = Integer.toString(count);
                }
            }else{
                calendario[i] = " ";
            }


        }

        String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
                    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};

        
        int largura = 28;
        String cabecalho = meses[month-1] + " " + this.year;
        String espacos = " ".repeat((largura - cabecalho.length()) / 2);
        String cabecalhoCentralizado = espacos + cabecalho + espacos;
        System.out.printf("%-" + largura + "s%n", cabecalhoCentralizado);
                    

        System.out.printf("%-3s %-3s %-3s %-3s %-3s %-3s %-3s\n","Dom","Seg","Ter","Qua","Qui","Sex","Sáb");
                    

        for (i = 0; i<valorInteiro;i++){

            System.out.printf("%-3s %-3s %-3s %-3s %-3s %-3s %-3s\n",calendario[0 + i*7],calendario[1 + i*7],calendario[2 + i*7],calendario[3 + i*7],calendario[4 + i*7],calendario[5 + i*7],calendario[6 + i*7]);

        }

        return "";
    }



}

