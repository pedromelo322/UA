package Observer;

public class Main {
    public static void main(String[] args) {
        // 1. Criar o Subject
        StockTicker appleTicker = new StockTicker("AAPL");

        // 2. Criar os Observers
        IInvestor tradingApp1 = new TradingApp("App Corretora XPTO");
        IInvestor tradingApp2 = new TradingApp("App MobileInvest");
        IInvestor alertService = new AlertingService();

        // 3. Inscrever os observers no subject
        System.out.println("--- A inscrever investidores ---");
        appleTicker.registerInvestor(tradingApp1);
        appleTicker.registerInvestor(tradingApp2);
        appleTicker.registerInvestor(alertService);

        // 4. Simular mudanças de preço. Cada mudança deve notificar todos os observers.
        appleTicker.setPrice(145.50);
        appleTicker.setPrice(152.20); // Este preço deve acionar o alerta
        
        // 5. Um investidor cancela a inscrição
        System.out.println("\n--- App MobileInvest cancelou a inscrição ---");
        appleTicker.unregisterInvestor(tradingApp2);
        
        // 6. Nova mudança de preço. Agora, só os observers restantes devem ser notificados.
        appleTicker.setPrice(155.00);
    }
}
