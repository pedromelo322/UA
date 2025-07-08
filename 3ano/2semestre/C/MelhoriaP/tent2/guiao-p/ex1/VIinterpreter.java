import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends StrLangBaseVisitor<String> {

   

   HashMap<String, String> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public String visitPrintStat(StrLangParser.PrintStatContext ctx) {
      String res = visit(ctx.expr());

      if (res != null){
         System.out.println(res);
      }

      return res;

   }

   @Override public String visitAtribStat(StrLangParser.AtribStatContext ctx) {
      String res = visit(ctx.expr());
      String id = ctx.ID().getText();

      if (id != null && res != null){
        mapa.put(id, res); 
      } 
      
      return res;
   }

   @Override public String visitInputStat(StrLangParser.InputStatContext ctx) {
      String outStatment = visit(ctx.expr());
      String res = null;

      if (outStatment != null){
         System.out.print(outStatment);

         res = sc.nextLine();

      }


      return res;
   }

   @Override public String visitParentStat(StrLangParser.ParentStatContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitIdExpr(StrLangParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public String visitTrimStat(StrLangParser.TrimStatContext ctx) {
      String res = visit(ctx.expr());

      if (res != null){
         res = res.trim();
      }
      
      return res;
   }

   @Override public String visitStrExpr(StrLangParser.StrExprContext ctx) {
      return ctx.STR().getText().replace("\"","");   
   }

   @Override public String visitReplaceStat(StrLangParser.ReplaceStatContext ctx) {
      String expr1 = visit(ctx.expr(0));
      String expr2 = visit(ctx.expr(1));
      String expr3 = visit(ctx.expr(2));
      String res = null;

      if (expr3 != null && expr1 != null && expr2 != null){

         res = expr1.replace(expr2, expr3);
         
      }
      
      return res;
   }

   @Override public String visitAddSubStat(StrLangParser.AddSubStatContext ctx) {
      String expr1 = visit(ctx.expr(0));
      String expr2 = visit(ctx.expr(1));
      String op = ctx.op.getText();
      String res = null;

      if (op != null && expr1 != null && expr2 != null){

         switch(op){
            case "+":
               res = expr1.concat(expr2);
               break;
            case "-":
               res = expr1.replace(expr2, "");
               break;
         }
      }


      
      return res;
   }
}
