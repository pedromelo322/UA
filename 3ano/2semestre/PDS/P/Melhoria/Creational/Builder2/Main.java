package Builder2;

public class Main {
    public static void main(String[] args) {
        AssemblyLineDirector director = new AssemblyLineDirector();

        // 1. Construir um carro desportivo
        System.out.println("--- A construir um Carro Desportivo ---");
        SportsCarBuilder carBuilder = new SportsCarBuilder();
        director.construct(carBuilder);
        Vehicle sportsCar = carBuilder.getResult();
        System.out.println(sportsCar);

        System.out.println("\n--- A construir um Camião ---");
        // 2. Construir um camião
        TruckBuilder truckBuilder = new TruckBuilder();
        director.construct(truckBuilder);
        Vehicle truck = truckBuilder.getResult();
        System.out.println(truck);
    }
}