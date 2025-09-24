package Composite;

import java.util.ArrayList;

// A classe "Composite". Representa um contentor que pode ter filhos.

// TODO: Parte 3
// Crie a classe 'Manager' que também implementa a interface 'IEmployee'.
// 1. Deve ter os mesmos atributos que um Developer ('name' e 'position').
// 2. Adicionalmente, deve ter uma lista para guardar os seus subordinados:
//    private List<IEmployee> subordinates = new ArrayList<>();
// 3. O seu construtor deve inicializar os seus próprios detalhes.
// 4. Crie métodos para 'add(IEmployee e)' e 'remove(IEmployee e)' subordinados.
// 5. Implemente o método 'showDetails()'. Esta é a parte crucial:
//    - Primeiro, deve imprimir os detalhes do próprio manager.
//    - Depois, deve iterar pela lista de subordinados e chamar o método
//      'showDetails()' em cada um deles, de forma recursiva.

// ... sua classe Manager aqui ...

public class Manager implements IEmployee{
    
    private String name, position;
    private ArrayList<IEmployee> subordinados = new ArrayList<>();

    public Manager(String name, String position){
        this.name = name;
        this.position = position;
    }


    public boolean add(IEmployee e){
        return subordinados.add(e);
    }


    public boolean remove(IEmployee e){
        return subordinados.remove(e);
    }

    public void showDetails(){
        System.out.println("Name: " + this.name + ", Position: " + this.position);
        for (IEmployee suboordinado : subordinados) {
            suboordinado.showDetails();
        }

    }
}