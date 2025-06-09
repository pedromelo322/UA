package Behavioral.Iterator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException; // Import para exceção no Iterator

// --- Classe Livro (Componente dos dados) ---
class Livro {
    private String titulo;
    private String autor;

    public Livro(String titulo, String autor) {
        this.titulo = titulo;
        this.autor = autor;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    @Override
    public String toString() {
        return "Livro{titulo='" + titulo + "', autor='" + autor + "'}";
    }
}

// --- Interface Aggregate (implícita por java.lang.Iterable) ---
// Não precisamos definir uma nova interface Aggregate se usarmos Iterable.

// --- ConcreteAggregate (BibliotecaPessoal) ---
// Implementa Iterable para que possamos usar o loop for-each
class BibliotecaPessoal implements Iterable<Livro> {
    private List<Livro> estanteDeLivros; // A representação interna

    public BibliotecaPessoal() {
        this.estanteDeLivros = new ArrayList<>();
    }

    public void adicionarLivro(Livro livro) {
        this.estanteDeLivros.add(livro);
    }

    public int getTotalDeLivros() {
        return this.estanteDeLivros.size();
    }

    // Método exigido pela interface Iterable<Livro>
    // Este é o "método fábrica" que cria e retorna o iterador.
    @Override
    public Iterator<Livro> iterator() {
        return new IteradorBibliotecaPessoal(this.estanteDeLivros);
    }

    // --- ConcreteIterator (IteradorBibliotecaPessoal) como classe interna ---
    // É comum implementar o ConcreteIterator como uma classe interna (privada ou não)
    // do ConcreteAggregate, pois ele precisa de acesso à estrutura interna da coleção.
    private class IteradorBibliotecaPessoal implements Iterator<Livro> {
        private List<Livro> livrosParaIterar;
        private int indiceAtual;

        public IteradorBibliotecaPessoal(List<Livro> livros) {
            this.livrosParaIterar = livros; // Poderia ser uma cópia para evitar ConcurrentModificationException
                                         // se a lista original pudesse ser modificada durante a iteração,
                                         // mas para este exemplo simples, usamos a referência direta.
            this.indiceAtual = 0;
        }

        @Override
        public boolean hasNext() {
            return indiceAtual < livrosParaIterar.size();
        }

        @Override
        public Livro next() {
            if (!hasNext()) {
                throw new NoSuchElementException("Não há mais livros na biblioteca para iterar.");
            }
            Livro proximoLivro = livrosParaIterar.get(indiceAtual);
            indiceAtual++;
            return proximoLivro;
        }

        // Opcional: Implementação do método remove()
        // Por padrão, a interface Iterator tem um método default que lança UnsupportedOperationException.
        // Se quisermos suportar a remoção, precisaríamos implementá-lo aqui,
        // tomando cuidado para manter o estado do iterador e da coleção consistentes.
        // Para este exercício, vamos manter a implementação padrão (não suporta remoção).
        /*
        @Override
        public void remove() {
            throw new UnsupportedOperationException("Remoção não suportada por este iterador.");
            // Ou, para implementar:
            // if (indiceAtual <= 0) {
            //     throw new IllegalStateException("next() deve ser chamado antes de remove()");
            // }
            // livrosParaIterar.remove(indiceAtual - 1);
            // indiceAtual--; // Ajusta o índice após a remoção
        }
        */
    }
}

// --- Client (DemoBiblioteca) ---
public class DemoBiblioteca {

    public static void main(String[] args) {
        // 1. Criar o Agregado Concreto
        BibliotecaPessoal minhaBiblioteca = new BibliotecaPessoal();

        // 2. Adicionar alguns livros
        minhaBiblioteca.adicionarLivro(new Livro("O Senhor dos Anéis", "J.R.R. Tolkien"));
        minhaBiblioteca.adicionarLivro(new Livro("1984", "George Orwell"));
        minhaBiblioteca.adicionarLivro(new Livro("O Guia do Mochileiro das Galáxias", "Douglas Adams"));
        minhaBiblioteca.adicionarLivro(new Livro("Fundação", "Isaac Asimov"));

        System.out.println("--- Listando livros da biblioteca usando o Iterador (while loop) ---");

        // 3. Obter o Iterador da biblioteca
        Iterator<Livro> iterador = minhaBiblioteca.iterator();

        // 4. Usar o Iterador para percorrer a coleção
        while (iterador.hasNext()) {
            Livro livro = iterador.next();
            System.out.println(livro);
        }

        System.out.println("\n--- Tentando iterar novamente com um novo iterador ---");
        Iterator<Livro> iterador2 = minhaBiblioteca.iterator(); // Obtém uma NOVA instância do iterador
        int contador = 0;
        while (iterador2.hasNext()) {
            iterador2.next();
            contador++;
        }
        System.out.println("Segunda iteração contou " + contador + " livros. Total na biblioteca: " + minhaBiblioteca.getTotalDeLivros());
        // Verifica se os iteradores são instâncias diferentes
        if (iterador != iterador2) {
            System.out.println("Confirmado: iterador e iterador2 são instâncias diferentes.");
        }


        System.out.println("\n--- Listando livros usando for-each (porque BibliotecaPessoal implementa Iterable) ---");
        for (Livro livro : minhaBiblioteca) {
            System.out.println(livro);
        }

        // Testando o caso de não haver mais elementos
        System.out.println("\n--- Testando NoSuchElementException ---");
        Iterator<Livro> iteradorVazioTeste = minhaBiblioteca.iterator();
        while(iteradorVazioTeste.hasNext()){
            iteradorVazioTeste.next(); // Esvazia o iterador
        }
        try {
            iteradorVazioTeste.next(); // Tenta pegar mais um elemento
        } catch (NoSuchElementException e) {
            System.out.println("Capturado: " + e.getMessage());
        }
    }
}