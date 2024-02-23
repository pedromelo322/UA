package aula10;

import java.util.Collection;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class GenerosLiterarios2{

    private Map<String, Set<Book>> mapa = new TreeMap<>();

    public GenerosLiterarios2() {
    }

    public void addBook(String categoria, Book book){
        if (!mapa.containsKey(categoria)){
            Set<Book> livros = new HashSet<>();
            livros.add(book);
            mapa.put(categoria, livros);
            System.out.println("Livro adicionado com sucesso");
        }else{
            Set<Book> livros = mapa.get(categoria);
            if (livros.contains(book)){
                System.out.println("Livro já exite");
            }else{
                livros.add(book);
                System.out.println("Livro adicionado com sucesso");
            }
        }

        System.out.println(mapa.get(categoria));
        System.out.println(book + " ; " + categoria);
    }

    public void removeBook(Book book){

        boolean rmvd = false;

        for (Set<Book> e : mapa.values()){
            if (e.contains(book)){
                e.remove(book);
                rmvd = true;
            }
        }
        if (rmvd == true){
            System.out.println("Livro removido com sucesso");
        }else{
            System.out.println("O livro selecionado não existe");
        }
    }

    public void alterar(Book bookAntigo, Book bookNovo){
        for (Set<Book> e : mapa.values()){
            if (e.contains(bookAntigo)){
                e.remove(bookAntigo);
                e.add(bookNovo);
                System.out.println("Livro alterado com sucesso");
            }else{
                System.out.println("Livro forncedido não existe");
            }
        }
    }

    public Collection<String> getGeneros(){

        return mapa.keySet();
    }

    public Collection<Set<Book>> getLivros(){

        return mapa.values();

    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((mapa == null) ? 0 : mapa.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        GenerosLiterarios2 other = (GenerosLiterarios2) obj;
        if (mapa == null) {
            if (other.mapa != null)
                return false;
        } else if (!mapa.equals(other.mapa))
            return false;
        return true;
    }

    @Override
    public String toString() {

        String resultado = "Biblioteca: \n";

        for (Map.Entry<String, Set<Book>> e: mapa.entrySet()){

            resultado += e.getKey() + ": \n" + "    " + e.getValue() + "\n";
        }


        return resultado;
    }

}