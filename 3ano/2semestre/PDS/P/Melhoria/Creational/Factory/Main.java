public class Main {
    public static void main(String[] args) {
        System.out.println("--- A processar um relatório ---");
        DocumentProcessor reportProcessor = new ReportProcessor();
        reportProcessor.processDocument();

        System.out.println("\n--- A processar uma carta ---");
        DocumentProcessor letterProcessor = new LetterProcessor();
        letterProcessor.processDocument();
    }
}