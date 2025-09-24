package Singleton;

public class ConfigManager {

    // TODO: Parte 1
    // Crie o atributo estático e privado que vai guardar a ÚNICA instância desta classe.
    // Pense se quer inicializá-lo aqui (Eager) ou deixá-lo como null (Lazy).
    // Vamos optar pela abordagem LAZY (preguiçosa) neste exercício.
    
    // ... seu atributo estático aqui ...
    public static ConfigManager confManager = null;

    // Atributos da instância, que guardam as configurações
    private String appName;
    private String logLevel;


    // TODO: Parte 2
    // Torne o construtor PRIVADO.
    // Isto impede que outras classes possam criar instâncias de ConfigManager com 'new'.
    // Dentro do construtor, simule a leitura das configurações.
    private ConfigManager() {
        // Simula a leitura de um ficheiro de configuração
        System.out.println("A ler ficheiro de configuração (isto só deve acontecer uma vez!)...");
        this.appName = "A Minha Aplicação Fantástica";
        this.logLevel = "INFO";
    }


    // TODO: Parte 3
    // Crie o método estático e público que servirá como ponto de acesso global.
    // O nome convencional é 'getInstance()'.
    // Dentro deste método, implemente a "Lazy Initialization":
    // 1. Verifique se a instância ainda é nula.
    // 2. Se for, crie a nova instância e guarde-a no atributo estático.
    // 3. Retorne sempre a instância (a nova ou a já existente).
    // Bónus: Como tornaria este método seguro para ambientes com múltiplas threads?

    // ... seu método getInstance() aqui ...

    public static ConfigManager getInstance(){
        if (confManager == null){
            confManager = new ConfigManager();
        }

        return confManager;
    }


    // Getters para as configurações
    public String getAppName() {
        return appName;
    }

    public String getLogLevel() {
        return logLevel;
    }
}