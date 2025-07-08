// Generated from TupleNum.g4 by ANTLR 4.13.2
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class TupleNumLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, ID=17, 
		TUPLE=18, REAL=19, NUM=20, COMMENT=21, WS=22;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "ID", "TUPLE", 
			"REAL", "NUM", "COMMENT", "WS"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'while'", "'do:'", "'end'", "'print'", "','", "':='", "'('", 
			"')'", "'head'", "'tail'", "'sum'", "'average'", "'+'", "'-'", "'read'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, "ID", "TUPLE", "REAL", "NUM", "COMMENT", 
			"WS"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public TupleNumLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "TupleNum.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\u0004\u0000\u0016\u009a\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014"+
		"\u0002\u0015\u0007\u0015\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002"+
		"\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003\u0001\u0003\u0001\u0003"+
		"\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004"+
		"\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006\u0001\u0006\u0001\u0007"+
		"\u0001\u0007\u0001\b\u0001\b\u0001\t\u0001\t\u0001\t\u0001\t\u0001\t\u0001"+
		"\n\u0001\n\u0001\n\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001\u000b"+
		"\u0001\u000b\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001"+
		"\f\u0001\r\u0001\r\u0001\u000e\u0001\u000e\u0001\u000f\u0001\u000f\u0001"+
		"\u000f\u0001\u000f\u0001\u000f\u0001\u0010\u0001\u0010\u0005\u0010n\b"+
		"\u0010\n\u0010\f\u0010q\t\u0010\u0001\u0011\u0001\u0011\u0001\u0011\u0001"+
		"\u0011\u0005\u0011w\b\u0011\n\u0011\f\u0011z\t\u0011\u0003\u0011|\b\u0011"+
		"\u0001\u0011\u0001\u0011\u0001\u0012\u0001\u0012\u0001\u0012\u0003\u0012"+
		"\u0083\b\u0012\u0001\u0013\u0004\u0013\u0086\b\u0013\u000b\u0013\f\u0013"+
		"\u0087\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0005\u0014\u008e"+
		"\b\u0014\n\u0014\f\u0014\u0091\t\u0014\u0001\u0014\u0001\u0014\u0001\u0014"+
		"\u0001\u0014\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u008f"+
		"\u0000\u0016\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005\u000b"+
		"\u0006\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019\r\u001b"+
		"\u000e\u001d\u000f\u001f\u0010!\u0011#\u0012%\u0013\'\u0014)\u0015+\u0016"+
		"\u0001\u0000\u0004\u0002\u0000AZaz\u0003\u000009AZaz\u0001\u000009\u0003"+
		"\u0000\t\n\r\r  \u009f\u0000\u0001\u0001\u0000\u0000\u0000\u0000\u0003"+
		"\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000\u0000\u0000\u0000\u0007"+
		"\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000\u0000\u0000\u000b\u0001"+
		"\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000\u0000\u000f\u0001\u0000"+
		"\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000\u0000\u0013\u0001\u0000"+
		"\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000\u0000\u0017\u0001\u0000"+
		"\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000\u0000\u001b\u0001\u0000"+
		"\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000\u0000\u001f\u0001\u0000"+
		"\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0000#\u0001\u0000\u0000\u0000"+
		"\u0000%\u0001\u0000\u0000\u0000\u0000\'\u0001\u0000\u0000\u0000\u0000"+
		")\u0001\u0000\u0000\u0000\u0000+\u0001\u0000\u0000\u0000\u0001-\u0001"+
		"\u0000\u0000\u0000\u0003/\u0001\u0000\u0000\u0000\u00055\u0001\u0000\u0000"+
		"\u0000\u00079\u0001\u0000\u0000\u0000\t=\u0001\u0000\u0000\u0000\u000b"+
		"C\u0001\u0000\u0000\u0000\rE\u0001\u0000\u0000\u0000\u000fH\u0001\u0000"+
		"\u0000\u0000\u0011J\u0001\u0000\u0000\u0000\u0013L\u0001\u0000\u0000\u0000"+
		"\u0015Q\u0001\u0000\u0000\u0000\u0017V\u0001\u0000\u0000\u0000\u0019Z"+
		"\u0001\u0000\u0000\u0000\u001bb\u0001\u0000\u0000\u0000\u001dd\u0001\u0000"+
		"\u0000\u0000\u001ff\u0001\u0000\u0000\u0000!k\u0001\u0000\u0000\u0000"+
		"#r\u0001\u0000\u0000\u0000%\u007f\u0001\u0000\u0000\u0000\'\u0085\u0001"+
		"\u0000\u0000\u0000)\u0089\u0001\u0000\u0000\u0000+\u0096\u0001\u0000\u0000"+
		"\u0000-.\u0005;\u0000\u0000.\u0002\u0001\u0000\u0000\u0000/0\u0005w\u0000"+
		"\u000001\u0005h\u0000\u000012\u0005i\u0000\u000023\u0005l\u0000\u0000"+
		"34\u0005e\u0000\u00004\u0004\u0001\u0000\u0000\u000056\u0005d\u0000\u0000"+
		"67\u0005o\u0000\u000078\u0005:\u0000\u00008\u0006\u0001\u0000\u0000\u0000"+
		"9:\u0005e\u0000\u0000:;\u0005n\u0000\u0000;<\u0005d\u0000\u0000<\b\u0001"+
		"\u0000\u0000\u0000=>\u0005p\u0000\u0000>?\u0005r\u0000\u0000?@\u0005i"+
		"\u0000\u0000@A\u0005n\u0000\u0000AB\u0005t\u0000\u0000B\n\u0001\u0000"+
		"\u0000\u0000CD\u0005,\u0000\u0000D\f\u0001\u0000\u0000\u0000EF\u0005:"+
		"\u0000\u0000FG\u0005=\u0000\u0000G\u000e\u0001\u0000\u0000\u0000HI\u0005"+
		"(\u0000\u0000I\u0010\u0001\u0000\u0000\u0000JK\u0005)\u0000\u0000K\u0012"+
		"\u0001\u0000\u0000\u0000LM\u0005h\u0000\u0000MN\u0005e\u0000\u0000NO\u0005"+
		"a\u0000\u0000OP\u0005d\u0000\u0000P\u0014\u0001\u0000\u0000\u0000QR\u0005"+
		"t\u0000\u0000RS\u0005a\u0000\u0000ST\u0005i\u0000\u0000TU\u0005l\u0000"+
		"\u0000U\u0016\u0001\u0000\u0000\u0000VW\u0005s\u0000\u0000WX\u0005u\u0000"+
		"\u0000XY\u0005m\u0000\u0000Y\u0018\u0001\u0000\u0000\u0000Z[\u0005a\u0000"+
		"\u0000[\\\u0005v\u0000\u0000\\]\u0005e\u0000\u0000]^\u0005r\u0000\u0000"+
		"^_\u0005a\u0000\u0000_`\u0005g\u0000\u0000`a\u0005e\u0000\u0000a\u001a"+
		"\u0001\u0000\u0000\u0000bc\u0005+\u0000\u0000c\u001c\u0001\u0000\u0000"+
		"\u0000de\u0005-\u0000\u0000e\u001e\u0001\u0000\u0000\u0000fg\u0005r\u0000"+
		"\u0000gh\u0005e\u0000\u0000hi\u0005a\u0000\u0000ij\u0005d\u0000\u0000"+
		"j \u0001\u0000\u0000\u0000ko\u0007\u0000\u0000\u0000ln\u0007\u0001\u0000"+
		"\u0000ml\u0001\u0000\u0000\u0000nq\u0001\u0000\u0000\u0000om\u0001\u0000"+
		"\u0000\u0000op\u0001\u0000\u0000\u0000p\"\u0001\u0000\u0000\u0000qo\u0001"+
		"\u0000\u0000\u0000r{\u0005[\u0000\u0000sx\u0003%\u0012\u0000tu\u0005,"+
		"\u0000\u0000uw\u0003%\u0012\u0000vt\u0001\u0000\u0000\u0000wz\u0001\u0000"+
		"\u0000\u0000xv\u0001\u0000\u0000\u0000xy\u0001\u0000\u0000\u0000y|\u0001"+
		"\u0000\u0000\u0000zx\u0001\u0000\u0000\u0000{s\u0001\u0000\u0000\u0000"+
		"{|\u0001\u0000\u0000\u0000|}\u0001\u0000\u0000\u0000}~\u0005]\u0000\u0000"+
		"~$\u0001\u0000\u0000\u0000\u007f\u0082\u0003\'\u0013\u0000\u0080\u0081"+
		"\u0005.\u0000\u0000\u0081\u0083\u0003\'\u0013\u0000\u0082\u0080\u0001"+
		"\u0000\u0000\u0000\u0082\u0083\u0001\u0000\u0000\u0000\u0083&\u0001\u0000"+
		"\u0000\u0000\u0084\u0086\u0007\u0002\u0000\u0000\u0085\u0084\u0001\u0000"+
		"\u0000\u0000\u0086\u0087\u0001\u0000\u0000\u0000\u0087\u0085\u0001\u0000"+
		"\u0000\u0000\u0087\u0088\u0001\u0000\u0000\u0000\u0088(\u0001\u0000\u0000"+
		"\u0000\u0089\u008a\u0005-\u0000\u0000\u008a\u008b\u0005-\u0000\u0000\u008b"+
		"\u008f\u0001\u0000\u0000\u0000\u008c\u008e\t\u0000\u0000\u0000\u008d\u008c"+
		"\u0001\u0000\u0000\u0000\u008e\u0091\u0001\u0000\u0000\u0000\u008f\u0090"+
		"\u0001\u0000\u0000\u0000\u008f\u008d\u0001\u0000\u0000\u0000\u0090\u0092"+
		"\u0001\u0000\u0000\u0000\u0091\u008f\u0001\u0000\u0000\u0000\u0092\u0093"+
		"\u0005\n\u0000\u0000\u0093\u0094\u0001\u0000\u0000\u0000\u0094\u0095\u0006"+
		"\u0014\u0000\u0000\u0095*\u0001\u0000\u0000\u0000\u0096\u0097\u0007\u0003"+
		"\u0000\u0000\u0097\u0098\u0001\u0000\u0000\u0000\u0098\u0099\u0006\u0015"+
		"\u0000\u0000\u0099,\u0001\u0000\u0000\u0000\u0007\u0000ox{\u0082\u0087"+
		"\u008f\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}