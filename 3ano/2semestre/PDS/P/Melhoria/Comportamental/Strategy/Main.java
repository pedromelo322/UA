package Strategy;

public class Main {
    public static void main(String[] args) {
        // 1. Criar uma encomenda
        Order myOrder = new Order(2.5); // Encomenda com 2.5 kg

        // 2. Criar o calculador (o contexto)
        ShippingCalculator calculator = new ShippingCalculator();

        System.out.println("--- A calcular portes para uma encomenda de " + myOrder.getTotalWeightInKg() + " kg ---");
        
        // 3. Calcular usando a estratégia CTT
        calculator.setStrategy(new CttShippingStrategy());
        double cttCost = calculator.calculateShippingCost(myOrder);
        System.out.println("Custo de envio por CTT: " + cttCost + "€");

        // 4. Calcular usando a estratégia DHL
        calculator.setStrategy(new DhlShippingStrategy());
        double dhlCost = calculator.calculateShippingCost(myOrder);
        System.out.println("Custo de envio por DHL: " + dhlCost + "€");
        
        // 5. Calcular para recolha em loja
        calculator.setStrategy(new InStorePickupStrategy());
        double pickupCost = calculator.calculateShippingCost(myOrder);
        System.out.println("Custo para Recolha em Loja: " + pickupCost + "€");
    }
}