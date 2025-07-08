import java.util.HashMap;
import java.util.Scanner;
import java.util.ArrayList;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends TupleNumBaseVisitor<Object> {


   HashMap<String,ArrayList<Double>> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public Object visitPrintStat(TupleNumParser.PrintStatContext ctx) {
      StringBuilder output = new StringBuilder();
      ArrayList<Double> array;

      for(int i=0; i<ctx.expr().size(); i++){
         array = (ArrayList<Double>) visit(ctx.expr(i));
         if (array == null){
            return null;
         }

         output.append(array.toString());
      }


      System.out.println(output);

      return output;
   }

   @Override public Object visitAtribStat(TupleNumParser.AtribStatContext ctx) {
      Object res = null;
      
      String id = ctx.ID().getText();
      ArrayList<Double> array = (ArrayList<Double>) visit(ctx.expr());
      
      if (array != null && id != null){

         mapa.put(id, array);

      }


      res = array;



      return res;
   }

   @Override public Object visitIdExpr(TupleNumParser.IdExprContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public Object visitSubExpr(TupleNumParser.SubExprContext ctx) {
      Object res = null;
      
      String op = ctx.op.getText();
      ArrayList<Double> array = (ArrayList<Double>) visit(ctx.expr());
      ArrayList<Double> newArray = new ArrayList<>();
      Double num = 0.0;

      if (op!=null && array != null){
         switch (op) {
            case "head":
               newArray.add(array.get(0));
               break;
         
            case "tail":
               newArray.addAll(array.subList(1, array.size()));
               break;

            case "sum":
               for (int i = 0; i < array.size(); i++) {
                  num += array.get(i);
               }
               newArray.add(num);
               break;

            case "average":
               for (int i = 0; i < array.size(); i++) {
                  num += array.get(i);
               }
               num = num / array.size();
               newArray.add(num);
               break;
         }
         res = newArray;
      }

      

      

      return res;
   }

   @Override public Object visitParentExpr(TupleNumParser.ParentExprContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitUnaryExpr(TupleNumParser.UnaryExprContext ctx) {
      Object res = null;
      
      String op = ctx.op.getText();
      ArrayList<Double> array = (ArrayList<Double>) visit(ctx.expr());
      ArrayList<Double> newArray = new ArrayList<>();

      if (op!=null && array != null){
         switch (op) {
            case "+":
               for (int i = 0; i < array.size(); i++) {
                  newArray.add(Math.abs(array.get(i)));
               }
               break;
         
            case "-":
               for (int i = 0; i < array.size(); i++) {
                  newArray.add(0 - array.get(i));
               }
               break;
         }
      }

      res = newArray;

      return res;
   }

   @Override public Object visitAddSubExpr(TupleNumParser.AddSubExprContext ctx) {
      Object res = null;
      
      String op = ctx.op.getText();
      ArrayList<Double> array1 = (ArrayList<Double>) visit(ctx.expr(0));
      ArrayList<Double> newArray = new ArrayList<>();
      ArrayList<Double> array2 = (ArrayList<Double>) visit(ctx.expr(1));

      if (op!=null && array1 != null && array2 != null){
         if (array1.size() < array2.size()){
            ArrayList<Double> temp = array1;
            array1 = array2;
            array2 = temp;
         }
         switch (op) {
            case "+":
               for (int i = 0; i < array2.size(); i++) {
                     newArray.add(array1.get(i)+array2.get(i));
                  }
                  newArray.addAll(array1.subList(array2.size(), array1.size()));
               break;
         
            case "-":
               for (int i = 0; i < array2.size(); i++) {
                     newArray.add(array1.get(i)-array2.get(i));
                  }
                  newArray.addAll(array1.subList(array2.size(), array1.size()));
               break;
         }
      }

      res = newArray;

      return res;
   }

   @Override public Object visitTupleExpr(TupleNumParser.TupleExprContext ctx) {
      Object res = null;

      String[] tuplo = ctx.TUPLE().getText().replace("[", "").replace("]","").split(",");
      
      
      if (tuplo != null && tuplo[0] != ""){

         ArrayList<Double> array = new ArrayList<>();

         for (int i = 0; i < tuplo.length; i++){
            array.add(Double.parseDouble(tuplo[i]));
         }

         res = array;

      }


      return res;
   }


   @Override public Object visitReadExpr(TupleNumParser.ReadExprContext ctx) {
      Object res = null;

      String[] tuplo = sc.nextLine().split(",");
      
      
      if (tuplo != null && tuplo[0] != ""){

         ArrayList<Double> array = new ArrayList<>();

         for (int i = 0; i < tuplo.length; i++){
            array.add(Double.parseDouble(tuplo[i]));
         }

         res = array;

      }


      return res;
   }


   @Override public Object visitWhileStat(TupleNumParser.WhileStatContext ctx) {
      Object res = null;

      while(validateTuple( (ArrayList<Double>) visit(ctx.expr()))){

         for (int i = 0; i < ctx.stat().size(); i++) {
            visit(ctx.stat(i));
         }

      }

      return res;
   }


   private boolean validateTuple(ArrayList<Double> booleanTuple){
      for (Double double1 : booleanTuple) {
         if (double1 != 0.0){
            return true;
         }
      }

      return false;
   }
}
