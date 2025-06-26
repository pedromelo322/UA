// Generated from TimeLang.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link TimeLangParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface TimeLangVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link TimeLangParser#main}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMain(TimeLangParser.MainContext ctx);
	/**
	 * Visit a parse tree produced by the {@code writeStat}
	 * labeled alternative in {@link TimeLangParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWriteStat(TimeLangParser.WriteStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code atributStat}
	 * labeled alternative in {@link TimeLangParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAtributStat(TimeLangParser.AtributStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code aritmExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAritmExpr(TimeLangParser.AritmExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code addSubExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAddSubExpr(TimeLangParser.AddSubExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code timeExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTimeExpr(TimeLangParser.TimeExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code readExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReadExpr(TimeLangParser.ReadExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code extractExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExtractExpr(TimeLangParser.ExtractExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ParentExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParentExpr(TimeLangParser.ParentExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code divMulExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDivMulExpr(TimeLangParser.DivMulExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code idExpr}
	 * labeled alternative in {@link TimeLangParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIdExpr(TimeLangParser.IdExprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code timeUnit}
	 * labeled alternative in {@link TimeLangParser#time}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTimeUnit(TimeLangParser.TimeUnitContext ctx);
}