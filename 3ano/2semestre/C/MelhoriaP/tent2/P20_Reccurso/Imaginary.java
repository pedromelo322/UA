class Imaginary{

    private Double real;
    private Integer imaginary;

    public Imaginary(Double real, Integer imaginary){

        this.real = real;
        this.imaginary = imaginary;

    }


    @Override
    public String toString(){
        String res = String.valueOf(this.real);

        if (this.imaginary < 0){
            res = res + this.imaginary;
        }else if(this.imaginary == 0){

            

        }else{
            res = res + "+" + this.imaginary;
        }


        return res;
    }


}