import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends StrLangBaseVisitor<String> {

   HashMap<String, String> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public String visitPrintExpr(StrLangParser.PrintExprContext ctx) {
      String res = visit(ctx.expr());


      if (res != null){
         System.out.println(res);
      }

      return res;
   }

   @Override public String visitAtribExpr(StrLangParser.AtribExprContext ctx) {
      String res = visit(ctx.expr());
      String id = ctx.ID().getText();

      if (res != null && id != null){
         mapa.put(id,res);
      }

      return res;
   
   }

   @Override public String visitReplaceExpr(StrLangParser.ReplaceExprContext ctx) {
      String res = null;
      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));
      String e3 = visit(ctx.expr(2));

      if (e1 != null && e2 != null && e3 != null){
         res = e1.replace(e2, e3);
      }

      return res;
   }

   @Override public String visitInputExpr(StrLangParser.InputExprContext ctx) {
      String res = null;
      String e = visit(ctx.expr());
      

      if (e != null){

         System.out.println(e);

         res = sc.nextLine();
      }



      return res;
   }

   @Override public String visitStrExpr(StrLangParser.StrExprContext ctx) {
      return ctx.STR().getText().replace("\"", "");
   }

   @Override public String visitTrimExpr(StrLangParser.TrimExprContext ctx) {
      String res = null;
      String e = visit(ctx.expr());

      if (e != null){
         res = e.trim();
      }

      return res;
   }

   @Override public String visitParentExpr(StrLangParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitContactExpr(StrLangParser.ContactExprContext ctx) {
      String res = null;
      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));

      if (e1 != null && e2 != null){
         res = e1.concat(e2);
      }

      return res;

   }

   @Override public String visitRemoveExpr(StrLangParser.RemoveExprContext ctx) {
      String res = null;
      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));

      if (e1 != null && e2 != null){
         res = e1.replace(e2, "");
      }

      return res;
   }

   @Override public String visitIdExpr(StrLangParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }
}
