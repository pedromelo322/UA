package AbstractFactory;

// TODO: Parte 2
// Crie a classe 'WindowsFactory' que implementa a interface 'GuiFactory'.
// Os seus métodos fábrica devem retornar instâncias dos componentes do Windows.

// ... sua classe WindowsFactory aqui ...

class WindowsFactory implements GuiFactory{


    public IButton createButton(){
        return new WindowsButton();
    }

    public IWindow createWindow(){
        return new WindowsWindow();
    }

}


// TODO: Parte 3
// Crie a classe 'MacFactory' que implementa a interface 'GuiFactory'.
// Os seus métodos fábrica devem retornar instâncias dos componentes do macOS.

// ... sua classe MacFactory aqui ...


class MacFactory implements GuiFactory{


    public IButton createButton(){
        return new MacButton();
    }

    public IWindow createWindow(){
        return new MacWindow();
    }

}