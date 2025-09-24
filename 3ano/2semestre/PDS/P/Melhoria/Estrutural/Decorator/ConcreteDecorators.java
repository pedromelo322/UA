package Decorator;

// TODO: Parte 3
// Crie a classe 'MilkDecorator' que herda de 'CoffeeDecorator'.
// 1. Crie um construtor que receba um ICoffee e o passe para o construtor da superclasse.
// 2. Faça override do método 'getCost()'. Ele deve retornar o custo do café decorado
//    MAIS o custo do leite (ex: 0.5).
// 3. Faça override do método 'getDescription()'. Ele deve retornar a descrição do café
//    decorado MAIS a descrição do extra (ex: ", com leite").

// ... sua classe MilkDecorator aqui ...

class MilkDecorator extends CoffeeDecorator{


    public MilkDecorator(ICoffee coffe){
        super(coffe);
    }

    @Override
    public double getCost(){
        return super.getCost() + 0.5;
    }


    @Override
    public String getDescription(){
        return super.getDescription() + ", com leite";
    }

}


// TODO: Parte 4 (Desafio extra)
// Faça o mesmo para as classes 'SugarDecorator' e 'ChocolateDecorator',
// com os seus próprios custos e descrições.
// Custo do açúcar: 0.2
// Custo do chocolate: 1.0

// ... suas classes SugarDecorator e ChocolateDecorator aqui ...


class SugarDecorator extends CoffeeDecorator{


    public SugarDecorator(ICoffee coffe){
        super(coffe);
    }

    @Override
    public double getCost(){
        return super.getCost() + 0.2;
    }


    @Override
    public String getDescription(){
        return super.getDescription() + ", com açucar";
    }

}


class ChocolateDecorator extends CoffeeDecorator{


    public ChocolateDecorator(ICoffee coffe){
        super(coffe);
    }

    @Override
    public double getCost(){
        return super.getCost() + 1;
    }


    @Override
    public String getDescription(){
        return super.getDescription() + ", com chocolate";
    }

}