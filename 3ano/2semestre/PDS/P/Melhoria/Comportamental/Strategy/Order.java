package Strategy;

// Representa a encomenda (contém a informação necessária para o cálculo).
public class Order {
    private double totalWeightInKg;

    public Order(double totalWeightInKg) {
        this.totalWeightInKg = totalWeightInKg;
    }

    public double getTotalWeightInKg() {
        return totalWeightInKg;
    }
}