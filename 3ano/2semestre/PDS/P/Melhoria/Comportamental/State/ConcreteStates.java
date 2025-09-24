package State;

// TODO: Parte 3
// Crie a classe 'PlayingState' que implementa 'IPlayerState'.
// Implemente a lógica para cada ação QUANDO o leitor já está a tocar:
// - onPlay: Não faz nada (ou imprime "Já está a tocar").
// - onPause: Muda o estado do leitor para 'PausedState' e imprime uma mensagem.
// - onStop: Muda o estado do leitor para 'StoppedState' e imprime uma mensagem.

// ... sua classe PlayingState aqui ...

class PlayingState implements IPlayerState{

    @Override
    public void onPlay(MusicPlayer musicPlayer){
        System.out.println("Ação 'Tocar' não tem efeito.");
    }

    @Override
    public void onPause(MusicPlayer musicPlayer){
        System.out.println("A pausar a música...");
        musicPlayer.setState(new PausedState());
    }

    @Override
    public void onStop(MusicPlayer musicPlayer){
        System.out.println("A parar a música...");
        musicPlayer.setState(new StoppedState());
    }

    @Override
    public String toString(){
        return "A TOCAR";
    }

}


// TODO: Parte 4
// Faça o mesmo para as classes 'PausedState' e 'StoppedState'.
// - StoppedState -> onPlay: muda para PlayingState. onPause/onStop: não fazem nada.
// - PausedState  -> onPlay: muda para PlayingState. onStop: muda para StoppedState. onPause: não faz nada.

// ... suas classes PausedState e StoppedState aqui ...


class StoppedState implements IPlayerState{

    @Override
    public void onPlay(MusicPlayer musicPlayer){
        System.out.println("A iniciar a reprodução...");
        musicPlayer.setState(new PlayingState());
    }

    @Override
    public void onPause(MusicPlayer musicPlayer){
        System.out.println("Ação 'Pausa' não tem efeito.");
    }

    @Override
    public void onStop(MusicPlayer musicPlayer){
        System.out.println("Ação 'Parar' não tem efeito.");
    }


    @Override
    public String toString(){
        return "PARADO";
    }
}



class PausedState implements IPlayerState{

    @Override
    public void onPlay(MusicPlayer musicPlayer){
        System.out.println("A retomar a reprodução...");
        musicPlayer.setState(new PlayingState());
    }

    @Override
    public void onPause(MusicPlayer musicPlayer){
        System.out.println("Ação 'Pausa' não tem efeito.");
    }

    @Override
    public void onStop(MusicPlayer musicPlayer){
        System.out.println("A parar a música...");
        musicPlayer.setState(new StoppedState());
    }

    @Override
    public String toString(){
        return "EM PAUSA";
    }

}