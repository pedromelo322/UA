import java.util.*;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends StrLangBaseVisitor<String> {

   HashMap<String,String> mapa = new HashMap<>();
   Scanner scanner = new Scanner(System.in);

   @Override public String visitExprPrint(StrLangParser.ExprPrintContext ctx) {
      String res = null;
      res = visit(ctx.expr());
      if (res != null){
         System.out.println(res);
      }
      return res;
   }

   @Override public String visitExprAssign(StrLangParser.ExprAssignContext ctx) {
      String res = null;
      res = visit(ctx.expr());
      String id = ctx.ID().getText();

      if (res != null && id != null){
         mapa.put(id,res);
      }

      return res;

   }

   @Override public String visitSTRExp(StrLangParser.STRExpContext ctx) {
      return ctx.STR().getText().replace("\"", "");
   }

   @Override public String visitIDExp(StrLangParser.IDExpContext ctx) {
      String res = null;
      res = mapa.get(ctx.ID().getText());
      return res;
   }


   @Override public String visitInputExp(StrLangParser.InputExpContext ctx) {
      String res = null;
      String e = visit(ctx.expr());
      if (e != null){
         System.out.print(e);
         res = scanner.nextLine();
      }

      return res;

   }

   @Override public String visitTrimExp(StrLangParser.TrimExpContext ctx) {
      String res = null;
      String e = visit(ctx.expr());
      if (e != null){
         res = e.replace(" ", "");
      }

      return res;
   }


   @Override public String visitRemoveExp(StrLangParser.RemoveExpContext ctx) {
      String res = null;
      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));
      if (e1 != null && e2 != null){
         res = e1.replace(e2, "");

      }

      return res;
   }


   @Override public String visitParentExp(StrLangParser.ParentExpContext ctx) {
      return visit(ctx.expr());
   }

   @Override public String visitReplaceExp(StrLangParser.ReplaceExpContext ctx) {
      String res = null;
      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));
      String e3 = visit(ctx.expr(2));


      if (e1 != null && e2 != null && e3 != null){
         res = e1.replace(e2, e3);
      }

      return res;

   }

   @Override public String visitConcatExp(StrLangParser.ConcatExpContext ctx) {
      String res = null;
      String e1 = visit(ctx.expr(0));
      String e2 = visit(ctx.expr(1));

      if (e1 != null && e2 != null){
         res = e1.concat(e2);
      }

      return res;

   }
}
