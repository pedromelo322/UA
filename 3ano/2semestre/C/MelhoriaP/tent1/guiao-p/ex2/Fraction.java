public class Fraction {

    private int numerador, denominador;

    public Fraction(String fraction){

        if (fraction.contains("/")){
            String[] splitFraction = fraction.split("/");
            this.numerador = Integer.parseInt(splitFraction[0]);
            this.denominador = Integer.parseInt(splitFraction[1]);
        }else{
            this.numerador = Integer.parseInt(fraction);
            this.denominador = 1;
        }
    }


    public Fraction(int numerador, int denominador){

        this.numerador = numerador;
        this.denominador = denominador;
    }




    public String getFraction(){
        if (this.denominador != 1) {
            return String.valueOf(this.numerador) + "/" + String.valueOf(this.denominador);
        } else {
            return String.valueOf(this.numerador);
        }
    }



    @Override public String toString(){
        return getFraction();
    }


    public static Fraction absFraction(Fraction f){
        return new Fraction(Math.abs(f.numerador) , f.denominador);
    }


    public static Fraction negFraction(Fraction f){
        return new Fraction(0 - f.numerador, f.denominador);
    }




    public static Fraction addFraction(Fraction f1, Fraction f2){
        return new Fraction((f1.numerador * f2.denominador) + (f2.numerador * f1.denominador), (f1.denominador * f2.denominador));
    }


    public static Fraction subFraction(Fraction f1, Fraction f2){
        return new Fraction((f1.numerador * f2.denominador) - (f2.numerador * f1.denominador), (f1.denominador * f2.denominador));
    }


    public static Fraction mulFraction(Fraction f1, Fraction f2){
        return new Fraction((f1.numerador * f2.numerador), (f1.denominador * f2.denominador));
    }


    public static Fraction divFraction(Fraction f1, Fraction f2){
        return new Fraction((f1.numerador * f2.denominador), (f1.denominador * f2.numerador));
    }

    public static Fraction reduceFraction(Fraction f){
        

        int divisor = mdc(f.numerador, f.denominador);

        
        return new Fraction((f.numerador/divisor), (f.denominador/divisor));
    }


    public static int mdc(int a, int b){
        

        if (b == 0){
            return a;
        }else{
            return Fraction.mdc(b, (a % b));
        }
    }



}


