package AbstractFactory;

// --- Componentes para Windows ---
class WindowsButton implements IButton {
    @Override
    public void render() { System.out.println("A renderizar um botão estilo Windows."); }
}
class WindowsWindow implements IWindow {
    @Override
    public void render() { System.out.println("A renderizar uma janela estilo Windows."); }
}

// --- Componentes para macOS ---
class MacButton implements IButton {
    @Override
    public void render() { System.out.println("A renderizar um botão estilo macOS."); }
}
class MacWindow implements IWindow {
    @Override
    public void render() { System.out.println("A renderizar uma janela estilo macOS."); }
}