package Observer;

// Um "ConcreteObserver".
class TradingApp implements IInvestor {
    private String appName;
    public TradingApp(String name) { this.appName = name; }

    @Override
    public void update(String stockSymbol, double newPrice) {
        System.out.println("[" + appName + "] Recebida atualização para " + stockSymbol + ": Novo preço é " + newPrice + "€");
    }
}

// Outro "ConcreteObserver".
class AlertingService implements IInvestor {
    @Override
    public void update(String stockSymbol, double newPrice) {
        System.out.println("[Serviço de Alerta] A verificar o preço de " + stockSymbol + "...");
        if (newPrice > 150.0) {
            System.out.println("[Serviço de Alerta] ALERTA! " + stockSymbol + " ultrapassou os 150€!");
        }
    }
}