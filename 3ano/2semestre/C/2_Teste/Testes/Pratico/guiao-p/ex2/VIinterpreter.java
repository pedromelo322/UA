import java.util.HashMap;
import java.util.Scanner;

@SuppressWarnings("CheckReturnValue")
public class VIinterpreter extends FracLangBaseVisitor<Object> {


   HashMap<String, Object> mapa = new HashMap<>();
   Scanner sc = new Scanner(System.in);

   @Override public Object visitPrintExp(FracLangParser.PrintExpContext ctx) {
      Object res = null;
   
      res = visit(ctx.expr());

      if (res != null){
         System.out.println(res);
      }

      return res;
   }

   @Override public Object visitAtributionExp(FracLangParser.AtributionExpContext ctx) {
      Object res = null;
      String id = ctx.ID().getText();
      res = visit(ctx.expr());

      mapa.put(id, res);

      return res;
      
   }


   @Override public Object visitInputExp(FracLangParser.InputExpContext ctx) {
      Object res = null;
      String str = ctx.STR().getText();
      if (str != null){
         System.out.print(str.replace("\"", "") + ": ");
         res = Fraction.toFraction(sc.nextLine());
      }

      return res;
      
   }


   @Override public Object visitMuldivExp(FracLangParser.MuldivExpContext ctx) {
      Object res = null;
      Object e1 = visit(ctx.expr(0));
      Object e2 = visit(ctx.expr(1));
      if (e1!=null && e2!=null){
         switch(ctx.op.getText()){
            case "*":
               res = Fraction.mul((Fraction) e1 ,(Fraction) e2);
               break;
            case ":":
               res = Fraction.div((Fraction) e1 ,(Fraction) e2);
               break;
         }
      }
      return res;
   }

   @Override public Object visitAddsubExp(FracLangParser.AddsubExpContext ctx) {
      Object res = null;
      Object e1 = visit(ctx.expr(0));
      Object e2 = visit(ctx.expr(1));
      if (e1!=null && e2!=null){
         switch(ctx.op.getText()){
            case "+":
               res = Fraction.add((Fraction) e1 ,(Fraction) e2);
               break;
            case "-":
               res = Fraction.sub((Fraction) e1 ,(Fraction) e2);
               break;
         }
      }
      return res;
   }

   @Override public Object visitIdExp(FracLangParser.IdExpContext ctx) {
      return mapa.get(ctx.ID().getText());
   }

   @Override public Object visitUnaryExp(FracLangParser.UnaryExpContext ctx) {
      Object res = null;
      Fraction e = (Fraction) visit(ctx.expr());
      switch (ctx.op.getText()) {
         case "+":
            e.pos();
            res = e;
            break;
      
         case "-":
            e.neg();
            res = e;
            break;
      }

      return res;

   }

   @Override public Object visitFracExp(FracLangParser.FracExpContext ctx) {
      Object res = null;
      Integer numerador =  ((Fraction) visit(ctx.expr(0))).getNumerador();
      Integer denominador = ((Fraction) visit(ctx.expr(1))).getNumerador();
      if (denominador != null && numerador != null &&  denominador != 0){
         Fraction frac = new Fraction();
         frac.setNumerador(numerador); 
         frac.setDenominador(denominador);

         res = (Object) frac;
         
      }

      return res;
      
   }

   @Override public Object visitNumExp(FracLangParser.NumExpContext ctx) {
      Fraction res = new Fraction();
      res.setNumerador(Integer.parseInt(ctx.NUM().getText()));
      res.setDenominador(1);
      return res;
   }

   @Override public Object visitParentExp(FracLangParser.ParentExpContext ctx) {
      return visit(ctx.expr());
   }
}
