package Structural.Adapter;

// Interface que seu sistema espera
interface SensorTemperatura {
    double lerTemperaturaCelsius(); // Retorna a temperatura em Celsius
}

// Seu sistema principal
class EstacaoMeteorologica {
    private SensorTemperatura sensor;

    public EstacaoMeteorologica(SensorTemperatura sensor) {
        this.sensor = sensor;
    }

    public void exibirTemperaturaAtual() {
        double tempCelsius = sensor.lerTemperaturaCelsius();
        System.out.printf("Temperatura atual: %.2f °C\n", tempCelsius);
        // Lógica adicional para registrar, alertar, etc.
    }

    // Permite trocar o sensor em tempo de execução
    public void setSensor(SensorTemperatura sensor) {
        this.sensor = sensor;
    }
}



class Adapter implements SensorTemperatura{

    private MedidorFahrenheitAntigo sensor;


    public Adapter(MedidorFahrenheitAntigo antigo){
        this.sensor = antigo;
    }


    @Override
    public double lerTemperaturaCelsius(){
        return (double) (sensor.getTempF() - 32) * 5/9; 
    }

}




// O componente legado/externo que você precisa integrar
class MedidorFahrenheitAntigo {
    private double temperaturaFahrenheit;

    public MedidorFahrenheitAntigo() {
        // Simula a leitura de um sensor real que opera em Fahrenheit
        this.temperaturaFahrenheit = (Math.random() * 100) + 32; // Um valor aleatório entre 32°F e 132°F
    }

    public double getTempF() {
        System.out.println("MedidorFahrenheitAntigo: Lendo " + temperaturaFahrenheit + " °F");
        return this.temperaturaFahrenheit;
    }

    // Método para simular uma nova leitura do sensor
    public void simularNovaLeitura() {
        this.temperaturaFahrenheit = (Math.random() * 100) + 32;
         System.out.println("MedidorFahrenheitAntigo: Nova leitura simulada.");
    }
}



public class DemoEstacaoMeteorologica {

    public static void main(String[] args) {
        // 1. Criar o componente legado/externo (Adaptee)
        MedidorFahrenheitAntigo sensorAntigo = new MedidorFahrenheitAntigo();

        // 2. Criar o seu Adapter, envolvendo o sensor antigo
        //    (Substitua 'SeuAdapterDeTemperatura' pelo nome da sua classe Adapter)
        //    Exemplo: SensorTemperatura adaptador = new SeuAdapterDeTemperatura(sensorAntigo);
        SensorTemperatura adaptador = new Adapter(sensorAntigo); // Nome hipotético do seu adapter

        // 3. Criar o cliente (EstacaoMeteorologica) e configurá-lo com o Adapter
        EstacaoMeteorologica estacao = new EstacaoMeteorologica(adaptador);

        System.out.println("--- Primeira Leitura ---");
        // 4. Usar o sistema principal, que agora deve funcionar com o sensor antigo através do adapter
        estacao.exibirTemperaturaAtual();

        System.out.println("\n--- Simulando Nova Leitura no Sensor Antigo ---");
        // 5. Simular uma mudança no sensor original
        sensorAntigo.simularNovaLeitura(); // O sensor interno do adapter será afetado se for o mesmo objeto

        // A EstacaoMeteorologica (e o adapter) devem pegar a nova leitura e convertê-la
        estacao.exibirTemperaturaAtual();

        System.out.println("\n--- Testando com outro sensor antigo (opcional) ---");
        MedidorFahrenheitAntigo outroSensorAntigo = new MedidorFahrenheitAntigo();
        SensorTemperatura outroAdaptador = new Adapter(outroSensorAntigo); // Novo adapter para novo sensor

        // Podemos mudar o sensor da estação em tempo de execução
        estacao.setSensor(outroAdaptador);
        estacao.exibirTemperaturaAtual();
    }
}