package Facade;

// Componente 1 do subsistema
class Projector {
    public void on() { System.out.println("Projetor ligado."); }
    public void off() { System.out.println("Projetor desligado."); }
}

// Componente 2 do subsistema
class SoundSystem {
    public void on() { System.out.println("Sistema de som ligado."); }
    public void off() { System.out.println("Sistema de som desligado."); }
    public void setVolume(int level) { System.out.println("Volume definido para " + level + "."); }
}

// Componente 3 do subsistema
class BluRayPlayer {
    public void on() { System.out.println("Leitor de Blu-ray ligado."); }
    public void off() { System.out.println("Leitor de Blu-ray desligado."); }
    public void play(String movie) { System.out.println("A reproduzir o filme: \"" + movie + "\""); }
}