// Uma implementação concreta de Document.
class ReportDocument implements Document {
    @Override
    public void open() {
        System.out.println("A abrir Relatório: a carregar dados e template...");
    }

    @Override
    public void process() {
        System.out.println("A processar Relatório: a gerar gráficos e tabelas...");
    }

    @Override
    public void save() {
        System.out.println("A guardar Relatório: a exportar para PDF...");
    }
}

// Outra implementação concreta de Document.
class LetterDocument implements Document {
    @Override
    public void open() {
        System.out.println("A abrir Carta: a verificar destinatário...");
    }

    @Override
    public void process() {
        System.out.println("A processar Carta: a aplicar formatação de texto...");
    }

    @Override
    public void save() {
        System.out.println("A guardar Carta: a enviar para a impressora...");
    }
}