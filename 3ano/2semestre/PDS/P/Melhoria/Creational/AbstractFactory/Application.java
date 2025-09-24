package AbstractFactory;

// O cliente. Recebe uma fábrica e usa-a para criar a UI.
public class Application {
    private IButton button;
    private IWindow window;

    // A aplicação é configurada com uma fábrica específica
    public Application(GuiFactory factory) {
        this.button = factory.createButton();
        this.window = factory.createWindow();
    }

    // Renderiza a UI criada
    public void renderUI() {
        window.render();
        button.render();
    }
}