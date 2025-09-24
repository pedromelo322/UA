package Singleton;

public class Main {
    public static void main(String[] args) {
        System.out.println("--- A iniciar a aplicação ---");

        // Obter a instância pela primeira vez
        System.out.println("A pedir instância 1...");
        ConfigManager config1 = ConfigManager.getInstance();
        System.out.println("Nome da App (a partir da instância 1): " + config1.getAppName());

        System.out.println();

        // Obter a instância pela segunda vez
        System.out.println("A pedir instância 2...");
        ConfigManager config2 = ConfigManager.getInstance();
        System.out.println("Nível de Log (a partir da instância 2): " + config2.getLogLevel());

        System.out.println();

        // Verificar se ambas as referências apontam para o mesmo objeto
        if (config1 == config2) {
            System.out.println("Sucesso! Ambas as variáveis apontam para a mesma e única instância.");
        } else {
            System.out.println("Erro! Foram criadas instâncias diferentes.");
        }
    }
}