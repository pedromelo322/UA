// A interface do Produto que todos os documentos concretos devem implementar.
public interface Document {
    void open();
    void process();
    void save();
}