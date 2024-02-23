package aula04;
import java.util.Objects;

public class Triangulo {
    private double lado1, lado2, lado3;
    private double perimetro, area;

    public Triangulo() {
    }

    public Triangulo(double lado1, double lado2, double lado3) {
        if (verificacao(lado1, lado2, lado3)){
            this.lado1 = lado1;
            this.lado2 = lado2;
            this.lado3 = lado3;
            setArea();
            setPerimetro();
        }
    }

    public static boolean verificacao(double lado1, double lado2, double lado3){

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
        return lado1 == triangulo.lado1 && lado2 == triangulo.lado2 && lado3 == triangulo.lado3 && perimetro == triangulo.perimetro && area == triangulo.area;
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
            "}";
    }
    
}


