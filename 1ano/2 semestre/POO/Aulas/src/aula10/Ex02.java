package aula10;

import java.util.Set;




public class Ex02 {
    public static void main(String[] args) {
        // Criando a instância da classe GenerosLiterarios
        GenerosLiterarios2 biblioteca = new GenerosLiterarios2();

        // Adicionando 20 livros à biblioteca com repetição de gêneros
        for (int i = 1; i <= 20; i++) {
            String genero = "Gênero " + (i % 5 + 1);
            Book book = new Book("Livro " + i, "Autor " + i, 2000 + i);
            biblioteca.addBook(genero, book);
        }

        // Imprimindo a estrutura completa
        System.out.println(biblioteca);

        // Removendo um livro
        Book livroRemover = new Book("Livro 3", "Autor 3", 2003);
        biblioteca.removeBook(livroRemover);

        // Alterando um livro
        Book livroAntigo = new Book("Livro 5", "Autor 5", 2005);
        Book livroNovo = new Book("Livro Novo", "Autor Novo", 2022);
        biblioteca.alterar(livroAntigo, livroNovo);

        // Imprimindo a estrutura após a remoção e alteração
        System.out.println(biblioteca);

        // Imprimindo apenas os gêneros
        System.out.println("Apenas os gêneros:");
        for (String genero : biblioteca.getGeneros()) {
            System.out.println(genero);
        }

        // Imprimindo apenas os livros
        System.out.println("Apenas os livros:");
        for (Set<Book> livros : biblioteca.getLivros()) {
            for (Book livro : livros) {
                System.out.println(livro);
            }
        }
    }
}


