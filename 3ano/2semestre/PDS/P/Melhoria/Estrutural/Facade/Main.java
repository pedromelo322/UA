package Facade;

public class Main {
    public static void main(String[] args) {
        // 1. Criar as instâncias dos componentes do subsistema
        Projector projector = new Projector();
        SoundSystem soundSystem = new SoundSystem();
        BluRayPlayer bluRayPlayer = new BluRayPlayer();

        // 2. Criar a Façade, passando-lhe os componentes
        HomeTheaterFacade homeTheater = new HomeTheaterFacade(projector, soundSystem, bluRayPlayer);

        // 3. O cliente usa a interface simples da Façade
        homeTheater.watchMovie("Matrix");
        homeTheater.endMovie();
    }
}