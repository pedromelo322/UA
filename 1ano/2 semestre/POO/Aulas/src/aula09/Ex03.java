package aula09;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;


abstract class Plane {
    private String id;
    private String fabricante;
    private String modelo;
    private int anoProducao;
    private int numeroMaxPassageiros;
    private int velocidadeMax;

    public Plane(String id, String fabricante, String modelo, int anoProducao, int numeroMaxPassageiros, int velocidadeMax) {
        this.id = id;
        this.fabricante = fabricante;
        this.modelo = modelo;
        this.anoProducao = anoProducao;
        this.numeroMaxPassageiros = numeroMaxPassageiros;
        this.velocidadeMax = velocidadeMax;
    }

    public String getId() {
        return id;
    }

    public String getFabricante() {
        return fabricante;
    }

    public String getModelo() {
        return modelo;
    }

    public int getAnoProducao() {
        return anoProducao;
    }

    public int getNumeroMaxPassageiros() {
        return numeroMaxPassageiros;
    }

    public int getVelocidadeMax() {
        return velocidadeMax;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((fabricante == null) ? 0 : fabricante.hashCode());
        result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
        result = prime * result + anoProducao;
        result = prime * result + numeroMaxPassageiros;
        result = prime * result + velocidadeMax;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Plane other = (Plane) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (fabricante == null) {
            if (other.fabricante != null)
                return false;
        } else if (!fabricante.equals(other.fabricante))
            return false;
        if (modelo == null) {
            if (other.modelo != null)
                return false;
        } else if (!modelo.equals(other.modelo))
            return false;
        if (anoProducao != other.anoProducao)
            return false;
        if (numeroMaxPassageiros != other.numeroMaxPassageiros)
            return false;
        if (velocidadeMax != other.velocidadeMax)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Plane [id=" + id + ", fabricante=" + fabricante + ", modelo=" + modelo + ", anoProducao=" + anoProducao
                + ", numeroMaxPassageiros=" + numeroMaxPassageiros + ", velocidadeMax=" + velocidadeMax + "]";
    }

    

    

    
}

class CommercialPlane extends Plane {
    private int numOfCrewMembers;

    public CommercialPlane(String id, String manufacturer, String model, int year, int maxNumOfPassengers, double maxSpeed, int numOfCrewMembers) {
        super(id, manufacturer, model, year, maxNumOfPassengers, numOfCrewMembers);
        this.numOfCrewMembers = numOfCrewMembers;
    }

    public int getNumOfCrewMembers() {
        return numOfCrewMembers;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + numOfCrewMembers;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        CommercialPlane other = (CommercialPlane) obj;
        if (numOfCrewMembers != other.numOfCrewMembers)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "CommercialPlane [id=" + super.getId() + ", fabricante=" + super.getFabricante() + ", modelo=" + super.getModelo() + ", anoProducao=" + super.getAnoProducao() + ", numeroMaxPassageiros=" + super.getNumeroMaxPassageiros() + ", velocidadeMax=" + super.getVelocidadeMax() + ", numOfCrewMembers=" + numOfCrewMembers + "]";
    }

    
}

class MilitaryPlane extends Plane {
    private int numMissiles;

    public MilitaryPlane(String id, String manufacturer, String model, int year, int maxPassengers, double maxSpeed, int numMissiles) {
        super(id, manufacturer, model, year, maxPassengers, numMissiles);
        this.numMissiles = numMissiles;
    }

    public int getNumMissiles() {
        return numMissiles;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + numMissiles;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        MilitaryPlane other = (MilitaryPlane) obj;
        if (numMissiles != other.numMissiles)
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "MilitaryPlane [id=" + super.getId() + ", fabricante=" + super.getFabricante() + ", modelo=" + super.getModelo() + ", anoProducao=" + super.getAnoProducao() + ", numeroMaxPassageiros=" + super.getNumeroMaxPassageiros() + ", velocidadeMax=" + super.getVelocidadeMax() + ", numMissiles=" + numMissiles + "]";
    }
    
}

class PlaneManager {

    private Map<String, Plane> lista = new HashMap<>();

    public void addPlane(Plane plane){
        lista.put(plane.getId(), plane);
    }

    public void removePlane(String id){

        lista.remove(id);

    }

    public Plane searchPlane(String id){

        if (this.lista.containsKey(id)){
            return lista.get(id);
        }else{
            return null;
        }

    }

    public List<CommercialPlane> getCommercialPlanes(){
        List<CommercialPlane> listaCommercialPlanes = new ArrayList<>();

        for (Plane e : lista.values()){
            if (e instanceof CommercialPlane){
                listaCommercialPlanes.add((CommercialPlane) e);
            }
        }

        return listaCommercialPlanes;

    }

    public List<MilitaryPlane> getMilitaryPlanes(){
        List<MilitaryPlane> listaMilitaryPlanes = new ArrayList<>();

        for (Plane e : lista.values()){
            if (e instanceof MilitaryPlane){
                listaMilitaryPlanes.add((MilitaryPlane) e);
            }
        }

        return listaMilitaryPlanes;

    }



}






public class Ex03 {
        public static void main(String[] args) {
        PlaneManager planeManager = new PlaneManager();
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\nPlane Fleet Menu:");
            System.out.println("1. Add a plane to the fleet");
            System.out.println("2. Remove a plane from the fleet");
            System.out.println("3. Search for a plane");
            System.out.println("4. Print summary of all planes in the fleet");
            System.out.println("5. Print list of all commercial planes in the fleet");
            System.out.println("6. Print list of all military planes in the fleet");
            System.out.println("7. Print the fastest plane in the fleet");
            System.out.println("0. Exit");

            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    addPlane(planeManager, scanner);
                    break;
                case 2:
                    removePlane(planeManager, scanner);
                    break;
                case 3:
                    searchPlane(planeManager, scanner);
                    break;
                case 4:
                    printAllPlanes(planeManager);
                    break;
                case 5:
                    printCommercialPlanes(planeManager);
                    break;
                case 6:
                    printMilitaryPlanes(planeManager);
                    break;
                case 7:
                    printFastestPlane(planeManager);
                    break;
                case 0:
                    System.out.println("Exiting program...");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
                    break;
            }
        } while (choice != 0);

        scanner.close();
    }

    private static void addPlane(PlaneManager planeManager, Scanner scanner) {
        System.out.println("\nAdding a plane to the fleet:");
        System.out.print("Enter plane ID: ");
        String id = scanner.next();
        System.out.print("Enter manufacturer: ");
        String manufacturer = scanner.next();
        System.out.print("Enter model: ");
        String model = scanner.next();
        System.out.print("Enter year of production: ");
        int year = scanner.nextInt();
        System.out.print("Enter maximum number of passengers: ");
        int maxPassengers = scanner.nextInt();
        System.out.print("Enter maximum speed: ");
        int maxSpeed = scanner.nextInt();

        System.out.println("Select plane type:");
        System.out.println("1. Commercial Plane");
        System.out.println("2. Military Plane");
        System.out.print("Enter your choice: ");
        int type = scanner.nextInt();


        switch (type) {
            case 1:
                System.out.print("Enter number of crew members: ");
                int numOfCrewMembers = scanner.nextInt();
                CommercialPlane commercialPlane = new CommercialPlane(id, manufacturer, model, year, maxPassengers, maxSpeed, numOfCrewMembers);
                planeManager.addPlane(commercialPlane);

                break;
            case 2:
                System.out.print("Enter number of missiles: ");
                int numMissiles = scanner.nextInt();
                MilitaryPlane militaryPlane = new MilitaryPlane(id, manufacturer, model, year, maxPassengers, maxSpeed, numMissiles);
                planeManager.addPlane(militaryPlane);
                break;
            default:
                System.out.println("Invalid choice. Plane not added to the fleet.");
                break;
        }
    }

    private static void removePlane(PlaneManager planeManager, Scanner scanner) {
        System.out.println("\nRemoving a plane from the fleet:");
        System.out.print("Enter plane ID: ");
        String id = scanner.next();
        planeManager.removePlane(id);
    }

    private static void searchPlane(PlaneManager planeManager, Scanner scanner) {
        System.out.println("\nSearching for a plane:");
        System.out.print("Enter plane ID: ");
        String id = scanner.next();
        System.out.println(planeManager.searchPlane(id));
    }

    private static void printAllPlanes(PlaneManager planeManager) {
        System.out.println(planeManager.getMilitaryPlanes());
        System.out.println(planeManager.getCommercialPlanes());
    }

    private static void printCommercialPlanes(PlaneManager planeManager) {
        System.out.println(planeManager.getCommercialPlanes());
        
    }

    private static void printMilitaryPlanes(PlaneManager planeManager) {
        System.out.println(planeManager.getMilitaryPlanes());
    }

    private static void printFastestPlane(PlaneManager planeManager) {
        List<Plane> avioes = new LinkedList<>();
        avioes.addAll(0, planeManager.getCommercialPlanes());
        avioes.addAll(avioes.size()-1, planeManager.getMilitaryPlanes());

        Plane maxSpeed = avioes.get(0);

        for (Plane plane : avioes) {
            if (plane.getVelocidadeMax() > maxSpeed.getVelocidadeMax()){
                maxSpeed = plane;
            }
        }

        System.out.println(maxSpeed);




    }
}
