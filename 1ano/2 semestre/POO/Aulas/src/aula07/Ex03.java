package aula07;

import java.lang.Math;
import java.util.Arrays;
import java.util.Objects;


abstract class ObjetoMovel{

    double x, y;
    double distancia;


    public ObjetoMovel(double x, double y) {
        this.x = x;
        this.y = y;
        this.distancia = 0;
    }


    public double getX() {
        return this.x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return this.y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getDistancia() {
        return this.distancia;
    }

    public void setDistancia(double distancia) {
        this.distancia = distancia;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof ObjetoMovel)) {
            return false;
        }
        ObjetoMovel objetoMovel = (ObjetoMovel) o;
        return x == objetoMovel.x && y == objetoMovel.y && distancia == objetoMovel.distancia;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y, distancia);
    }

    @Override
    public String toString() {
        return "{" +
            " x='" + getX() + "'" +
            ", y='" + getY() + "'" +
            ", distancia='" + getDistancia() + "'" +
            "}";
    }


    void distanciaPercorrida(double newX, double newY){

        distancia += Math.sqrt(Math.pow((newX - this.x),2) + Math.pow((newY - this.y),2));       

    }

    void move(double newX, double newY){

        distanciaPercorrida(newX, newY);

        this.x = newX;
        this.y  = newY;

    }


}


enum TipoJogador{

    GuardaReder, Avancado, Defesa, Medio

}

class Robo extends ObjetoMovel{

    String id;
    TipoJogador tipoJogador;
    int numGolos;

    void marcarGolo(){

        this.numGolos += 1;

    }


    public Robo(double x, double y, String id, TipoJogador tipoJogador, int numGolos) {
        super(x,y);
        this.id = id;
        this.tipoJogador = tipoJogador;
        this.numGolos = numGolos;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public TipoJogador getTipoJogador() {
        return this.tipoJogador;
    }

    public void setTipoJogador(TipoJogador tipoJogador) {
        this.tipoJogador = tipoJogador;
    }

    public int getNumGolos() {
        return this.numGolos;
    }

    public void setNumGolos(int numGolos) {
        this.numGolos = numGolos;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Robo)) {
            return false;
        }
        Robo robo = (Robo) o;
        return Objects.equals(id, robo.id) && Objects.equals(tipoJogador, robo.tipoJogador) && numGolos == robo.numGolos;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, tipoJogador, numGolos);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", tipoJogador='" + getTipoJogador() + "'" +
            ", numGolos='" + getNumGolos() + "'" +
            "}";
    }
    


}

class  Bola extends ObjetoMovel{

    String cor;


    public Bola(double x, double y, String cor) {
        super(x,y);
        this.cor = cor;
    }

    public String getCor() {
        return this.cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public Bola cor(String cor) {
        setCor(cor);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Bola)) {
            return false;
        }
        Bola bola = (Bola) o;
        return Objects.equals(cor, bola.cor);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(cor);
    }

    @Override
    public String toString() {
        return "{" +
            " cor='" + getCor() + "'" +
            "}";
    }


}


class Equipa{


    String nome;
    String nomeResponsavel;
    int totalGolosMarcados;
    int totalGolosSofridos;
    Robo[] robos = new Robo[20];


    public Equipa(String nome, String nomeResponsavel, int totalGolosMarcados, int totalGolosSofridos, Robo[] robos) {
        this.nome = nome;
        this.nomeResponsavel = nomeResponsavel;
        this.totalGolosMarcados = totalGolosMarcados;
        this.totalGolosSofridos = totalGolosSofridos;
        this.robos = robos;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeResponsavel() {
        return this.nomeResponsavel;
    }

    public void setNomeResponsavel(String nomeResponsavel) {
        this.nomeResponsavel = nomeResponsavel;
    }

    public int getTotalGolosMarcados() {
        return this.totalGolosMarcados;
    }

    public void setTotalGolosMarcados(int totalGolosMarcados) {
        this.totalGolosMarcados = totalGolosMarcados;
    }

    public int getTotalGolosSofridos() {
        return this.totalGolosSofridos;
    }

    public void setTotalGolosSofridos(int totalGolosSofridos) {
        this.totalGolosSofridos = totalGolosSofridos;
    }

    public Robo[] getRobos() {
        return this.robos;
        
    }

    public void setRobos(Robo[] robos) {
        this.robos = robos;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Equipa)) {
            return false;
        }
        Equipa equipa = (Equipa) o;
        return Objects.equals(nome, equipa.nome) && Objects.equals(nomeResponsavel, equipa.nomeResponsavel) && totalGolosMarcados == equipa.totalGolosMarcados && totalGolosSofridos == equipa.totalGolosSofridos && Objects.equals(robos, equipa.robos);
    }

    @Override
    public int hashCode() {
        return Objects.hash(nome, nomeResponsavel, totalGolosMarcados, totalGolosSofridos, robos);
    }

    @Override
    public String toString() {
        return "{" +
            " nome='" + getNome() + "'" +
            ", nomeResponsavel='" + getNomeResponsavel() + "'" +
            ", totalGolosMarcados='" + getTotalGolosMarcados() + "'" +
            ", totalGolosSofridos='" + getTotalGolosSofridos() + "'" +
            ", robos='" + Arrays.toString(getRobos()) + "'" +
            "}";
    }



}


class jogo{

    Equipa A;
    Equipa B;
    Bola  bola;
    int duracao = 90; //tempo em segundos
    int tempodecorrido;


    public jogo(Equipa A, Equipa B, Bola bola, int duracao) {
        this.A = A;
        this.B = B;
        this.bola = bola;
        this.duracao = duracao;
    }

    public Equipa getA() {
        return this.A;
    }

    public void setA(Equipa A) {
        this.A = A;
    }

    public Equipa getB() {
        return this.B;
    }

    public void setB(Equipa B) {
        this.B = B;
    }

    public Bola getBola() {
        return this.bola;
    }

    public void setBola(Bola bola) {
        this.bola = bola;
    }

    public int getDuracao() {
        return this.duracao;
    }

    public void setDuracao(int duracao) {
        this.duracao = duracao;
    }

    public int getTempodecorrido() {
        return this.tempodecorrido;
    }

    public void setTempodecorrido(int tempodecorrido) {
        this.tempodecorrido = tempodecorrido;
    }


    public void atualizarTempoDecorrido(int tempoTranscorrido) {
        this.tempodecorrido += tempoTranscorrido;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof jogo)) {
            return false;
        }
        jogo jogo = (jogo) o;
        return Objects.equals(A, jogo.A) && Objects.equals(B, jogo.B) && Objects.equals(bola, jogo.bola) && duracao == jogo.duracao && tempodecorrido == jogo.tempodecorrido;
    }

    @Override
    public int hashCode() {
        return Objects.hash(A, B, bola, duracao, tempodecorrido);
    }

    @Override
    public String toString() {
        return "{" +
            " A='" + getA() + "'" +
            ", B='" + getB() + "'" +
            ", bola='" + getBola() + "'" +
            ", duracao='" + getDuracao() + "'" +
            ", tempodecorrido='" + getTempodecorrido() + "'" +
            "}";
    }

}


public class Ex03 {
    public static void main(String[] args) {
        // Create robots
        Robo robo1 = new Robo(0, 0, "R1", TipoJogador.Avancado, 0);
        Robo robo2 = new Robo(0, 0, "R2", TipoJogador.Medio, 0);
        Robo robo3 = new Robo(0, 0, "R3", TipoJogador.Defesa, 0);

        Robo robo4 = new Robo(0, 0, "R4", TipoJogador.Avancado, 0);
        Robo robo5 = new Robo(0, 0, "R5", TipoJogador.Medio, 0);
        Robo robo6 = new Robo(0, 0, "R6", TipoJogador.Defesa, 0);

        // Create teams
        Robo[] team1Robos = {robo1, robo2, robo3};
        Equipa team1 = new Equipa("Team 1", "Manager 1", 0, 0, team1Robos);

        Robo[] team2Robos = {robo4, robo5, robo6};
        Equipa team2 = new Equipa("Team 2", "Manager 2", 0, 0, team2Robos);

        // Create ball
        Bola ball = new Bola(0, 0, "Red");

        // Create game
        jogo game = new jogo(team1, team2, ball, 90);

        // Simulate movements and goals
        moveRobo(robo1, 10, 20);
        moveRobo(robo2, 15, 25);
        moveRobo(robo3, 5, 30);

        moveRobo(robo4, 50, 60);
        moveRobo(robo5, 55, 65);
        moveRobo(robo6, 45, 70);

        // Simulate goal scoring
        scoreGoal(robo1, game);
        scoreGoal(robo4, game);
        scoreGoal(robo2, game);

        // Print game information
        System.out.println(game);
    }

    public static void moveRobo(Robo robo, double newX, double newY) {
        System.out.println("Moving Robo " + robo.getId() + " to (" + newX + ", " + newY + ")");
        robo.move(newX, newY);
    }

    public static void scoreGoal(Robo robo, jogo game) {
        System.out.println("Robo " + robo.getId() + " scored a goal!");
        robo.marcarGolo();
        if (game.getA().getRobos()[0].equals(robo) || game.getA().getRobos()[1].equals(robo) || game.getA().getRobos()[2].equals(robo)) {
            game.getA().setTotalGolosMarcados(game.getA().getTotalGolosMarcados() + 1);
            game.getB().setTotalGolosSofridos(game.getB().getTotalGolosSofridos() + 1);
        } else if (game.getB().getRobos()[0].equals(robo) || game.getB().getRobos()[1].equals(robo) || game.getB().getRobos()[2].equals(robo)) {
            game.getB().setTotalGolosMarcados(game.getB().getTotalGolosMarcados() + 1);
            game.getA().setTotalGolosSofridos(game.getA().getTotalGolosSofridos() + 1);
        }
    }
}
