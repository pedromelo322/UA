public class Fraction {

    private int numerador;
    private int denominador;

    public Fraction(){
    }

    public int getNumerador(){
        return this.numerador;
    }


    public int getDenominador(){
        return this.denominador;
    }


    public boolean setNumerador(int numerador){
        this.numerador = numerador;
        return true;
    }


    public boolean setDenominador(int denominador){
        if (denominador != 0){
            this.denominador = denominador;
            return true;
        }
        return false;
    }

    public void pos(){
        this.numerador = Math.abs(this.numerador);
    }


    public void neg(){
        this.numerador = 0 - Math.abs(this.numerador);
    }



    @Override
    public String toString(){
        return (numerador + "/" + denominador);
    }



    public static Fraction add(Fraction f1, Fraction f2){

        Fraction result = new Fraction();

        result.setNumerador((f1.numerador * f2.denominador) + (f2.numerador * f1.denominador));
        result.setDenominador(f1.denominador * f2.denominador);

        return result;

    }


    public static Fraction sub(Fraction f1, Fraction f2){

        Fraction result = new Fraction();

        result.setNumerador((f1.numerador * f2.denominador) - (f2.numerador * f1.denominador));
        result.setDenominador(f1.denominador * f2.denominador);

        return result;

    }


    public static Fraction mul(Fraction f1, Fraction f2){

        Fraction result = new Fraction();

        result.setNumerador(f1.numerador * f2.numerador);
        result.setDenominador(f1.denominador * f2.denominador);

        return result;

    }


    public static Fraction div(Fraction f1, Fraction f2){

        Fraction result = new Fraction();

        result.setNumerador(f1.numerador * f2.denominador);
        result.setDenominador(f1.denominador * f2.numerador);

        return result;

    }


    public static Fraction toFraction(String f){

        String[] numeros = f.split("/");

        if (numeros.length == 2){
            Fraction frac = new Fraction();
            frac.setNumerador(Integer.parseInt(numeros[0]));
            frac.setDenominador(Integer.parseInt(numeros[1]));

            return frac;
        }else if(numeros.length == 1){
            Fraction frac = new Fraction();
            frac.setNumerador(Integer.parseInt(numeros[0]));
            frac.setDenominador(1);

            return frac;
        }


        return null;
    }


}
