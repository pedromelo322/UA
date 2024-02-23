package aula11;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EnergyUsageReport {

    List <Customer> lista = new ArrayList<>();
    

    public void load(String ficheiro){

        try(Scanner sc = new Scanner(new File(ficheiro))){

            while(sc.hasNextLine()){

                String linha = sc.nextLine();

                String[] valores = linha.split("\\|", 2);

                int ID = Integer.parseInt(valores[0]);
                String[] dados = valores[1].split("\\|");

                List <Double> dadosDouble = new ArrayList<>();

                for (String double1 : dados) {

                    dadosDouble.add(Double.parseDouble(double1));
                    
                }

                Customer customer = new Customer(ID, dadosDouble);

                addCustomer(customer);
                
                
            }

        }catch(FileNotFoundException e){
            System.out.println(e);
        }

    }

    public void addCustomer(Customer Customer){
    
        this.lista.add(Customer);

    }

    public void removeCustomer(int id){
    
        this.lista.add(getCustomer(id));

    }

    public Customer getCustomer(int id){

        for (Customer customer : lista) {
            if (customer.getCustomerId() == id){
                return customer;
            }
        }
        return null;
    }

    public double calculateTotalUsage(int id){

        double valorTotal = 0.0;

        Customer customer = getCustomer(id);

        for (double e : customer.getMeterReadings()){

            valorTotal += e;

        };

        return valorTotal;

    }

    public void generateReport(String caminho){

        try(PrintWriter out = new PrintWriter(caminho)){

            out.println(this.lista);


        }catch(FileNotFoundException e){
            System.out.println(e);
        }

    }

}
