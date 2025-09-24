package Composite;

// A classe "Leaf". Representa um objeto individual na hierarquia.

// TODO: Parte 2
// Crie a classe 'Developer' que implementa a interface 'IEmployee'.
// 1. Deve ter atributos como 'name' e 'position'.
// 2. O seu construtor deve inicializar estes atributos.
// 3. O método 'showDetails()' deve imprimir os detalhes deste developer.

// ... sua classe Developer aqui ...

public class Developer implements IEmployee{

    private String name, position;

    public Developer(String name, String position){
        this.name = name;
        this.position = position;
    }

    @Override
    public void showDetails(){
        System.out.println("\tName: " + this.name + ", Position: " + this.position);
    }
}