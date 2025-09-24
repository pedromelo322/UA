package Composite;

public class Main {
    public static void main(String[] args) {
        // Criar os empregados individuais (folhas)
        IEmployee dev1 = new Developer("João Silva", "Developer Frontend");
        IEmployee dev2 = new Developer("Maria Santos", "Developer Backend");
        IEmployee dev3 = new Developer("Pedro Costa", "Developer Fullstack");

        // Criar os gestores (compostos)
        Manager techLead = new Manager("Carlos Ferreira", "Tech Lead");
        Manager ceo = new Manager("Sofia Almeida", "CEO");

        // Construir a hierarquia
        // O Tech Lead lidera os developers
        techLead.add(dev1);
        techLead.add(dev2);

        // O CEO lidera o Tech Lead e outro developer diretamente
        ceo.add(techLead);
        ceo.add(dev3);

        // --- Testar a operação ---
        System.out.println("A mostrar detalhes de um Developer individual:");
        dev1.showDetails();

        System.out.println("\n----------------------------------\n");

        System.out.println("A mostrar detalhes da equipa do Tech Lead (um ramo da árvore):");
        techLead.showDetails();

        System.out.println("\n----------------------------------\n");
        
        System.out.println("A mostrar detalhes de toda a empresa a partir do CEO (a raiz da árvore):");
        ceo.showDetails();
    }
}