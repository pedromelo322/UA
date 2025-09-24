package State;

public class Main {
    public static void main(String[] args) {
        MusicPlayer player = new MusicPlayer();

        System.out.println("\n--- Simulação de Uso ---");

        // 1. Tentar pausar quando está parado (não deve fazer nada)
        player.pressPause();

        // 2. Tocar a partir do estado parado
        player.pressPlay();

        // 3. Pausar enquanto está a tocar
        player.pressPause();
        
        // 4. Tocar novamente a partir da pausa
        player.pressPlay();
        
        // 5. Tentar tocar novamente enquanto já está a tocar (não deve fazer nada)
        player.pressPlay();

        // 6. Parar
        player.pressStop();
    }
}