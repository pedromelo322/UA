// Generated from TimeLang.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TimeLangParser}.
 */
public interface TimeLangListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TimeLangParser#main}.
	 * @param ctx the parse tree
	 */
	void enterMain(TimeLangParser.MainContext ctx);
	/**
	 * Exit a parse tree produced by {@link TimeLangParser#main}.
	 * @param ctx the parse tree
	 */
	void exitMain(TimeLangParser.MainContext ctx);
	/**
	 * Enter a parse tree produced by the {@code writeStat}
	 * labeled alternative in {@link TimeLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterWriteStat(TimeLangParser.WriteStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code writeStat}
	 * labeled alternative in {@link TimeLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitWriteStat(TimeLangParser.WriteStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atributStat}
	 * labeled alternative in {@link TimeLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterAtributStat(TimeLangParser.AtributStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atributStat}
	 * labeled alternative in {@link TimeLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitAtributStat(TimeLangParser.AtributStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code aritmExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAritmExpr(TimeLangParser.AritmExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code aritmExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAritmExpr(TimeLangParser.AritmExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code addSubExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAddSubExpr(TimeLangParser.AddSubExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code addSubExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAddSubExpr(TimeLangParser.AddSubExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code timeExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTimeExpr(TimeLangParser.TimeExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code timeExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTimeExpr(TimeLangParser.TimeExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code readExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterReadExpr(TimeLangParser.ReadExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code readExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitReadExpr(TimeLangParser.ReadExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code extractExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExtractExpr(TimeLangParser.ExtractExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code extractExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExtractExpr(TimeLangParser.ExtractExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ParentExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterParentExpr(TimeLangParser.ParentExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ParentExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitParentExpr(TimeLangParser.ParentExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code divMulExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterDivMulExpr(TimeLangParser.DivMulExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code divMulExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitDivMulExpr(TimeLangParser.DivMulExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(TimeLangParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(TimeLangParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code timeUnit}
	 * labeled alternative in {@link TimeLangParser#time}.
	 * @param ctx the parse tree
	 */
	void enterTimeUnit(TimeLangParser.TimeUnitContext ctx);
	/**
	 * Exit a parse tree produced by the {@code timeUnit}
	 * labeled alternative in {@link TimeLangParser#time}.
	 * @param ctx the parse tree
	 */
	void exitTimeUnit(TimeLangParser.TimeUnitContext ctx);
}