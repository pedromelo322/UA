package aula10;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class GenerosLiterarios{

    private Map<Book, String> mapa = new HashMap<>();

    public GenerosLiterarios() {
    }

    public void addBook(String categoria, Book book){
        if (!mapa.containsKey(book)){
            mapa.put(book, categoria);
            System.out.println("Livro adicionado com sucesso");
        }else{
            System.out.println("O livro fornecido já existe");
        }
    }

    public void removeBook(Book book){
        if (mapa.containsKey(book)){
            mapa.remove(book);
            System.out.println("Livro removido com sucesso");
        }else{
            System.out.println("O livro fornecido não existe");
        }
    }

    public void alterar(String categoria, Book bookAntigo, Book bookNovo){
        if (mapa.containsKey(bookAntigo)){
            mapa.remove(bookAntigo);
            mapa.put(bookNovo, categoria);
            System.out.println("Livro alterado com sucesso");
        }else{
            System.out.println("O livro fornecido não existe");
        }
    }

    public Collection<String> getGeneros(){

        return mapa.values();
    }

     public Set<Book> getLivros(){

        return mapa.keySet();
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
        GenerosLiterarios other = (GenerosLiterarios) obj;
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

        for (Map.Entry<Book, String> e: mapa.entrySet()){

            resultado += e.getKey() + ": " + e.getValue() + "\n";
        }


        return resultado;
    }

}