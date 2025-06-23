// Generated from /home/pedromelo1316/Documents/UA/3ano/2semestre/C/2_Teste/Testes/Pratico/24/TupleNum.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TupleNumParser}.
 */
public interface TupleNumListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TupleNumParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(TupleNumParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link TupleNumParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(TupleNumParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by the {@code printStatement}
	 * labeled alternative in {@link TupleNumParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterPrintStatement(TupleNumParser.PrintStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code printStatement}
	 * labeled alternative in {@link TupleNumParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitPrintStatement(TupleNumParser.PrintStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assignStatement}
	 * labeled alternative in {@link TupleNumParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterAssignStatement(TupleNumParser.AssignStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assignStatement}
	 * labeled alternative in {@link TupleNumParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitAssignStatement(TupleNumParser.AssignStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link TupleNumParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterEmptyStatement(TupleNumParser.EmptyStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link TupleNumParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitEmptyStatement(TupleNumParser.EmptyStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link TupleNumParser#printStmt}.
	 * @param ctx the parse tree
	 */
	void enterPrintStmt(TupleNumParser.PrintStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link TupleNumParser#printStmt}.
	 * @param ctx the parse tree
	 */
	void exitPrintStmt(TupleNumParser.PrintStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link TupleNumParser#assignStmt}.
	 * @param ctx the parse tree
	 */
	void enterAssignStmt(TupleNumParser.AssignStmtContext ctx);
	/**
	 * Exit a parse tree produced by {@link TupleNumParser#assignStmt}.
	 * @param ctx the parse tree
	 */
	void exitAssignStmt(TupleNumParser.AssignStmtContext ctx);
	/**
	 * Enter a parse tree produced by {@link TupleNumParser#exprList}.
	 * @param ctx the parse tree
	 */
	void enterExprList(TupleNumParser.ExprListContext ctx);
	/**
	 * Exit a parse tree produced by {@link TupleNumParser#exprList}.
	 * @param ctx the parse tree
	 */
	void exitExprList(TupleNumParser.ExprListContext ctx);
	/**
	 * Enter a parse tree produced by {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(TupleNumParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link TupleNumParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(TupleNumParser.ExprContext ctx);
}