package ObjectPool;

import java.util.ArrayList;
import java.util.List;

public class DatabaseConnectionPool {

    // Atributos para gerir as ligações disponíveis e em uso.
    private final List<DatabaseConnection> availableConnections = new ArrayList<>();
    private final List<DatabaseConnection> usedConnections = new ArrayList<>();
    private final int MAX_POOL_SIZE = 3;

    // Construtor que inicializa a pool com um número fixo de ligações.
    public DatabaseConnectionPool() {
        System.out.println("A inicializar a Pool de Ligações com " + MAX_POOL_SIZE + " ligações.");
        for (int i = 0; i < MAX_POOL_SIZE; i++) {
            availableConnections.add(new DatabaseConnection());
        }
    }

    // TODO: Parte 1
    // Implemente o método 'acquireConnection()'.
    // Este método deve "emprestar" uma ligação ao cliente.
    // 1. Verifique se há ligações disponíveis na lista 'availableConnections'.
    // 2. Se houver, remova a primeira ligação da lista de disponíveis.
    // 3. Adicione essa ligação à lista de 'usedConnections'.
    // 4. Retorne a ligação.
    // 5. Se não houver ligações disponíveis, lance uma exceção ou retorne null
    //    (neste exercício, vamos lançar uma exceção).
    public synchronized DatabaseConnection acquireConnection() {
        // ... seu código aqui ...
        if(!availableConnections.isEmpty()){
            DatabaseConnection x = availableConnections.remove(0);
            usedConnections.add(x);
            return x;
        }
        throw new RuntimeException("No available connections in the pool.");
    }

    // TODO: Parte 2
    // Implemente o método 'releaseConnection()'.
    // Este método recebe de volta uma ligação que já foi usada.
    // 1. Verifique se a ligação recebida está, de facto, na lista 'usedConnections'.
    // 2. Se estiver, remova-a da lista de usadas.
    // 3. Adicione-a de volta à lista de disponíveis, para que possa ser reutilizada.
    // 4. Retorne 'true' se a operação for bem-sucedida, 'false' caso contrário.
    public synchronized boolean releaseConnection(DatabaseConnection connection) {
        // ... seu código aqui ...
            for (int i = 0; i < usedConnections.size(); i++){
                if (usedConnections.get(i) == connection){
                    DatabaseConnection x = usedConnections.remove(i);
                    availableConnections.add(x);
                    return true;
                }
            }
            return false;
        }
    

    public int getAvailableConnectionCount() {
        return availableConnections.size();
    }
}