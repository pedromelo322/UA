package ChainOfResponsibility;

public class Main {
    public static void main(String[] args) {
        // 1. Criar os aprovadores (os elos da cadeia)
        Approver teamLeader = new TeamLeader();
        Approver manager = new DepartmentManager();
        Approver ceo = new CEO();

        // 2. Construir a cadeia de responsabilidade
        // TeamLeader -> DepartmentManager -> CEO
        teamLeader.setNext(manager);
        manager.setNext(ceo);
        
        System.out.println("--- Submetendo despesas ---");

        // Criar e processar várias despesas
        // O cliente só precisa de conhecer o primeiro elo da cadeia (teamLeader)
        teamLeader.approve(new Expense(50, "Material de escritório")); // Deve ser aprovado pelo TeamLeader
        System.out.println("-----------------------------");
        teamLeader.approve(new Expense(500, "Viagem de negócios")); // Deve ser passado ao Manager
        System.out.println("-----------------------------");
        teamLeader.approve(new Expense(5000, "Compra de novos servidores")); // Deve chegar ao CEO
        System.out.println("-----------------------------");
        teamLeader.approve(new Expense(25000, "Bónus anual do CEO")); // Também aprovado pelo CEO
    }
}