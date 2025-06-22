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
	 * Enter a parse tree produced by the {@code ExprPrint}
	 * labeled alternative in {@link StrLangParser#state}.
	 * @param ctx the parse tree
	 */
	void enterExprPrint(StrLangParser.ExprPrintContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprPrint}
	 * labeled alternative in {@link StrLangParser#state}.
	 * @param ctx the parse tree
	 */
	void exitExprPrint(StrLangParser.ExprPrintContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprAssign}
	 * labeled alternative in {@link StrLangParser#state}.
	 * @param ctx the parse tree
	 */
	void enterExprAssign(StrLangParser.ExprAssignContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprAssign}
	 * labeled alternative in {@link StrLangParser#state}.
	 * @param ctx the parse tree
	 */
	void exitExprAssign(StrLangParser.ExprAssignContext ctx);
	/**
	 * Enter a parse tree produced by the {@code STRExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterSTRExp(StrLangParser.STRExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code STRExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitSTRExp(StrLangParser.STRExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code TrimExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterTrimExp(StrLangParser.TrimExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code TrimExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitTrimExp(StrLangParser.TrimExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code IDExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIDExp(StrLangParser.IDExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code IDExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIDExp(StrLangParser.IDExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code RemoveExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterRemoveExp(StrLangParser.RemoveExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code RemoveExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitRemoveExp(StrLangParser.RemoveExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ParentExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterParentExp(StrLangParser.ParentExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ParentExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitParentExp(StrLangParser.ParentExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code InputExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterInputExp(StrLangParser.InputExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code InputExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitInputExp(StrLangParser.InputExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ReplaceExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterReplaceExp(StrLangParser.ReplaceExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ReplaceExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitReplaceExp(StrLangParser.ReplaceExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ConcatExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterConcatExp(StrLangParser.ConcatExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ConcatExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitConcatExp(StrLangParser.ConcatExpContext ctx);
}