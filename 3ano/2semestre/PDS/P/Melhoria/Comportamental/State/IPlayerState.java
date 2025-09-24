package State;

// A interface "State".
public interface IPlayerState {
    
    // TODO: Parte 2
    // Defina os métodos para cada ação possível. Cada método deve receber
    // o contexto (o MusicPlayer) como parâmetro, para que possa mudar o estado do leitor.
    // Ex: void onPlay(MusicPlayer player);
    
    void onPlay(MusicPlayer player);
    void onPause(MusicPlayer player);
    void onStop(MusicPlayer player);
}