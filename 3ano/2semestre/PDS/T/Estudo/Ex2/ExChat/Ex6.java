public class User {
    private String username;
    private String email;

    // ... getters, setters e lógica de negócio ...
    public boolean hasValidEmail() {
        return email != null && email.contains("@");
    }
    
}



public class Storage {

    // Responsabilidade que não pertence ao domínio
    public void save(User user) {
        // Código SQL complexo para inserir ou atualizar o utilizador na BD
        // Ex: Connection conn = ...; PreparedStatement stmt = ...;
        System.out.println("A guardar " + user.getName() + " na base de dados...");
    }

}


/*Foi criada a classe UserRepository, uma Pure Fabrication, para encapsular toda a lógica de persistência.
 A classe User agora tem High Cohesion, pois foca-se apenas nas regras de negócio que lhe dizem respeito.
  A classe UserRepository também tem alta coesão, focando-se apenas no acesso a dados.
   Esta separação de responsabilidades melhora a manutenibilidade, a testabilidade e o Low Coupling do sistema.*/