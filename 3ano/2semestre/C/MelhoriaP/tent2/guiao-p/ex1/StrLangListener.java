// Generated from StrLang.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link StrLangParser}.
 */
public interface StrLangListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link StrLangParser#main}.
	 * @param ctx the parse tree
	 */
	void enterMain(StrLangParser.MainContext ctx);
	/**
	 * Exit a parse tree produced by {@link StrLangParser#main}.
	 * @param ctx the parse tree
	 */
	void exitMain(StrLangParser.MainContext ctx);
	/**
	 * Enter a parse tree produced by the {@code printStat}
	 * labeled alternative in {@link StrLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterPrintStat(StrLangParser.PrintStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code printStat}
	 * labeled alternative in {@link StrLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitPrintStat(StrLangParser.PrintStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atribStat}
	 * labeled alternative in {@link StrLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterAtribStat(StrLangParser.AtribStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atribStat}
	 * labeled alternative in {@link StrLangParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitAtribStat(StrLangParser.AtribStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code inputStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterInputStat(StrLangParser.InputStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code inputStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitInputStat(StrLangParser.InputStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parentStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterParentStat(StrLangParser.ParentStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parentStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitParentStat(StrLangParser.ParentStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code IdExpr}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIdExpr(StrLangParser.IdExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code IdExpr}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIdExpr(StrLangParser.IdExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code trimStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTrimStat(StrLangParser.TrimStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code trimStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTrimStat(StrLangParser.TrimStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code StrExpr}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterStrExpr(StrLangParser.StrExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code StrExpr}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitStrExpr(StrLangParser.StrExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code replaceStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterReplaceStat(StrLangParser.ReplaceStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code replaceStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitReplaceStat(StrLangParser.ReplaceStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code addSubStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAddSubStat(StrLangParser.AddSubStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code addSubStat}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAddSubStat(StrLangParser.AddSubStatContext ctx);
}