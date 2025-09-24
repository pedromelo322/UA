public class Address { 
    public String getPostalCode() { return "1234-567"; } 
}
public class Office { 
    private Address address; 
    public Address getPostalCode() { return address.getPostalCode(); } 
}
public class Manager { 
    private Office office; 
    public Office getOfficePostalCode() { return office.getPostalCode(); } 
}
public class Department { 
    private Manager manager; 
    public Manager getManagerPostalCode() { return manager.getOfficePostalCode(); } 
}

public class Company {
    public void printManagerPostalCode(Department dept) {
        // Violação: "falar com estranhos"
        String postalCode = dept.getManagerPostalCode();
        System.out.println("Código Postal do Gestor: " + postalCode);
    }
}


/*A solução aplica o princípio de delegação. Em vez de "ir buscar" os dados,
 a classe Company "pede" a informação de que precisa (dept.getManagerPostalCode()).
  Cada classe na hierarquia expõe apenas o que é necessário, escondendo a sua estrutura interna.
   Isto reduz drasticamente o acoplamento (Low Coupling), pois Company agora só depende de Department,
    e o sistema fica muito mais resiliente a alterações. */