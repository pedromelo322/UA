package Decorator;

// O "Decorator" base. Implementa a mesma interface que os objetos que decora.
// Contém uma referência ao objeto que está a "embrulhar".

// TODO: Parte 2
// Crie a classe abstrata 'CoffeeDecorator' que implementa 'ICoffee'.
// 1. Deve ter um atributo protegido do tipo ICoffee para guardar a referência
//    ao café que está a ser decorado. Ex: protected ICoffee decoratedCoffee;
// 2. Crie um construtor que receba um ICoffee e o guarde nesse atributo.
// 3. Implemente os métodos 'getCost()' e 'getDescription()'. Estes métodos devem
//    simplesmente delegar a chamada para o objeto 'decoratedCoffee'.
//    Ex: public double getCost() { return decoratedCoffee.getCost(); }

// ... sua classe abstrata CoffeeDecorator aqui ...


public abstract class CoffeeDecorator implements ICoffee{

    protected ICoffee decoratedCoffe;

    public CoffeeDecorator(ICoffee decoraredCoffee){
        this.decoratedCoffe = decoraredCoffee;
    }


    public double getCost(){
        return this.decoratedCoffe.getCost();
    }


    public String getDescription(){
        return this.decoratedCoffe.getDescription();
    }

}