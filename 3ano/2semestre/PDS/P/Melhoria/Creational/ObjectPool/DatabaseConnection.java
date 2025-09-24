package ObjectPool;

// Simula uma ligação à BD, um objeto dispendioso de criar.
public class DatabaseConnection {
    private static int counter = 0;
    private int id;

    public DatabaseConnection() {
        this.id = ++counter;
        // Simula o processo demorado de estabelecer a ligação
        try {
            System.out.println("A criar ligação à BD #" + id + " (operação lenta)...");
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public void executeQuery(String query) {
        System.out.println("Ligação #" + id + ": a executar query '" + query + "'");
    }

    @Override
    public String toString() {
        return "DatabaseConnection #" + id;
    }
}