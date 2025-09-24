package ObjectPool;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        DatabaseConnectionPool pool = new DatabaseConnectionPool();
        
        System.out.println("\n--- A adquirir ligações da pool ---");
        
        // Adquirir as 3 ligações disponíveis
        DatabaseConnection conn1 = pool.acquireConnection();
        conn1.executeQuery("SELECT * FROM users");
        
        DatabaseConnection conn2 = pool.acquireConnection();
        conn2.executeQuery("UPDATE products SET price = 50");
        
        DatabaseConnection conn3 = pool.acquireConnection();
        conn3.executeQuery("SELECT * FROM orders");

        System.out.println("\nLigações disponíveis na pool: " + pool.getAvailableConnectionCount());
        
        // Tentar adquirir uma quarta ligação (deve falhar)
        System.out.println("\nA tentar adquirir uma quarta ligação...");
        try {
            DatabaseConnection conn4 = pool.acquireConnection();
        } catch (RuntimeException e) {
            System.out.println("SUCESSO: " + e.getMessage());
        }
        
        // Devolver uma ligação à pool
        System.out.println("\nA devolver a ligação " + conn2 + " à pool...");
        pool.releaseConnection(conn2);
        
        System.out.println("Ligações disponíveis na pool: " + pool.getAvailableConnectionCount());
        
        // Adquirir novamente uma ligação (deve ser a que foi devolvida)
        System.out.println("\nA adquirir uma ligação novamente...");
        DatabaseConnection conn5 = pool.acquireConnection();
        System.out.println("Ligação adquirida: " + conn5);
        conn5.executeQuery("DELETE FROM logs");
        
        System.out.println("\nLigações disponíveis na pool: " + pool.getAvailableConnectionCount());
    }
}