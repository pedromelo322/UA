import java.util.HashMap;
import java.util.Scanner;





@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends FracLangBaseVisitor<Object> {

   HashMap<String, Object> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public Object visitDisplayStat(FracLangParser.DisplayStatContext ctx) {
      Object res = visit(ctx.expr());


      if (res != null){
         System.out.println(res);
      }
      
      return res;
   }

   @Override public Object visitAtribStat(FracLangParser.AtribStatContext ctx) {
      Object res = visit(ctx.expr());
      String id = ctx.ID().getText();
      
      
      if (res != null && id != null){
         mapa.put(id, res);
      }


      return res;


   }

   @Override public Object visitUnaryExpr(FracLangParser.UnaryExprContext ctx) {
      Object res = null;
   
      Fraction e = (Fraction) visit(ctx.expr());


      if (e != null){

         switch(ctx.op.getText()){

            case "+":
               res = Fraction.absFraction(e);
               break;
            case "-":
               res = Fraction.negFraction(e);
               break;

         }


      }



      return res;
   }

   @Override public Object visitAddSubExpr(FracLangParser.AddSubExprContext ctx) {
      Object res = null;
   
      Fraction e1 = (Fraction) visit(ctx.expr(0));
      Fraction e2 = (Fraction) visit(ctx.expr(1));

      if (e1 != null && e2 != null){

         switch(ctx.op.getText()){

            case "+":
               res = Fraction.addFraction(e1,e2);
               break;
            case "-":
               res = Fraction.subFraction(e1,e2);
               break;

         }


      }



      return res;
   }

   @Override public Object visitFracExpr(FracLangParser.FracExprContext ctx) {
      String fractionText = ctx.FRAC().getText();
      return new Fraction(fractionText);

   }

   @Override public Object visitParentExpr(FracLangParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitMulDivExpr(FracLangParser.MulDivExprContext ctx) {
      Object res = null;
   
      Fraction e1 = (Fraction) visit(ctx.expr(0));
      Fraction e2 = (Fraction) visit(ctx.expr(1));

      if (e1 != null && e2 != null){

         switch(ctx.op.getText()){

            case "*":
               res = Fraction.mulFraction(e1,e2);
               break;
            case ":":
               res = Fraction.divFraction(e1,e2);
               break;

         }


      }



      return res;
   }

   @Override public Object visitIdExpr(FracLangParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public Object visitReadExpr(FracLangParser.ReadExprContext ctx) {
      Object res = null;


      String str = ctx.STR().getText().replace("\"", "");


      if (str != null){
         System.out.print(str+": ");
         res = new Fraction(sc.nextLine());
      }


      return res;



   }




   @Override public Object visitReduceExpr(FracLangParser.ReduceExprContext ctx) {
      Object res = null;

      Fraction e = (Fraction) visit(ctx.expr());


      if (e != null){
         res = Fraction.reduceFraction(e);
      }


      return res;



   }
}
