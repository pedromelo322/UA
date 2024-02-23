package aula10;



public class Ex01 {
    public static void main(String[] args) {
        // Criando a instância da classe GenerosLiterarios
        GenerosLiterarios biblioteca = new GenerosLiterarios();

        // Adicionando livros à biblioteca
        Book book1 = new Book("Livro 1", "Autor 1", 2000);
        biblioteca.addBook("Gênero 1", book1);

        Book book2 = new Book("Livro 2", "Autor 2", 2005);
        biblioteca.addBook("Gênero 2", book2);

        Book book3 = new Book("Livro 3", "Autor 3", 2010);
        biblioteca.addBook("Gênero 3", book3);

        Book book4 = new Book("Livro 4", "Autor 4", 2015);
        biblioteca.addBook("Gênero 4", book4);

        Book book5 = new Book("Livro 5", "Autor 5", 2020);
        biblioteca.addBook("Gênero 1", book5);

        // Imprimindo a estrutura completa
        System.out.println(biblioteca);

        // Alterando um livro existente
        Book novoLivro = new Book("Livro Modificado", "Autor Modificado", 2021);
        biblioteca.alterar("Gênero 3", book3, novoLivro);

        // Removendo um livro existente
        biblioteca.removeBook(book2);

        // Imprimindo a estrutura atualizada
        System.out.println(biblioteca);

        // Imprimindo apenas os gêneros
        System.out.println("Apenas os gêneros:");
        for (String genero : biblioteca.getGeneros()) {
            System.out.println(genero);
        }

        // Imprimindo apenas os livros
        System.out.println("Apenas os livros:");
        for (Book livro : biblioteca.getLivros()) {
            System.out.println(livro);
        }
    }
}


