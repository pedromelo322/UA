package aula10;



public class Ex04 {
    public static void main(String[] args){

        Palavras palavras = new Palavras("aula10/words.txt");
        System.out.println(palavras.toString());
        System.out.println(palavras.palavrasAcabadasS());
        palavras.removerNaoLetras();
        System.out.println(palavras.toString());

    }
}
