package aula04;
import java.util.Objects;
import java.lang.Math;

public class Circulo {
    private double raio;
    private double perimetro;
    private double area;


    public Circulo() {
    }

    public Circulo(double raio) {
        if (verificacao(raio)){
            this.raio = raio;
            setArea();
            setPerimetro();
        }
    }

    public static boolean verificacao(double raio){
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
        return raio == circulo.raio && perimetro == circulo.perimetro && area == circulo.area;
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
            "}";
    }
    

}
