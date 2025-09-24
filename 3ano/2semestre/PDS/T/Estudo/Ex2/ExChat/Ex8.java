// Classe externa, não pode ser alterada
public class ExternalWeatherAPI { /* ... */ }
class ProprietaryWeatherData { /* ... */ }

// 1. Criar uma interface estável (o contrato)
public interface IWeatherService {
    WeatherData getWeather(String city); // Usa um formato de dados limpo e nosso
}

// 2. Criar uma classe de dados simples e nossa
public class WeatherData { /* ... */ }

// 3. Criar o Adapter (a camada de Indireção)
public class ExternalWeatherAPIAdapter implements IWeatherService {
    @Override
    public WeatherData getWeather(String city) {
        ExternalWeatherAPI externalAPI = new ExternalWeatherAPI();
        // Lógica de chamar a API externa
        ProprietaryWeatherData rawData = externalAPI.fetchWeatherData(city);
        // Lógica de traduzir os dados proprietários para o nosso formato limpo
        WeatherData cleanData = new WeatherData(/* ... */);
        return cleanData;
    }
}

// 4. A classe de negócio agora depende da interface estável
public class WeatherReport {
    private IWeatherService weatherService;
    public WeatherReport(IWeatherService service) { this.weatherService = service; }

    public void generateReport(String city) {
        WeatherData data = weatherService.getWeather(city); // Desacoplado!
        // ... lógica para gerar relatório com base nos dados limpos ...
        System.out.println("Relatório gerado para " + city);
    }
}




/*
 Foi introduzida uma camada de Indirection (o ExternalWeatherAPIAdapter) que implementa uma interface estável (IWeatherService). 
 A WeatherReport está agora protegida das variações da API externa (Protected Variations), 
 pois depende apenas da interface. Se a API externa mudar, apenas o Adapter precisa de ser atualizado.
 */

 //Não percebi