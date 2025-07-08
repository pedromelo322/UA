import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends TupleNumBaseVisitor<Object> {



   HashMap<String, Object> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public Object visitPrintStat(TupleNumParser.PrintStatContext ctx) {
      String res = "";
      Object e;
      
      for (int i = 0; i < ctx.type().size(); i++){

         e = visit(ctx.type(i));

         if (e == null){
            return null;
         }

         res = res + e;

      }

      System.out.println(res);


      return res;
   }

   @Override public Object visitAtribStat(TupleNumParser.AtribStatContext ctx) {
      Object res = visit(ctx.type());
      String id = ctx.ID().getText();

      if (id != null && res != null){
         mapa.put(id,res);
      }

      
      return res;
   }



   @Override public Object visitIterativeStat(TupleNumParser.IterativeStatContext ctx) {
      Tuple e;
      while(true){
         e = (Tuple) visit(ctx.expr()); 
         if (e!=null && !e.isValid()){
            break;
         }
         for(int i=0; i<ctx.stat().size(); i++){
            visit(ctx.stat(i));
         }
      }

      return e;
   }

   @Override public Object visitUnaryExpr(TupleNumParser.UnaryExprContext ctx) {
      Object res = null;
      Tuple e = (Tuple) visit(ctx.expr());

      if (e != null){
         switch (ctx.op.getText()) {
            case "+":
               res = Tuple.absTuple(e);
               break;
         
            case "-":
               res = Tuple.negTuple(e);
               break;
         }
      }



      return res;
   }

   @Override public Object visitAddSubExpr(TupleNumParser.AddSubExprContext ctx) {
      Object res = null;
      Tuple e1 = (Tuple) visit(ctx.expr(0));
      Tuple e2 = (Tuple) visit(ctx.expr(1));

      if (e1 != null && e2 != null){
         switch (ctx.op.getText()) {
            case "+":
               res = Tuple.addTuple(e1,e2);
               break;
         
            case "-":
               res = Tuple.subTuple(e1,e2);
               break;
         }
      }



      return res;
   }

   @Override public Object visitParentExpr(TupleNumParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitTupleExpr(TupleNumParser.TupleExprContext ctx) {       
      return new Tuple(ctx.getText());

   }

   @Override public Object visitSubTupleExpr(TupleNumParser.SubTupleExprContext ctx) {
      Object res = null;
      Tuple e = (Tuple) visit(ctx.expr());

      if (e != null){
         switch (ctx.op.getText()) {
            case "head":
               res = Tuple.headTuple(e);
               break;
         
            case "tail":
               res = Tuple.tailTuple(e);
               break;

            case "sum":
               res = Tuple.sumTuple(e);
               break;
         
            case "average":
               res = Tuple.averageTuple(e);
               break;
         }
      }



      return res;
   }
   

   @Override public Object visitIdExpr(TupleNumParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public Object visitReadExpr(TupleNumParser.ReadExprContext ctx) {
      
      return new Tuple(sc.nextLine());

   }


   @Override public Object visitStrType(TupleNumParser.StrTypeContext ctx) {
      return ctx.STR().getText().replace("\"","");
   }


   @Override public Object visitExprType(TupleNumParser.ExprTypeContext ctx) {
      return visit(ctx.expr());
   }
}
