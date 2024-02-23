package aula11;

public class Ex01 {
    public static void main(String[] args) {
        Manipulacao manipulacao = new Manipulacao("aula11/words.txt");
        Manipulacao.escreverFicheiro(manipulacao.toString());
    }
}
