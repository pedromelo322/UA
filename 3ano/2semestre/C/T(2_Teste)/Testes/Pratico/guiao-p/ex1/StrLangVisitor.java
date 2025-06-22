// Generated from StrLang.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link StrLangParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface StrLangVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link StrLangParser#main}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMain(StrLangParser.MainContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprPrint}
	 * labeled alternative in {@link StrLangParser#state}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprPrint(StrLangParser.ExprPrintContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ExprAssign}
	 * labeled alternative in {@link StrLangParser#state}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprAssign(StrLangParser.ExprAssignContext ctx);
	/**
	 * Visit a parse tree produced by the {@code STRExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSTRExp(StrLangParser.STRExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code TrimExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTrimExp(StrLangParser.TrimExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code IDExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIDExp(StrLangParser.IDExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code RemoveExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRemoveExp(StrLangParser.RemoveExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ParentExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParentExp(StrLangParser.ParentExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code InputExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitInputExp(StrLangParser.InputExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ReplaceExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReplaceExp(StrLangParser.ReplaceExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ConcatExp}
	 * labeled alternative in {@link StrLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConcatExp(StrLangParser.ConcatExpContext ctx);
}