public class Customer {
    public boolean hasGoodCredit() { /* ... verifica o estado de crédito ... */ return true; }
}
public class Invoice {
    private Customer customer;
    public void send() { System.out.println("A enviar fatura..."); }
    public boolean canBeSent() {
        // ... outro processamento ...

        // Sistema de contabilidade toma a decisão, acoplando-se a Customer
        if (customer.hasGoodCredit()) {
            return true;
        } else {
            return false;
        }
    }
}

public class AccountingSystem {
    public void processAndSendInvoice(Invoice invoice) {
        // ... outro processamento ...

        // Sistema de contabilidade toma a decisão, acoplando-se a Customer
        if (invoice.canBeSent()) {
            invoice.send();
        } else {
            System.out.println("Não foi possível enviar a fatura. Mau crédito.");
        }
    }
}


/*A responsabilidade de decidir se a fatura pode ser enviada foi movida para a classe Invoice,
que se torna o Information Expert para esta operação.
A AccountingSystem agora tem Low Coupling, pois já não precisa de conhecer a classe Customer para realizar esta tarefa.
Apenas interage com a Invoice, delegando-lhe a decisão. */