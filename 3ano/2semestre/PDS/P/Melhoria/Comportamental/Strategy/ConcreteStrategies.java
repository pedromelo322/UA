package Strategy;

// TODO: Parte 2
// Crie a classe 'CttShippingStrategy' que implementa 'IShippingStrategy'.
// O seu método 'calculate' deve simplesmente retornar um custo fixo (ex: 5.0).

// ... sua classe CttShippingStrategy aqui ...

class CttShippingStrategy implements IShippingStrategy{
    
    public double calculate(Order order){
        return 5.0;
    }

}

// TODO: Parte 3
// Crie a classe 'DhlShippingStrategy' que implementa 'IShippingStrategy'.
// O seu método 'calculate' deve calcular o custo com base no peso da encomenda
// (obtido do objeto Order) multiplicado por uma taxa (ex: 2.0 por kg).

// ... sua classe DhlShippingStrategy aqui ...

class DhlShippingStrategy implements IShippingStrategy{

    public double calculate(Order order){
        return 2*order.getTotalWeightInKg();
    }

}


// TODO: Parte 4 (Desafio extra)
// Crie a classe 'InStorePickupStrategy' que implementa 'IShippingStrategy'.
// O seu método 'calculate' deve retornar 0.0.

// ... sua classe InStorePickupStrategy aqui ...


class InStorePickupStrategy implements IShippingStrategy{

    

    public double calculate(Order order){
        return 0.0;
    }




}