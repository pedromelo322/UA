public class Time {
    


    public static String secToTime(String sss){

        int ss = Integer.parseInt(sss);

        String res = "";
        int resto = 0;

        res = res + String.valueOf(ss / 3600) + "h";
        resto = ss%3600;
        res = res + String.valueOf(resto / 60) + "m";
        resto = ss%60;
        res = res + String.valueOf(resto) + "s";


        return res;
    }


}
