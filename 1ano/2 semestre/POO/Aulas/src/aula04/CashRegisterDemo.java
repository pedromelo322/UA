package aula04;

import java.util.ArrayList;
import java.util.Objects;

class Product {
    private String name;
    private double price;
    private int quantity;

    public Product(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public double getTotalValue() {
        return price * quantity;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int  getQuantity() {
        return quantity;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Product)) {
            return false;
        }
        Product product = (Product) o;
        return Objects.equals(name, product.name) && price == product.price && quantity == product.quantity;
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, price, quantity);
    }


    @Override
    public String toString() {
        return "{" +
            " name='" + getName() + "'" +
            ", price='" + getPrice() + "'" +
            ", quantity='" + getQuantity() + "'" +
            "}";
    }
}




class CashRegister {

    private ArrayList<Product> lista = new ArrayList<>();


    public CashRegister() {
    }

    public CashRegister(ArrayList<Product> lista) {
        this.lista = lista;
    }

    public void addProduct(Product product){

        this.lista.add(product);

    }

    public ArrayList<Product> getLista() {
        return this.lista;
    }

    public void setLista(ArrayList<Product> lista) {
        this.lista = lista;
    }

    public CashRegister lista(ArrayList<Product> lista) {
        setLista(lista);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof CashRegister)) {
            return false;
        }
        CashRegister cashRegister = (CashRegister) o;
        return Objects.equals(lista, cashRegister.lista);
    }

    @Override
    public int hashCode() {
        return lista.hashCode();
    }

    @Override
    public String toString() {
        return "{" +
            " lista='" + getLista() + "'" +
            "}";
    }
    

}

public class CashRegisterDemo {

    public static void main(String[] args) {

        // Cria e adiciona 5 produtos
        CashRegister cr = new CashRegister();
        cr.addProduct(new Product("Book", 9.99, 3));
        cr.addProduct(new Product("Pen", 1.99, 10));
        cr.addProduct(new Product("Headphones", 29.99, 2));
        cr.addProduct(new Product("Notebook", 19.99, 5));
        cr.addProduct(new Product("Phone case", 5.99, 1));
        
        System.out.println(cr);

    }
}