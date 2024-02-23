package aula04;

import java.util.Scanner;
import java.lang.Math;

public class SimpleCarDemo {

    static Scanner sc = new Scanner(System.in);

    public static void main(String[] args) {

Car[] cars = new Car[3];
        cars[0] = new Car("Renault Megane", "Sport Tourer", 2015, 35356);
        cars[1] = new Car("Toyota", "Camry", 2010, 32456);
        cars[2] = new Car("Mercedes", "Vito", 2008, 273891);

        listCars(cars);

        // Adicionar 10 viagens geradas aleatoriamente
        for (int i=0; i<10; i++) {
            int j = (int)Math.round(Math.random()*2); // escolhe um dos 3 carros
            int kms = (int)Math.round(Math.random()*1000); // viagem até 1000 kms
            System.out.printf("Carro %d viajou %d quilómetros.\n", j, kms);
            cars[j].drive(kms);
        }

        listCars(cars);

        sc.close();

    }


    static void listCars(Car[] cars) {
        for (Car e : cars) {
            System.out.println(e.toString());
        }
    }
}

