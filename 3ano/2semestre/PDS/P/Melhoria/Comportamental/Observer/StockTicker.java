package Observer;

import java.util.ArrayList;
import java.util.List;

// O "Subject" (ou "Observable"). Mantém o estado e a lista de observadores.
public class StockTicker {

    // TODO: Parte 2
    // Crie uma lista para guardar todos os observadores (IInvestor) que se inscreveram.
    // Ex: private List<IInvestor> investors = new ArrayList<>();
    
    // ... sua lista aqui ...

    private List<IInvestor> investors = new ArrayList<>();

    private String stockSymbol;
    private double price;

    public StockTicker(String stockSymbol) {
        this.stockSymbol = stockSymbol;
    }

    // TODO: Parte 3
    // Crie o método 'registerInvestor(IInvestor investor)' para adicionar um observador à lista.

    // ... seu método registerInvestor aqui ...

    public void registerInvestor(IInvestor investor){
        investors.add(investor);
    }

    // TODO: Parte 4
    // Crie o método 'unregisterInvestor(IInvestor investor)' para remover um observador.
    
    // ... seu método unregisterInvestor aqui ...

    public void unregisterInvestor(IInvestor investor){
        investors.remove(investor);
    }


    // TODO: Parte 5
    // Crie o método 'notifyInvestors()' que será chamado quando o preço mudar.
    // Este método deve iterar pela lista de investidores e chamar o método 'update'
    // em cada um deles, passando o símbolo da ação e o novo preço.
    
    // ... seu método notifyInvestors aqui ...

    public void notifyInvestors(){
        for (IInvestor iInvestor : investors) {
            iInvestor.update(stockSymbol, price);
        }
    }


    // Este método simula a mudança de preço e aciona a notificação.
    public void setPrice(double newPrice) {
        System.out.println("\n==> O preço de " + stockSymbol + " mudou para " + newPrice + "€ <==");
        this.price = newPrice;
        // Notifica todos os observadores inscritos
        notifyInvestors();
    }
}