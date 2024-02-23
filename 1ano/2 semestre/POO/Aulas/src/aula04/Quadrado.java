package aula04;
import java.util.Objects;
import java.lang.Math;

public class Quadrado {
    private double lados;
    private double area;
    private double perimetro;


    public Quadrado() {
    }

    public Quadrado(double lados) {
        if (validacao(lados)){
            this.lados = lados;
            setArea();
            setPerimetro();
        }
    }

    public static boolean validacao(double lados){
        if (lados > 0){
            return true;
        }

        return false;
    }

    public double getLados() {
        return this.lados;
    }

    public void setLados(double lados) {
        if (validacao(lados)){
            this.lados = lados;
            setArea();
            setPerimetro();
        }
    }

    public double getArea() {
        return this.area;
    }

    public void setArea() {
        this.area = Math.pow(lados,2);
    }

    public double getPerimetro() {
        return this.perimetro;
    }

    public void setPerimetro() {
        this.perimetro = this.lados * 4;
    }

    public Quadrado lados(double lados) {
        setLados(lados);
        return this;
    }

    public Quadrado area() {
        setArea();
        return this;
    }

    public Quadrado perimetro() {
        setPerimetro();
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Quadrado)) {
            return false;
        }
        Quadrado quadrado = (Quadrado) o;
        return lados == quadrado.lados && area == quadrado.area && perimetro == quadrado.perimetro;
    }

    @Override
    public int hashCode() {
        return Objects.hash(lados, area, perimetro);
    }

    @Override
    public String toString() {
        return "{" +
            " lados='" + getLados() + "'" +
            ", area='" + getArea() + "'" +
            ", perimetro='" + getPerimetro() + "'" +
            "}";
    }
    

}
