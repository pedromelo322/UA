package ChainOfResponsibility;

// O "Handler" base. Define a interface para tratar pedidos
// e mantém uma referência para o próximo handler na cadeia.
public abstract class Approver {
    
    // TODO: Parte 1
    // Crie um atributo protegido para guardar a referência ao próximo aprovador na cadeia.
    // O nome convencional é 'successor' ou 'nextApprover'.
    
    
    // ... seu atributo aqui ...

    protected Approver nextApprover;


    // TODO: Parte 2
    // Crie um método público para definir o próximo aprovador na cadeia.
    // Ex: public void setNext(Approver next) { ... }
    
    // ... seu método aqui ...

    public void setNext(Approver next) {this.nextApprover = next;}
    
    
    // TODO: Parte 3
    // Defina o método abstrato que todas as subclasses deverão implementar.
    // Este método recebe o pedido (a despesa) a ser processado.
    // Ex: public abstract void approve(Expense expense);

    // ... seu método abstrato aqui ...

    public abstract void approve(Expense expense);
}