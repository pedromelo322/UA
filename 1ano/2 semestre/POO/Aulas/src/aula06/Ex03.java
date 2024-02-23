package aula06;

import java.util.ArrayList;

class Conjunto{

    ArrayList<Integer> lista = new ArrayList<>(); 


    boolean contains(int n){

        for (int num : lista) {
            
            if (n == num){
                return true;
            }

        }

        return false;

    }


    void insert(int n){

        if (!contains(n)){

            lista.add(n);

            //System.out.println("Número " + n + " adicionado");

        }else{
            //System.out.println("O número " + n + " já está na lista");
        }

        
    }

    void remove(int n){

        if (contains(n)){

            lista.remove(lista.indexOf(n));

            //System.out.println("Número " + n + " removido");
        }else{

            //System.out.println("O número " + n + " não existe na lista");
        }

        
    }

    void empty(){

        lista = new ArrayList<>();

        //System.out.println("Lista vazia");

    }


    int size(){

        return lista.size();

    }


    Conjunto unir(Conjunto add) {
        Conjunto resultado = new Conjunto();

        for (int elemento : this.lista) {
            resultado.insert(elemento);
        }

        for (int elemento : add.getLista()) {
            resultado.insert(elemento);
        }

        return resultado;
    } 

    Conjunto subtrair(Conjunto dif){
        Conjunto resultado = new Conjunto();

        for (int elemento : this.lista){
            if (!dif.contains(elemento)){
                resultado.insert(elemento);
            }
        }


        return resultado;
    }

    Conjunto interset(Conjunto inter){
        Conjunto resultado = new Conjunto();

        for (int elemento : this.lista){
            if (inter.contains(elemento)){
                resultado.insert(elemento);
            }
        }

        return resultado;


    }




    public ArrayList<Integer> getLista() {
        return this.lista;
    }




    @Override
    public String toString() {
        String resultado = "";

        for (Integer integer : lista) {
            
            resultado += String.valueOf(integer) + " ";

        }


        return resultado;
    }



}







public class Ex03 {
    public static void main(String[] args) {
        Conjunto c1 = new Conjunto();
        c1.insert(4); c1.insert(7); c1.insert(6); c1.insert(5);
        Conjunto c2 = new Conjunto();
        int[] test = { 7, 3, 2, 5, 4, 6, 7};
        for (int el : test) c2.insert(el);
        c2.remove(3); c2.remove(5); c2.remove(6);
        System.out.println(c1);
        System.out.println(c2);
        System.out.println("Número de elementos em c1: " + c1.size());
        System.out.println("Número de elementos em c2: " + c2.size());
        System.out.println("c1 contém 6?: " + ((c1.contains(6) ? "sim" : "não")));
        System.out.println("c2 contém 6?: " + ((c2.contains(6) ? "sim" : "não")));
        System.out.println("União:" + c1.unir(c2));
        System.out.println("Interseção:" + c1.interset(c2));
        System.out.println("Diferença:" + c1.subtrair(c2));
        c1.empty();
        System.out.println("c1:" + c1);
    }
}


