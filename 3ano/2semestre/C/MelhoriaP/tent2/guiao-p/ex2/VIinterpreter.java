import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends FracLangBaseVisitor<Object> {

   

   HashMap<String,Frac> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);



   @Override public Object visitDisplayStat(FracLangParser.DisplayStatContext ctx) {
      Object res = visit(ctx.expr());

      if (res != null){
         System.out.println(res);
      }

      return res;
   }

   @Override public Object visitAtribStat(FracLangParser.AtribStatContext ctx) {
      Frac expr1 = (Frac) visit(ctx.expr());
      String id = ctx.ID().getText();
      Object res = null;

      if (expr1 != null && id != null){
         res = expr1;
         mapa.put(id, expr1);
      }

      return res;

   }

   @Override public Object visitFracExpr(FracLangParser.FracExprContext ctx) {
      Frac res = new Frac(ctx.Frac().getText());
      
      if (res.denomiandor == 0){
         res = null;
      }

      return res;
   }

   @Override public Object visitMulDivExpr(FracLangParser.MulDivExprContext ctx) {
      Object res = null;
      Frac frac1 = (Frac) visit(ctx.expr(0));
      Frac frac2 = (Frac) visit(ctx.expr(1));
      String op = ctx.op.getText();

      if (frac1 != null && op != null && frac2 != null){

         switch (op) {
            case "*":
               res = new Frac((frac1.numerador * frac2.numerador),( frac1.denomiandor*frac2.denomiandor));
               break;
            case ":":
               res = new Frac((frac1.numerador * frac2.denomiandor),( frac1.denomiandor*frac2.numerador));
               break;
         }

      }

      return res;
   }

   @Override public Object visitIdExpr(FracLangParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public Object visitParentExpr(FracLangParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitUnaryExpr(FracLangParser.UnaryExprContext ctx) {
      Object res = null;
      Frac frac = (Frac) visit(ctx.expr());
      String op = ctx.op.getText();

      if (frac != null && op != null){

         switch (op) {
            case "+":
               res = new Frac(Math.abs(frac.numerador), frac.denomiandor);
               break;
            case "-":
               res = new Frac( (0 - frac.numerador), frac.denomiandor);
               break;
         }

      }

      return res;
   }

   @Override public Object visitAddSubExpr(FracLangParser.AddSubExprContext ctx) {
      Object res = null;
      Frac frac1 = (Frac) visit(ctx.expr(0));
      Frac frac2 = (Frac) visit(ctx.expr(1));
      String op = ctx.op.getText();

      if (frac1 != null && op != null && frac2 != null){

         switch (op) {
            case "+":
               res = new Frac((frac1.numerador * frac2.denomiandor)+(frac2.numerador * frac1.denomiandor),( frac1.denomiandor*frac2.denomiandor));
               break;
            case "-":
               res = new Frac((frac1.numerador * frac2.denomiandor)-(frac2.numerador * frac1.denomiandor),( frac1.denomiandor*frac2.denomiandor));
               break;
         }

      }

      return res;
   }


   @Override public Object visitReadExpr(FracLangParser.ReadExprContext ctx) {
      
      Frac res = null;

      String str = ctx.STR().getText();

      if (str != null){
         System.out.print(str.replace("\"", "")+": ");
         res = new Frac(sc.nextLine());
      }

      if (res.denomiandor == 0){
         res = null;
      }

      return res;

   }



   @Override public Object visitReduceExpr(FracLangParser.ReduceExprContext ctx) {
      
      Object res = null;
      Frac frac = (Frac) visit(ctx.expr());
      

      if (frac != null){

         int divisor = Frac.mdc(frac.numerador, frac.denomiandor);

         res = new Frac((frac.numerador / divisor),(frac.denomiandor / divisor));

      }

      return res;
   }

   
}
