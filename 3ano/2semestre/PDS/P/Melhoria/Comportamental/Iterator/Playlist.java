package Iterator;

import java.util.ArrayList;
import java.util.List;

// A classe "Aggregate" ou "Collection".
public class Playlist {
    // IMPORTANTE: A estrutura interna é PRIVADA e não deve ser exposta.
    private final List<Song> songs = new ArrayList<>();

    public void addSong(Song song) {
        this.songs.add(song);
    }
    
    // TODO: Parte 2
    // Crie um método público que retorna uma instância de um iterador para esta playlist.
    // Ex: public IPlaylistIterator createIterator();
    // Este método deve retornar uma nova instância da classe interna do iterador (ver abaixo).
    
    // ... seu método createIterator() aqui ...

    public IPlaylistIterator createIterator(){

        return new PlaylistIteratorImpl();

    }


    // TODO: Parte 3
    // Crie uma CLASSE INTERNA PRIVADA que implemente a interface IPlaylistIterator.
    // Esta classe interna terá acesso direto à lista 'songs' da classe Playlist.
    // 1. A classe precisa de um atributo para manter o controlo da posição atual (ex: 'private int position = 0;').
    // 2. Implemente o método 'hasNext()': ele deve retornar 'true' se a posição atual
    //    for menor que o tamanho da lista de músicas.
    // 3. Implemente o método 'getNext()': ele deve obter a música na posição atual,
    //    incrementar a posição e depois retornar a música.
    private class PlaylistIteratorImpl implements IPlaylistIterator {
        // ... sua implementação da classe interna aqui ...
        private int position = 0;

        public boolean hasNext(){
            if (position < songs.size()){
                return true;
            }

            return false;
        }

        public Song getNext(){
            return songs.get(position++);
        }
    }
}