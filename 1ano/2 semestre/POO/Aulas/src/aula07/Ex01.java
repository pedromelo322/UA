package aula07;

import java.util.Objects;

abstract class Forma{

    private String cor;
    
    abstract double getArea();
    abstract double getPerimetro();

    public Forma(String cor){
        this.cor = cor;
    }

    public String getCor() {
        return this.cor;
    }

}

class Circulo extends Forma{
    private double raio;
    private double perimetro;
    private double area;




    public Circulo(double raio, String cor) {
        super(cor);
        if (verificacao(raio)){
            this.raio = raio;
            setArea();
            setPerimetro();
        }
    }

    boolean verificacao(double raio){
        if (raio > 0){
            return true;
        }    

        return false;
    }

    public double getRaio() {
        return this.raio;
    }

    public void setRaio(double raio) {
        if (verificacao(raio)){
            this.raio = raio;
            setPerimetro();
            setArea();
        }
    }

    public void setPerimetro(){
        this.perimetro = 2 * Math.PI * this.raio;
    }

    public void setArea(){
        this.area = Math.PI*Math.pow(this.raio,2);
    }

    public double getPerimetro() {
        
        return this.perimetro;
    }


    public double getArea() {
        return this.area;
    }

    public Circulo raio(double raio) {
        setRaio(raio);
        return this;
    }


    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Circulo)) {
            return false;
        }
        Circulo circulo = (Circulo) o;
        return raio == circulo.raio && perimetro == circulo.perimetro && area == circulo.area && super.getCor() == circulo.getCor();
    }

    @Override
    public int hashCode() {
        return Objects.hash(raio, perimetro, area);
    }

    @Override
    public String toString() {
        return "{" +
            " raio='" + getRaio() + "'" +
            ", perimetro='" + getPerimetro() + "'" +
            ", area='" + getArea() + "'" +
            ", cor='" + super.getCor() + "'" +
            "}";
    }
    
}

class Retangulo extends Forma{
    private double lado1, lado2;
    private double area;
    private double perimetro;


    public Retangulo(double lado1, double lado2, String cor) {
        super(cor);
        this.lado1 = lado1;
        this.lado2 = lado2;
        setArea();
        setPerimetro();
    }

    public double getLado1() {
        return this.lado1;
    }

    boolean verificacao(double lado1, double lado2){
        if (lado1 > 0 & lado2 > 0){
            return true;
        }

        return false;
    }

    public void setArea() {
        this.area = this.lado1 * this.lado2;
    }

    public void setPerimetro() {
        this.perimetro = this.lado1 * 2 +  this.lado2 * 2;
    }

    public void setLado1(double lado1) {
        if (verificacao(lado1, this.lado2)){
            this.lado1 = lado1;
            setArea();
            setPerimetro();
        }
    }

    public double getLado2() {
        return this.lado2;
    }

    public void setLado2(double lado2) {
        if (verificacao(lado1, this.lado2)){
            this.lado2 = lado2;
            setArea();
            setPerimetro();
        }
    }

    public double getArea() {
        return this.area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getPerimetro() {
        return this.perimetro;
    }

    public void setPerimetro(double perimetro) {
        this.perimetro = perimetro;
    }

    public Retangulo lado1(double lado1) {
        setLado1(lado1);
        return this;
    }

    public Retangulo lado2(double lado2) {
        setLado2(lado2);
        return this;
    }

    public Retangulo area(double area) {
        setArea(area);
        return this;
    }

    public Retangulo perimetro(double perimetro) {
        setPerimetro(perimetro);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Retangulo)) {
            return false;
        }
        Retangulo retangulo = (Retangulo) o;
        return lado1 == retangulo.lado1 && lado2 == retangulo.lado2 && area == retangulo.area && perimetro == retangulo.perimetro && super.getCor() == retangulo.getCor();
    }

    @Override
    public int hashCode() {
        return Objects.hash(lado1, lado2, area, perimetro);
    }

    @Override
    public String toString() {
        return "{" +
            " lado1='" + getLado1() + "'" +
            ", lado2='" + getLado2() + "'" +
            ", area='" + getArea() + "'" +
            ", perimetro='" + getPerimetro() + "'" +
            ", cor='" + super.getCor() + "'" +
            "}";
    }
    

}

class Triangulo extends Forma{
    private double lado1, lado2, lado3;
    private double perimetro, area;


    public Triangulo(double lado1, double lado2, double lado3, String cor) {
        super(cor);
        if (verificacao(lado1, lado2, lado3)){
            this.lado1 = lado1;
            this.lado2 = lado2;
            this.lado3 = lado3;
            setArea();
            setPerimetro();
        }
    }

    boolean verificacao(double lado1, double lado2, double lado3){

        if (lado1 > 0 && lado2 > 0 && lado3 > 0){
            if (lado1 < (lado2 + lado3) & lado2 < (lado1 + lado3) & lado3 < (lado1 + lado2)){
                return true;
            }

            return false;

        }
    
        return false;
    }

    public double getLado1() {
        return this.lado1;
    }

    public void setLado1(double lado1) {
        if (verificacao(lado1, this.lado2, this.lado3)){
            this.lado1 = lado1;
            setArea();
            setPerimetro();
        }
    }

    public double getLado2() {
        return this.lado2;
    }

    public void setLado2(double lado2) {
        if (verificacao(lado2, this.lado1, this.lado3)){
            this.lado2 = lado2;
            setArea();
            setPerimetro();
        }
    }

    public double getLado3() {
        return this.lado3;
    }

    public void setLado3(double lado3) {
        if (verificacao(lado3, this.lado2, this.lado1)){
            this.lado3 = lado3;
            setArea();
            setPerimetro();
        }
    }

    public double getPerimetro() {
        return this.perimetro;
    }

    public void setPerimetro() {
        this.perimetro = this.lado1 + this.lado2 + this.lado3;
    }

    public double getArea() {
        return this.area;
    }

    public void setArea() {

        double p = (this.lado1 + this.lado2 + this.lado3)/2;

        this.area = Math.sqrt(p*(p-this.lado1)*(p-this.lado2)*(p-this.lado3));
    }

    public Triangulo lado1(double lado1) {
        setLado1(lado1);
        return this;
    }

    public Triangulo lado2(double lado2) {
        setLado2(lado2);
        return this;
    }

    public Triangulo lado3(double lado3) {
        setLado3(lado3);
        return this;
    }

    public Triangulo perimetro() {
        setPerimetro();
        return this;
    }

    public Triangulo area() {
        setArea();
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Triangulo)) {
            return false;
        }
        Triangulo triangulo = (Triangulo) o;
        return lado1 == triangulo.lado1 && lado2 == triangulo.lado2 && lado3 == triangulo.lado3 && perimetro == triangulo.perimetro && area == triangulo.area && super.getCor() == triangulo.getCor();
    }

    @Override
    public int hashCode() {
        return Objects.hash(lado1, lado2, lado3, perimetro, area);
    }

    @Override
    public String toString() {
        return "{" +
            " lado1='" + getLado1() + "'" +
            ", lado2='" + getLado2() + "'" +
            ", lado3='" + getLado3() + "'" +
            ", perimetro='" + getPerimetro() + "'" +
            ", area='" + getArea() + "'" +
            ", cor='" + super.getCor() + "'" +
            "}";
    }
}



public class Ex01 {
    public static void main(String[] args) {
        Circulo circulo1 = new Circulo(5.0, "vermelho");
        Circulo circulo2 = new Circulo(5.0, "castanho");
        Circulo circulo3 = new Circulo(3.0, "azul");

        Retangulo retangulo1 = new Retangulo(4.0, 3.0, "verde");
        Retangulo retangulo2 = new Retangulo(4.0, 3.0, "azul");
        Retangulo retangulo3 = new Retangulo(5.0, 2.0, "azul");

        Triangulo triangulo1 = new Triangulo(3.0, 4.0, 5.0, "amarelo");
        Triangulo triangulo2 = new Triangulo(3.0, 4.0, 5.0, "preto");
        Triangulo triangulo3 = new Triangulo(4.0, 5.0, 6.0, "vermelho");

        System.out.println("Circulo 1: " + circulo1);
        System.out.println("Circulo 2: " + circulo2);
        System.out.println("Circulo 3: " + circulo3);
        System.out.println();

        System.out.println("Retangulo 1: " + retangulo1);
        System.out.println("Retangulo 2: " + retangulo2);
        System.out.println("Retangulo 3: " + retangulo3);
        System.out.println();

        System.out.println("Triangulo 1: " + triangulo1);
        System.out.println("Triangulo 2: " + triangulo2);
        System.out.println("Triangulo 3: " + triangulo3);
        System.out.println();

        // Testando igualdade entre circulo1 e circulo2
        if (circulo1.equals(circulo2)) {
            System.out.println("Circulo 1 e Circulo 2 são iguais.");
        } else {
            System.out.println("Circulo 1 e Circulo 2 são diferentes.");
        }

        // Testando igualdade entre circulo1 e circulo3
        if (circulo1.equals(circulo3)) {
            System.out.println("Circulo 1 e Circulo 3 são iguais.");
        } else {
            System.out.println("Circulo 1 e Circulo 3 são diferentes.");
        }
        System.out.println();

        // Testando igualdade entre retangulo1 e retangulo2
        if (retangulo1.equals(retangulo2)) {
            System.out.println("Retangulo 1 e Retangulo 2 são iguais.");
        } else {
            System.out.println("Retangulo 1 e Retangulo 2 são diferentes.");
        }

        // Testando igualdade entre retangulo1 e retangulo3
        if (retangulo1.equals(retangulo3)) {
            System.out.println("Retangulo 1 e Retangulo 3 são iguais.");
        } else {
            System.out.println("Retangulo 1 e Retangulo 3 são diferentes.");
        }
        System.out.println();

        // Testando igualdade entre triangulo1 e triangulo2
        if (triangulo1.equals(triangulo2)) {
            System.out.println("Triangulo 1 e Triangulo 2 são iguais.");
        } else {
            System.out.println("Triangulo 1 e Triangulo 2 são diferentes.");
        }

        // Testando igualdade entre triangulo1 e triangulo3
        if (triangulo1.equals(triangulo3)) {
            System.out.println("Triangulo 1 e Triangulo 3 são iguais.");
        } else {
            System.out.println("Triangulo 1 e Triangulo 3 são diferentes.");
        }
    }
}

