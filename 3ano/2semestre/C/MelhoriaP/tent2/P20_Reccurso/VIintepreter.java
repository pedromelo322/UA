import java.util.HashMap;

@SuppressWarnings("CheckReturnValue")
public class VIintepreter extends LangComplexBaseVisitor<Object> {


   HashMap<String,Imaginary> mapa = new HashMap<>();

   @Override public Object visitDisplayStat(LangComplexParser.DisplayStatContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitAtribStat(LangComplexParser.AtribStatContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitUnaryExpr(LangComplexParser.UnaryExprContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitAddSubExpr(LangComplexParser.AddSubExprContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitRealExpr(LangComplexParser.RealExprContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitTypesExpr(LangComplexParser.TypesExprContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitImagExpr(LangComplexParser.ImagExprContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitMulDivExpr(LangComplexParser.MulDivExprContext ctx) {
      Object res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Object visitParentExpr(LangComplexParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitIdType(LangComplexParser.IdTypeContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public Object visitCompType(LangComplexParser.CompTypeContext ctx) {
      Object res = null;

      String comp = ctx.COMP().getText();
      String[] compSplit;

      if (comp.contains("+")){
         compSplit = comp.split("+");
      }else if (comp.contains("-")){
         compSplit = comp.split("-");
         compSplit[1] = "-" + compSplit[1];
      }else{
         compSplit = new String[2];
         if (comp.contains("i")){
            compSplit[0] = "0";
            compSplit[1] = comp.replace("i", "");
         }else{
            compSplit[0] = comp;
            compSplit[1] = "0";
         }
      }

      res = new Imaginary(Double.parseDouble(compSplit[0]), Integer.parseInt(compSplit[1].replace("i", "")));

      return res;
   }
}
