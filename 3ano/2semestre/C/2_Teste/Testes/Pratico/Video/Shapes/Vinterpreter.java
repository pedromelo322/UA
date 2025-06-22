@SuppressWarnings("CheckReturnValue")
public class Vinterpreter extends ShapesBaseVisitor<Object> {

   @Override public Object visitState(ShapesParser.StateContext ctx) {
      Double res = null;
      res = (Double)visit(ctx.expr());
      if (res != null){
         System.out.println("Result: " + res);
      }

      return res;
   }

   @Override public Object visitDistance(ShapesParser.DistanceContext ctx) {
      Object res = null;
      Point p1 = (Point)visit(ctx.point(0));
      Point p2 = (Point)visit(ctx.point(1));

      if (p1 != null && p2 != null){
         res = p1.distanceTo(p2);
      }

      return res;
   }

   @Override public Object visitPoint(ShapesParser.PointContext ctx) {
      Object res = null;
      Double x = (Double)visit(ctx.x);
      Double y = (Double)visit(ctx.y);

      if (x != null && y != null){
         res = new Point(x,y);
      }


      return res;
   }

   @Override public Object visitExpMultDib(ShapesParser.ExpMultDibContext ctx) {
      Object res = null;
      Double e1 = (Double)visit(ctx.expr(0));
      Double e2 = (Double)visit(ctx.expr(1));


      if (e1 != null && e2 != null){
         switch(ctx.op.getText()){
            case "*":
               res = e1 * e2;
               break;
            case "/":
               if (e2 != 0){
                  res = e1/e2;
               }
               break;
         }
      }

      return res;
   }

   @Override public Object visitExpNum(ShapesParser.ExpNumContext ctx) {
      return Double.parseDouble(ctx.NUM().getText());
   }

   @Override public Object visitExpParentices(ShapesParser.ExpParenticesContext ctx) {
      return visit(ctx.expr());
   }

   @Override public Object visitExpDistance(ShapesParser.ExpDistanceContext ctx) {
      return visit(ctx.distance());
   }

   @Override public Object visitExpAddSub(ShapesParser.ExpAddSubContext ctx) {
      Object res = null;
      Double e1 = (Double)visit(ctx.expr(0));
      Double e2 = (Double)visit(ctx.expr(1));

      if (e1 != null && e2 != null){
         switch(ctx.op.getText()){
            case "+":
               res = e1 + e2;
               break;
            case "-":
               res = e1-e2;
               break;
         }
      }

      return res;
   }
}
