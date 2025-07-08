import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends TimeLangBaseVisitor<Object> {


   HashMap<String,Integer> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);


   @Override public Object visitWriteStat(TimeLangParser.WriteStatContext ctx) {
      Integer partoutput;
      StringBuilder res = new StringBuilder();


      if (ctx.expr().size() == 0){
         System.err.println();
         return "";
      }


      for (int i = 0; i < ctx.expr().size(); i++) {
         partoutput = Integer.parseInt(String.valueOf(visit(ctx.expr(i))));
         if (partoutput == null){
            continue;
         }

         res.append(secToTime(partoutput) + ", ");
      }

      System.out.println(res.toString().substring(0,res.length()-2));

      return res;
   }

   @Override public Object visitAtribStat(TimeLangParser.AtribStatContext ctx) {
      Integer res = null;
      String id = ctx.ID().getText();
      Integer expr = Integer.parseInt(String.valueOf(visit(ctx.expr())));

      if (id != null && expr != null){ 
         mapa.put(id, expr);
      }

      return res;
   }

   @Override public Object visitWhiledoStat(TimeLangParser.WhiledoStatContext ctx) {
      Object res = null;

      while(Integer.parseInt(String.valueOf(visit(ctx.expr()))) != 0){
         for (int i = 0; i < ctx.stat().size(); i++) {
            visit(ctx.stat(i));
         }
      }

      return res;
   }

   @Override public Object visitUnaryExpr(TimeLangParser.UnaryExprContext ctx) {
      Object res = null;
      Integer expr = Integer.parseInt(String.valueOf(visit(ctx.expr())));
      String op = ctx.op.getText();

      if (op != null && expr != null){
         switch (op) {
            case "+":
               res = absTime(expr);
               break;
            case "-":
               res =  (24*3600  -expr);
               break;
         }
      }
      return res;
   }

   @Override public Object visitAddSubExpr(TimeLangParser.AddSubExprContext ctx) {
      Object res = null;
      Integer expr1 = Integer.parseInt(String.valueOf(visit(ctx.expr(0))));
      Integer expr2 = Integer.parseInt(String.valueOf(visit(ctx.expr(1))));
      String op = ctx.op.getText();

      if (op != null && expr1 != null && expr2 != null){
         switch (op) {
            case "+":
               res = expr1 + expr2;
               break;
            case "-":
               res = absTime(expr1 - expr2);
               break;
         }
      }
      
      return res;
   }

   @Override public Object visitTimeExpr(TimeLangParser.TimeExprContext ctx) {
      
      Integer res = timeToSec(ctx.TIME().getText());
   
      return res;
   }

   @Override public Object visitReadExpr(TimeLangParser.ReadExprContext ctx) {
      Integer res = null;
      String str = "";
      if (ctx.STR()!= null){
         str = ctx.STR().getText();
      }
      

      if (str != null){
         System.out.print(str.replace("\"", "") + ": ");
         res = timeToSec(sc.nextLine());
      }

      return res;
   }

   @Override public Object visitExtractExpr(TimeLangParser.ExtractExprContext ctx) {
      Object res = null;
      Integer expr = Integer.parseInt(String.valueOf(visit(ctx.expr())));
      String op = ctx.op.getText();

      if (op != null && expr != null){
         switch (op) {
            case "h":
               res = expr/3600*3600;
               break;
            case "m":
               res = expr%3600/60*60;
               break;
            case "s":
               res = expr%3600%60;
               break;
         }
      }
      return res;
   }

   @Override public Object visitParentExpr(TimeLangParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitMulDivExpr(TimeLangParser.MulDivExprContext ctx) {
      Object res = null;
      Integer expr1 = Integer.parseInt(String.valueOf(visit(ctx.expr(0))));
      Integer expr2 = Integer.parseInt(String.valueOf(visit(ctx.expr(1))));
      String op = ctx.op.getText();


      if (op != null && expr1 != null && expr2 != null){
         switch (op) {
            case "*":
               res = expr1 * expr2;
               break;
            case "/":
               res = expr1 / expr2;
               break;
            case "%":
               res = expr1 % expr2;
               break;
         }
      }
      return res;
   }

   @Override public Object visitIdExpr(TimeLangParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }


   
   private Integer timeToSec(String time){
      String[] timeSplit;
      Integer res = 0;
      if (time.contains("h")){
         timeSplit = time.split("h");
         res += (Integer.parseInt(timeSplit[0]) * 3600);
         if (timeSplit.length > 1)
            time = timeSplit[1];
         }
      if (time.contains("m")){
         timeSplit = time.split("m");
         res += (Integer.parseInt(timeSplit[0]) * 60);
         if (timeSplit.length > 1)
            time = timeSplit[1];
      }
      if (time.contains("s")){      
         timeSplit = time.split("s");
         res += Integer.parseInt(timeSplit[0]);
      }

      return res;
   }


   private String secToTime(Integer sec){

      Integer resto,h,m,s;
      
      h = sec / 3600 % 24;
      resto = sec % 3600;
      m = resto / 60;
      s = resto % 60;

      String res = h+"h"+m+"m"+s+"s";


      return res;
   }

   private Integer absTime(Integer time){
      if (time < 0){
         return (24*3600  + time%(24*3600));
      }else{
         return time;
      }
      

   }

}
