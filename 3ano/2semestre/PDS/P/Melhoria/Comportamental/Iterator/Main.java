package Iterator;

public class Main {
    public static void main(String[] args) {
        // 1. Criar a playlist e adicionar músicas
        Playlist myPlaylist = new Playlist();
        myPlaylist.addSong(new Song("Bohemian Rhapsody", "Queen"));
        myPlaylist.addSong(new Song("Stairway to Heaven", "Led Zeppelin"));
        myPlaylist.addSong(new Song("Smells Like Teen Spirit", "Nirvana"));

        // 2. O cliente pede um iterador à playlist
        IPlaylistIterator iterator = myPlaylist.createIterator();
        
        System.out.println("--- A percorrer a playlist ---");

        // 3. O cliente usa os métodos do iterador para percorrer a coleção
        while (iterator.hasNext()) {
            Song currentSong = iterator.getNext();
            System.out.println("A tocar agora: " + currentSong);
        }

        // Se tentarmos percorrer novamente com o mesmo iterador, não deve funcionar,
        // pois ele já chegou ao fim. Para percorrer de novo, teríamos de criar
        // um novo iterador: iterator = myPlaylist.createIterator();
        System.out.println("\nTentando percorrer novamente com o mesmo iterador...");
        if (!iterator.hasNext()) {
            System.out.println("Como esperado, o iterador já chegou ao fim.");
        }
    }
}