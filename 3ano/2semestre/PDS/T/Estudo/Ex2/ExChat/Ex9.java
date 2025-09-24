// Cada classe tem agora uma única responsabilidade
public class UrlDataReader {
    public String readData(String url) { /* ... */ return "dados brutos"; }
}

public class JsonFormatter {
    public String format(String rawData) { /* ... */ return "{'data': ...}"; }
}

public class ApiClient {
    public void send(String jsonData, String endpoint) { /* ... */ }
}

// Uma classe orquestradora pode usar os componentes
public class DataPipelineService {
    public void run(String url, String endpoint) {
        UrlDataReader reader = new UrlDataReader();
        JsonFormatter formatter = new JsonFormatter();
        ApiClient client = new ApiClient();

        String rawData = reader.readData(url);
        String jsonData = formatter.format(rawData);
        client.send(jsonData, endpoint);
    }
}




/* 
 * A classe monolítica foi dividida em três classes menores, 
 * cada uma com High Cohesion, pois cada uma tem um único e bem definido propósito. 
 * Estas novas classes são mais fáceis de entender, testar, manter e reutilizar de forma independente.
*/