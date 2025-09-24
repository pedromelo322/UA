package Builder2;

import java.util.LinkedList;

// O "Product" - o objeto complexo a ser construído.
public class Vehicle {
    private String vehicleType;
    private LinkedList<String> parts = new LinkedList<>();

    public Vehicle(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public void addPart(String part) {
        parts.add(part);
    }

    @Override
    public String toString() {
        return "Tipo de Veículo: " + vehicleType + "\nPeças: " + String.join(", ", parts);
    }
}