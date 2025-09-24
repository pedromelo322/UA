public class Main {
    public static void main(String[] args) {
        Employee e = Employee.instance().name("Henrique").department(3).build();
    }
}

public class Employee {

    // Atributos finais do objeto a ser construído
    private final String name;
    private final int department;

    // 1. O construtor da classe principal é privado e recebe o Builder
    private Employee(Builder builder) {
        this.name = builder.name;
        this.department = builder.department;
    }

    // 2. Método estático que inicia o processo, devolvendo uma nova instância do Builder
    public static Builder instance() {
        return new Builder();
    }

    // 3. Classe interna estática (o Builder) que acumula os dados
    public static class Builder {

        // Atributos que serão configurados passo a passo
        private String name;
        private int department;

        // Construtor do Builder pode ser privado para forçar o uso de Employee.instance()
        private Builder() {}

        // 4. Métodos "fluentes" que definem os atributos e retornam "this" para encadear chamadas
        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder department(int department) {
            this.department = department;
            return this;
        }

        // 5. Método "build" que finaliza o processo e cria a instância de Employee
        public Employee build() {
            // Validações podem ser adicionadas aqui antes de criar o objeto
            return new Employee(this);
        }
    }

    // (Opcional) Método toString para facilitar a visualização do objeto criado
    @Override
    public String toString() {
        return "Employee [name=" + name + ", department=" + department + "]";
    }
}