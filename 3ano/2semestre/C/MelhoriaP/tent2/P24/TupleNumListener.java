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
	 * Enter a parse tree produced by the {@code WhileStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterWhileStat(TupleNumParser.WhileStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code WhileStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitWhileStat(TupleNumParser.WhileStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code PrintStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterPrintStat(TupleNumParser.PrintStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code PrintStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitPrintStat(TupleNumParser.PrintStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AtribStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterAtribStat(TupleNumParser.AtribStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AtribStat}
	 * labeled alternative in {@link TupleNumParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitAtribStat(TupleNumParser.AtribStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code IdExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(TupleNumParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code IdExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(TupleNumParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ReadExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterReadExpr(TupleNumParser.ReadExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ReadExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitReadExpr(TupleNumParser.ReadExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code SubExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterSubExpr(TupleNumParser.SubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code SubExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitSubExpr(TupleNumParser.SubExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ParentExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterParentExpr(TupleNumParser.ParentExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ParentExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitParentExpr(TupleNumParser.ParentExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code UnaryExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpr(TupleNumParser.UnaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code UnaryExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpr(TupleNumParser.UnaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AddSubExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAddSubExpr(TupleNumParser.AddSubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AddSubExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAddSubExpr(TupleNumParser.AddSubExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TupleExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTupleExpr(TupleNumParser.TupleExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TupleExpr}
	 * labeled alternative in {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTupleExpr(TupleNumParser.TupleExprContext ctx);
}