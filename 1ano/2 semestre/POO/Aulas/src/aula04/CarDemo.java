package aula04;

import java.util.Scanner;


public class CarDemo {

    static Scanner sc = new Scanner(System.in);

    static int registerCars(Car[] cars) {

        String infocar;
        int count = 0;


        for (Car car : cars) {

            count += 1;

            if (car == null){
            
                System.out.print("Insira dados do carro (marca modelo ano quilómetros): ");
                infocar = sc.nextLine().trim();


                if (verificacao(infocar)){
                    String[] infocarSplit = infocar.split(";");
                    cars[count - 1] = new Car(infocarSplit[0], infocarSplit[1], Integer.parseInt(infocarSplit[2]), Integer.parseInt(infocarSplit[3]));
                    System.out.printf("Carro adicionado com sucesso no número %d!\n", count);
                }

                if (infocar == ""){
                    break;
                }else if(count == 9){
                    System.out.println("Carros cheios");
                }
            }

        }

        

    

        return count;

        
   }

    static boolean verificacao(String infocar){

        String make,model,year,kms;
        String[] infocarSplit = infocar.split(";");

        if (infocarSplit.length == 4){
            
            make = infocarSplit[0];
            model = infocarSplit[1];
            year = infocarSplit[2];
            kms = infocarSplit[3];


            if (make.matches("[a-zA-z]+") & model.matches("[a-zA-z ]+") & year.matches("\\d+") & kms.matches("\\d+")){
                return true;
            }

            return false;

        }

        return false;

    }

    static void registerTrips(Car[] cars, int numCars) {

        String distancia;

        while(true){

            System.out.print("Registe uma viagem no formato \"carro:distância\": ");
            distancia = sc.nextLine().trim();

            if (distancia == ""){
                break;
            }

            if (verificacao2(distancia)){

                String[] distanciaSplit = distancia.split(":");

                int carro = Integer.parseInt(distanciaSplit[0]);
                int kms = Integer.parseInt(distanciaSplit[1]);

                cars[carro].setKms(kms);

                System.out.println("Kilometros adicionados com sucesso");
            }
        }
    }


    static boolean verificacao2(String distancia){
        
        String[] distanciaSplit = distancia.split(" ");

        if (distanciaSplit.length == 1){


            String[] distanciaSplit2 = distancia.split(":");

            if (distanciaSplit2.length == 2 & distanciaSplit2[0].matches("\\d+") & distanciaSplit2[1].matches("\\d+")){


                return true;

            }

            return false;

        } 

        return false;
    }

    static void listCars(Car[] cars) {
        System.out.println("\nCarros registados: ");


        for (Car car : cars) {

            if (car != null){
            
                System.out.println(car);

            }
        }
        
        System.out.println("\n");
    }

    public static void main(String[] args) {

        Car[] cars = new Car[10];

        int numCars = registerCars(cars);

        if (numCars>0) {
            listCars(cars);
            registerTrips(cars, numCars);
            listCars(cars);
        }

        sc.close();

    }
}