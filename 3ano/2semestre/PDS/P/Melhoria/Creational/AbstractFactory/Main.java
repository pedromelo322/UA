package AbstractFactory;

public class Main {

    // Simula a configuração da aplicação com base no SO
    private static Application configureApplication() {
        // Simula a deteção do sistema operativo
        String osName = System.getProperty("os.name").toLowerCase();
        GuiFactory factory;

        if (osName.contains("mac")) {
            System.out.println("Sistema Operativo detetado: macOS. A criar UI nativa.");
            factory = new MacFactory();
        } else {
            // Assume Windows como padrão
            System.out.println("Sistema Operativo detetado: Windows. A criar UI nativa.");
            factory = new WindowsFactory();
        }

        return new Application(factory);
    }

    public static void main(String[] args) {
        Application app = configureApplication();
        app.renderUI();
    }
}