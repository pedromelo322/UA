public class Ingredient { /* ... */ }
public class Pizza {
    
    private Pizza() { this.toppings = new ArrayList<>(); } 
    
    private List<Ingredient> toppings;
    
    public void addTopping(Ingredient topping) { /* ... */ }

    public static Pizza CreateMargheritaPizza(){
        Pizza pizza = new Pizza();
        
        pizza.addTopping(new Ingredient("Tomate")); // O serviço adiciona os ingredientes
        pizza.addTopping(new Ingredient("Queijo"));
        pizza.addTopping(new Ingredient("Manjericão"));

        return pizza;

    }
    
}

public class OrderService {
    public Pizza createMargheritaPizza() {
        // O serviço de encomendas conhece os detalhes de como fazer uma pizza
        return Pizza.CreateMargheritaPizza();
    }
}


/*Ao usar um Factory Method estático, a classe Pizza torna-se o Creator e o Information Expert das suas próprias instâncias pré-definidas.
 A lógica de como construir uma "Margherita" está agora encapsulada na classe Pizza. A OrderService tem Low Coupling, 
 pois já não precisa de conhecer os detalhes dos ingredientes, e a coesão de ambas as classes aumenta. */