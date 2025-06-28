import java.util.ArrayList;

public class Tuple {

    private ArrayList<Double> array = new ArrayList<>();

    public Tuple(String t){

        t = t.replace("[", "");
        t = t.replace("]", "");
        

        String[] tuplo = t.split(",");

        for (int i = 0; i < tuplo.length; i++){
            if (tuplo[i] != ""){
                array.add(Double.parseDouble(tuplo[i]));
            }
            
        }

    }


    public boolean isValid(){
        for (int i=0; i<this.array.size(); i++){
            if (this.array.get(i) != 0.0){
                return true;
            }
        }

        return false;
    }


    public Tuple(ArrayList<Double> a){
        this.array = a;
    }



    @Override public String toString(){
        
        return this.array.toString();

            
    }



    public static Tuple absTuple(Tuple t){

        ArrayList<Double> a = new ArrayList<>();

        for (int i = 0; i < t.array.size(); i++){
            a.add(Math.abs(t.array.get(i)));
        }

        return new Tuple(a);


    }




    public static Tuple negTuple(Tuple t){

        ArrayList<Double> a = new ArrayList<>();

        for (int i = 0; i < t.array.size(); i++){
            a.add(0-t.array.get(i));
        }

        return new Tuple(a);


    }



    public static Tuple addTuple(Tuple t1, Tuple t2){

        ArrayList<Double> a = new ArrayList<>();

        if (t1.array.size() >= t2.array.size()){

            for (int i=0; i < t1.array.size(); i++){
                if (i < t2.array.size()){
                    a.add(t1.array.get(i) + t2.array.get(i));
                }else{
                    a.add(t1.array.get(i));
                }
            }
        }else{
            return addTuple(t2, t1);
        }

        return new Tuple(a);


    }


    public static Tuple subTuple(Tuple t1, Tuple t2){

        ArrayList<Double> a = new ArrayList<>();

        if (t1.array.size() >= t2.array.size()){

            for (int i=0; i < t1.array.size(); i++){
                if (i < t2.array.size()){
                    a.add(t1.array.get(i) - t2.array.get(i));
                }else{
                    a.add(t1.array.get(i));
                }
            }
        }else{
            return addTuple(t2, t1);
        }

        return new Tuple(a);


    }


    public static Tuple headTuple(Tuple t){

        ArrayList<Double> a = new ArrayList<>();

        a.add(t.array.get(0));

        return new Tuple(a);


    }


    public static Tuple tailTuple(Tuple t){

        ArrayList<Double> a = new ArrayList<>();

        for (int i = 1; i < t.array.size(); i++){
            a.add(t.array.get(i));
        }

        return new Tuple(a);


    }




    public static Tuple sumTuple(Tuple t){

        ArrayList<Double> a = new ArrayList<>();
        double sum = 0;

        for (int i = 0; i < t.array.size(); i++){
            sum = sum + t.array.get(i);
        }


        a.add(sum);

        return new Tuple(a);


    }



    public static Tuple averageTuple(Tuple t){

        ArrayList<Double> a = new ArrayList<>();
        double sum = 0;

        for (int i = 0; i < t.array.size(); i++){
            sum = sum + t.array.get(i);
        }


        a.add(sum/t.array.size());

        return new Tuple(a);


    }


    


    

}
