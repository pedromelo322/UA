package Mediator;

public class Main {
    public static void main(String[] args) {
        // 1. Criar o mediador
        IAirTrafficControl atc = new AirTrafficControlTower();

        // 2. Criar os colegas (aviões), associando-os ao mediador.
        // O registo é feito automaticamente no construtor.
        Aircraft flight1 = new CommercialAircraft(atc, "TAP123");
        Aircraft flight2 = new CommercialAircraft(atc, "RYR456");
        Aircraft flight3 = new CommercialAircraft(atc, "EZS789");

        // 3. Simular a comunicação
        System.out.println("--- Início da Simulação ---");
        
        // O voo 1 pede para aterrar. A torre deve notificar os outros.
        flight1.send("Pedido de autorização para aterrar na pista 3.");
        
        System.out.println("\n--- Nova Mensagem ---");
        
        // O voo 2 reporta turbulência. A torre notifica os outros.
        flight2.send("A encontrar turbulência a 30.000 pés.");
    }
}