public class Frac {
    
    int numerador, denomiandor;

    public Frac(String frac){


        String[] fracao = frac.split("/");

        this.numerador = Integer.parseInt(fracao[0]);
        
        if (fracao.length == 2){
            this.denomiandor = Integer.parseInt(fracao[1]);
        }else{
            this.denomiandor = 1;
        }

        
        
    }


    public Frac(int numerador, int denomiandor){
        this.numerador = numerador;
        this.denomiandor = denomiandor;
    }



    @Override
    public String toString(){
        if (denomiandor != 1){
            return numerador + "/" + denomiandor;
        }else{
            return String.valueOf(numerador);
        }
    }


    public static int mdc(int a, int b){
        if (b == 0){
            return a;
        }else{
            return mdc(b, a % b);
        }
    }


}
