package ChainOfResponsibility;

// Representa o pedido a ser processado.
public class Expense {
    private double amount;
    private String description;

    public Expense(double amount, String description) {
        this.amount = amount;
        this.description = description;
    }

    public double getAmount() {
        return amount;
    }

    @Override
    public String toString() {
        return description + " - " + amount + "€";
    }
}