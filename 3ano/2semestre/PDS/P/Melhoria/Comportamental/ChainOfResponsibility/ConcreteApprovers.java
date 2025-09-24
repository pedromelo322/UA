package ChainOfResponsibility;

// TODO: Parte 4
// Crie a classe 'TeamLeader' que herda de 'Approver'.
// 1. Deve ter um atributo para o limite de aprovação (ex: private final double approvalLimit = 100.0;).
// 2. Implemente o método 'approve(Expense expense)'. A sua lógica deve ser:
//    a. Se o valor da despesa for MENOR ou IGUAL ao seu limite, aprove-a
//       (imprima uma mensagem) e o processo termina.
//    b. Se o valor for MAIOR e existir um sucessor (nextApprover != null),
//       passe a despesa para o próximo na cadeia.
//    c. Se não conseguir aprovar e não houver sucessor, pode imprimir uma mensagem de rejeição.

// ... sua classe TeamLeader aqui ...


class TeamLeader extends Approver{
    private final double approvalLimit = 100.0;


    public void approve(Expense expense){
        if (expense.getAmount() <= approvalLimit){
            System.out.println("Team Leader aprovou a despesa: " + expense);
        }else{
            super.nextApprover.approve(expense);
        }
    }


}


// TODO: Parte 5
// Crie as classes 'DepartmentManager' (limite 1000€) e 'CEO' (sem limite).
// Siga a mesma lógica da classe TeamLeader. O CEO, como pode aprovar tudo,
// nunca precisará de passar o pedido ao seu sucessor.

// ... suas classes DepartmentManager e CEO aqui ...


class DepartmentManager extends Approver{
    private final double approvalLimit = 1000.0;


    public void approve(Expense expense){
        if (expense.getAmount() <= approvalLimit){
            System.out.println("Department Manager aprovou a despesa: " + expense);
        }else{
            super.nextApprover.approve(expense);
        }
    }


}



class CEO extends Approver{


    public void approve(Expense expense){
        System.out.println("CEO aprovou a despesa: " + expense);
    }


}