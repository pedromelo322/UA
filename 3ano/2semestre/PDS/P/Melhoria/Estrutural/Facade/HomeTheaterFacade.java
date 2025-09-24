package Facade;

// A "Façade". Fornece uma interface simples para o subsistema complexo.
public class HomeTheaterFacade {

    // TODO: Parte 1
    // A Façade precisa de conhecer e ter referências a todos os componentes do subsistema.
    // Crie atributos privados para Projector, SoundSystem e BluRayPlayer.
    
    // ... seus atributos aqui ...

    private Projector projector;
    private SoundSystem soundSystem;
    private BluRayPlayer bluRayPlayer;


    // TODO: Parte 2
    // Crie um construtor que receba as instâncias de todos os componentes
    // do subsistema e as guarde nos atributos. (Isto é injeção de dependência).
    
    // ... seu construtor aqui ...

    public HomeTheaterFacade(Projector projector, SoundSystem soundSystem, BluRayPlayer bluRayPlayer){
        this.projector = projector;
        this.soundSystem = soundSystem;
        this.bluRayPlayer = bluRayPlayer;
    }


    // TODO: Parte 3
    // Crie o método de alto nível 'watchMovie(String movie)'.
    // Este método deve orquestrar os componentes do subsistema na ordem correta
    // para iniciar a visualização de um filme.
    // Sequência: ligar projetor, ligar som, definir volume, ligar blu-ray, reproduzir filme.
    public void watchMovie(String movie) {
        System.out.println("A preparar para ver um filme...");
        
        // ... seu código de orquestração aqui ...
        projector.on();
        soundSystem.on();
        soundSystem.setVolume(11);
        bluRayPlayer.on();
        bluRayPlayer.play(movie);

        
    }


    // TODO: Parte 4 (Desafio extra)
    // Crie o método de alto nível 'endMovie()'.
    // Este método deve desligar todos os aparelhos na ordem inversa.
    public void endMovie() {
        System.out.println("\nA desligar o home theater...");
        
        // ... seu código de orquestração aqui ...

        bluRayPlayer.off();
        soundSystem.off();
        projector.off();

        
        System.out.println("Home theater desligado.");
    }
}