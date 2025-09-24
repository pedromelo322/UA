package Builder1;

public class DatabaseConfig {

    // --- Atributos do Produto Final ---
    // Estes são os campos do objeto que queremos construir. Devem ser 'final'
    // para garantir a imutabilidade do objeto DatabaseConfig.

    // Parâmetros obrigatórios
    private final String url;
    private final String username;

    // Parâmetros opcionais
    private final int port;
    private final int timeout;
    private final int maxConnections;
    private final boolean useEncryption;


    // TODO: Parte 1
    // Crie o construtor PRIVADO para a classe DatabaseConfig.
    // Este construtor deve receber um objeto Builder como argumento e usar
    // os valores desse builder para inicializar os seus próprios atributos.
    // Exemplo: this.url = builder.url;

    // ... seu construtor privado aqui ...
    private DatabaseConfig(Builder b){
        this.url = b.url;
        this.username = b.username;
        this.port = b.port;
        this.timeout = b.timeout;
        this.maxConnections = b.maxConnections;
        this.useEncryption = b.useEncryption;
    }


    // TODO: Parte 2
    // Crie a classe interna estática 'Builder'.
    public static class Builder {

        // TODO: Parte 2.1
        // O Builder precisa de ter os mesmos atributos que a classe DatabaseConfig.
        // No entanto, aqui eles NÃO devem ser 'final', pois serão modificados passo a passo.

        // Parâmetros obrigatórios (devem ser 'final' no Builder)
        // ...
        private final String url;
        private final String username;

        // Parâmetros opcionais (devem ser inicializados com valores padrão)
        // ...
        private int port = 0;
        private int timeout = 0;
        private int maxConnections = 0;
        private boolean useEncryption = false;


        // TODO: Parte 2.2
        // Crie o construtor do Builder. Ele deve receber APENAS os parâmetros
        // OBRIGATÓRIOS (url e username) como argumentos.
        
        // ... construtor do Builder aqui ...
        public Builder(String url, String username){
            this.url = url;
            this.username = username;
        }


        // TODO: Parte 2.3
        // Crie os métodos "fluentes" para cada parâmetro OPCIONAL.
        // Cada método deve receber o valor do parâmetro, atribuí-lo ao campo
        // correspondente no Builder e retornar 'this' para permitir o encadeamento.
        // Exemplo: public Builder port(int port) { this.port = port; return this; }

        // ... seus métodos fluentes aqui (port, timeout, maxConnections, useEncryption) ...

        public Builder port(int port) { this.port = port; return this; }
        public Builder timeout(int timeout) {this.timeout = timeout; return this;}
        public Builder maxConnections(int maxConnections) {this.maxConnections = maxConnections; return this;}
        public Builder useEncryption(boolean useEncryption) {this.useEncryption = useEncryption; return this;}
        

        // TODO: Parte 2.4
        // Crie o método 'build()'.
        // Este método deve criar e retornar uma nova instância de DatabaseConfig,
        // passando a si mesmo (this) para o construtor privado da classe externa.
        
        // ... seu método build() aqui ...
        public DatabaseConfig build(){return new DatabaseConfig(this);};

    } // Fim da classe Builder


    // (Opcional) Método toString para facilitar a verificação
    @Override
    public String toString() {
        return "DatabaseConfig{" +
                "url='" + url + '\'' +
                ", username='" + username + '\'' +
                ", port=" + port +
                ", timeout=" + timeout +
                ", maxConnections=" + maxConnections +
                ", useEncryption=" + useEncryption +
                '}';
    }
}