package Builder1;
public class Main {
    public static void main(String[] args) {
        
        // Criar uma configuração simples, apenas com os campos obrigatórios
        // O Builder usará os valores padrão para os opcionais.
        DatabaseConfig basicConfig = new DatabaseConfig.Builder("jdbc:mysql://localhost", "user")
                                            .build();
        System.out.println("Configuração Básica: " + basicConfig);


        // Criar uma configuração completa, definindo todos os parâmetros
        DatabaseConfig fullConfig = new DatabaseConfig.Builder("jdbc:postgresql://remote-server", "admin")
                                            .port(5432)
                                            .timeout(5000)
                                            .maxConnections(20)
                                            .useEncryption(true)
                                            .build();
        System.out.println("Configuração Completa: " + fullConfig);


        // Criar uma configuração com apenas alguns parâmetros opcionais
        DatabaseConfig customConfig = new DatabaseConfig.Builder("jdbc:sqlserver://192.168.1.100", "appuser")
                                             .timeout(10000)
                                             .useEncryption(true)
                                             .build();
        System.out.println("Configuração Personalizada: " + customConfig);
    }
}