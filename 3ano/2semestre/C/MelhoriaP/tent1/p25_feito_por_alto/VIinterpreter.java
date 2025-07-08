import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends TimeLangBaseVisitor<String> {

   HashMap<String, Integer> mapa = new HashMap<>(); 
   Scanner sc = new Scanner(System.in);


   @Override public String visitWriteStat(TimeLangParser.WriteStatContext ctx) {
      String res = "";
      String e;

      for (int i = 0; i < ctx.expr().size(); i++){
         
         e = visit(ctx.expr(i));

         if (e == null){
            return null;
         }

         res = res + Time.secToTime(e) + " ";
      }

      System.out.println(res);


      return res;
   }

   @Override public String visitAtributStat(TimeLangParser.AtributStatContext ctx) {

      String id = ctx.ID().getText();

      String res = visit(ctx.expr());


      if (id != null && res != null){
         mapa.put(id, Integer.parseInt(res));
      }


      return res;
   }

   

   @Override public String visitTimeExpr(TimeLangParser.TimeExprContext ctx) {
      String res = null;
      String temp;
      int time = 0;

      for (int i = 0; i < ctx.time().size(); i++){

         temp = visit(ctx.time(i));

         if (temp == null){
            return null;
         }

         time += Integer.parseInt(temp);
         
      }

      res = String.valueOf(time);

      return res;
   }

   @Override public String visitIdExpr(TimeLangParser.IdExprContext ctx) {
      
      String id = ctx.ID().getText();


      if (!mapa.containsKey(id)){
         return null;
      }
      
      return String.valueOf(mapa.get(id));
   }

   @Override public String visitTimeUnit(TimeLangParser.TimeUnitContext ctx) {
      String res = null;
      
      String time = ctx.TIME_UNIT().getText();


      if (time.contains("h")){
         res = time.split("h")[0];
         res = String.valueOf(Integer.parseInt(res) * 3600);
      } else if (time.contains("m")){
         res = time.split("m")[0];
         res = String.valueOf(Integer.parseInt(res) * 60);
      } else if (time.contains("s")){
         res = time.split("s")[0];
      }


      return String.valueOf(res);
   }



   @Override public String visitParentExpr(TimeLangParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }


   @Override public String visitAddSubExpr(TimeLangParser.AddSubExprContext ctx) {
      String res = null;

      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));


      if (e1 != null && e2 != null){

         switch (ctx.op.getText()) {
            case "+":
               res = (String.valueOf(Integer.parseInt(e1) + Integer.parseInt(e2)));
               break;
         
            case "-":
               res = (String.valueOf(Integer.parseInt(e1) - Integer.parseInt(e2)));
               break;
         }

      }



      return res;
   }


   @Override public String visitDivMulExpr(TimeLangParser.DivMulExprContext ctx) {
      String res = null;

      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));


      if (e1 != null && e2 != null){

         switch (ctx.op.getText()) {
            case "*":
               res = (String.valueOf(Integer.parseInt(e1) * Integer.parseInt(e2)));
               break;
         
            case "/":
               res = (String.valueOf(Integer.parseInt(e1) / Integer.parseInt(e2)));
               break;

            case "%":
               res = (String.valueOf(Integer.parseInt(e1) % Integer.parseInt(e2)));
               break;
         }

      }



      return res;
   }


   @Override public String visitAritmExpr(TimeLangParser.AritmExprContext ctx) {
      String res = null;

      String e = visit(ctx.expr());


      if (e != null){

         switch (ctx.op.getText()) {
            case "+":
               res = e;
               break;
         
            case "-":
               res = (String.valueOf((24*3600) - Integer.parseInt(e)));
               break;

         }

      }



      return res;
   }


   @Override public String visitExtractExpr(TimeLangParser.ExtractExprContext ctx) {
      String res = null;

      String e = visit(ctx.expr());


      if (e != null){

         switch (ctx.op.getText()) {
            case "h":
               res = String.valueOf(Integer.parseInt(e) / 3600);
               break;
         
            case "m":
               res = (String.valueOf(Integer.parseInt(e) % 3600 / 60));
               break;


            case "s":
               res = (String.valueOf(Integer.parseInt(e) % 3600 % 60));
               break;

         }

      }
      



      return res;
   }


   @Override public String visitReadExpr(TimeLangParser.ReadExprContext ctx) {
      String res = null;
      int time = 0;
      String str = "";
      if (ctx.STR() != null){
         str = ctx.STR().getText();
      }
         String[] split_;

      System.out.println(str);
      res = sc.nextLine();

      String h,m,s;

      if (res.contains("h")){
         split_ = res.split("h");
         time = time + Integer.parseInt(split_[0]) * 3600;
         res = split_[1];
      }

      if (res.contains("m")){
         split_ = res.split("m");
         time = time + Integer.parseInt(split_[0]) * 60;
         res = split_[1];
      }

      if (res.contains("s")){
         split_ = res.split("s");
         time = time + Integer.parseInt(res.split("s")[0]);
      }


      res = String.valueOf(time);

      

      return res;


   }



























}
