package aula04;

public class Ex01 {
    public static void main(String[] args) {
        Triangulo t1 = new Triangulo(2, 4, 5);
        System.out.println(t1.toString());
        t1.setLado2(9);
        System.out.println(t1.toString());
        Quadrado q1 = new Quadrado(4);
        System.out.println(q1.toString());
        q1.setLados(-5);
        System.out.println(q1.toString());
        Circulo c1 = new Circulo(-3);
        System.out.println(c1.toString());
        Circulo c2 = new Circulo(4);
        System.out.println(c2.toString());
    }
}
