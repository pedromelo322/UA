// Generated from TupleNum.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link TupleNumParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface TupleNumVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link TupleNumParser#main}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMain(TupleNumParser.MainContext ctx);
	/**
	 * Visit a parse tree produced by the {@code printStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrintStat(TupleNumParser.PrintStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code AtrStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAtrStat(TupleNumParser.AtrStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code listExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitListExpr(TupleNumParser.ListExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdExpr(TupleNumParser.IdExprContext ctx);
}