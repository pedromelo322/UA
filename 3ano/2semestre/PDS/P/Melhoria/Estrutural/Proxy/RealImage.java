package Proxy;

// O "RealSubject". É o objeto pesado que não queremos carregar desnecessariamente.
public class RealImage implements IImage {
    private String filename;

    public RealImage(String filename) {
        this.filename = filename;
        loadFromDisk();
    }

    // Operação dispendiosa
    private void loadFromDisk() {
        System.out.println("-> A carregar imagem '" + filename + "' do disco (operação LENTA)...");
        // Simula o tempo de carregamento
        try { Thread.sleep(2000); } catch (InterruptedException e) {}
    }

    @Override
    public void display() {
        System.out.println("A exibir imagem: " + filename);
    }
}