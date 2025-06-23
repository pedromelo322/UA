// Generated from TupleNum.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TupleNumParser}.
 */
public interface TupleNumListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TupleNumParser#main}.
	 * @param ctx the parse tree
	 */
	void enterMain(TupleNumParser.MainContext ctx);
	/**
	 * Exit a parse tree produced by {@link TupleNumParser#main}.
	 * @param ctx the parse tree
	 */
	void exitMain(TupleNumParser.MainContext ctx);
	/**
	 * Enter a parse tree produced by the {@code printStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterPrintStat(TupleNumParser.PrintStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code printStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitPrintStat(TupleNumParser.PrintStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AtrStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterAtrStat(TupleNumParser.AtrStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AtrStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitAtrStat(TupleNumParser.AtrStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code listExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterListExpr(TupleNumParser.ListExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code listExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitListExpr(TupleNumParser.ListExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(TupleNumParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(TupleNumParser.IdExprContext ctx);
}