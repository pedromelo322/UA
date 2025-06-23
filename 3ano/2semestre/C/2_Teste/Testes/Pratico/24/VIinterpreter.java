import java.util.*;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends TupleNumBaseVisitor<Object> {


   HashMap<Object, Object> mapa = new HashMap<>();

   @Override public Object visitPrintStat(TupleNumParser.PrintStatContext ctx) {
      String res = "";

      boolean notNull = true;

      for (int i = 0; i < ctx.expr().size(); i++){
         String e = visit(ctx.expr(i)).toString();
         res = res + e + ",";
      }

      if (res != ""){
         System.out.println(res.substring(0, res.length()-1));
      }else{
         System.out.println("");
      }
      

      return res;

   }

   @Override public Object visitAtrStat(TupleNumParser.AtrStatContext ctx) {
      Object res = null;
      Object id = ctx.ID().getText();
      Object e = visit(ctx.expr());

      if (id != null && e != null){
         mapa.put(id, e);
         res = e;
      }

      return res;

   }

   @Override public Object visitListExpr(TupleNumParser.ListExprContext ctx) {


      ArrayList<Double> lista = new ArrayList<>();

      String listTxt = ctx.getText();
      listTxt = listTxt.substring(1,listTxt.length()-1);
      String[] listSplitTxt = listTxt.split(",");

      for (int i = 0; i < listSplitTxt.length; i++){
         lista.add(Double.parseDouble(listSplitTxt[i]));
      }


      return lista;




   }

   @Override public Object visitIdExpr(TupleNumParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }
}
