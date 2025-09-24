package AbstractFactory;

// A Fábrica Abstrata.
// Define uma interface para criar a família de produtos relacionados (componentes de UI).
public interface GuiFactory {

    // TODO: Parte 1
    // Defina os métodos fábrica para cada produto da família.
    // Precisamos de um método para criar um botão e outro para criar uma janela.
    // Lembre-se, estes métodos devem retornar o tipo da INTERFACE (IButton, IWindow).
    
    // ... seu código aqui ...

    public IButton createButton();
    public IWindow createWindow();
    
}