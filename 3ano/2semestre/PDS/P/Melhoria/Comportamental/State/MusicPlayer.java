package State;

// O "Contexto". Mantém uma instância de um estado concreto que define o comportamento atual.
public class MusicPlayer {
    
    // TODO: Parte 1
    // Crie um atributo para guardar o estado atual do leitor.
    // Ex: private IPlayerState currentState;
    
    // ... seu atributo aqui ...

    private IPlayerState currentState;

    public MusicPlayer() {
        // O estado inicial é "Parado"
        this.currentState = new StoppedState();
        System.out.println("Leitor de música iniciado. Estado inicial: Parado");
    }

    // Este método permite que os objetos de estado mudem o estado do leitor.
    public void setState(IPlayerState state) {
        this.currentState = state;
        System.out.println("O leitor está agora em " + state.toString());
    }
    
    // As ações do utilizador são delegadas para o objeto de estado atual.
    public void pressPlay() {
        currentState.onPlay(this);
    }

    public void pressPause() {
        currentState.onPause(this);
    }
    
    public void pressStop() {
        currentState.onStop(this);
    }
}