package aula10;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Separador {
    
    private String palavra;
    private Map<Character, List<Integer>> letras = new TreeMap<>();

    public Separador(String palavra) {
        this.palavra = palavra;
        separar();
    }

    public String getPalavra() {
        return palavra;
    }

    public void separar(){

        for (int i = 0; i < this.palavra.length(); i++){
            
            if (!letras.keySet().contains(this.palavra.charAt(i))){
                List<Integer> numeros = new ArrayList<>();
                numeros.add(i);
                letras.put(this.palavra.charAt(i), numeros);
            }else{
                letras.get(this.palavra.charAt(i)).add(i);
            }

        }

    }


    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((palavra == null) ? 0 : palavra.hashCode());
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
        Separador other = (Separador) obj;
        if (palavra == null) {
            if (other.palavra != null)
                return false;
        } else if (!palavra.equals(other.palavra))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "Separador [palavra=" + palavra + ", lista=  " + letras + "]";
    }

    

}
