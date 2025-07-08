// Generated from /home/pedromelo1316/Documents/UA/3ano/2semestre/C/MelhoriaP/tent2/P25/TimeLang.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class TimeLangLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, TIME=19, Hour=20, Min=21, Sec=22, ID=23, STR=24, NUM=25, WS=26, 
		COMMENT=27;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "T__16", 
			"T__17", "TIME", "Hour", "Min", "Sec", "ID", "STR", "NUM", "WS", "COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'write'", "','", "':='", "'while'", "'do'", "'end'", "'('", 
			"')'", "'h'", "'m'", "'s'", "'+'", "'-'", "'*'", "'/'", "'%'", "'read'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, "TIME", "Hour", "Min", "Sec", 
			"ID", "STR", "NUM", "WS", "COMMENT"
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


	public TimeLangLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "TimeLang.g4"; }

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
		"\u0004\u0000\u001b\u00aa\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014"+
		"\u0002\u0015\u0007\u0015\u0002\u0016\u0007\u0016\u0002\u0017\u0007\u0017"+
		"\u0002\u0018\u0007\u0018\u0002\u0019\u0007\u0019\u0002\u001a\u0007\u001a"+
		"\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003"+
		"\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004"+
		"\u0001\u0004\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006"+
		"\u0001\u0006\u0001\u0006\u0001\u0007\u0001\u0007\u0001\b\u0001\b\u0001"+
		"\t\u0001\t\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001\f\u0001\f\u0001"+
		"\r\u0001\r\u0001\u000e\u0001\u000e\u0001\u000f\u0001\u000f\u0001\u0010"+
		"\u0001\u0010\u0001\u0011\u0001\u0011\u0001\u0011\u0001\u0011\u0001\u0011"+
		"\u0001\u0012\u0001\u0012\u0003\u0012m\b\u0012\u0001\u0012\u0003\u0012"+
		"p\b\u0012\u0001\u0012\u0001\u0012\u0003\u0012t\b\u0012\u0001\u0012\u0003"+
		"\u0012w\b\u0012\u0001\u0013\u0001\u0013\u0001\u0013\u0001\u0014\u0001"+
		"\u0014\u0001\u0014\u0001\u0015\u0001\u0015\u0001\u0015\u0001\u0016\u0001"+
		"\u0016\u0005\u0016\u0084\b\u0016\n\u0016\f\u0016\u0087\t\u0016\u0001\u0017"+
		"\u0001\u0017\u0005\u0017\u008b\b\u0017\n\u0017\f\u0017\u008e\t\u0017\u0001"+
		"\u0017\u0001\u0017\u0001\u0018\u0004\u0018\u0093\b\u0018\u000b\u0018\f"+
		"\u0018\u0094\u0001\u0019\u0001\u0019\u0001\u0019\u0001\u0019\u0001\u001a"+
		"\u0001\u001a\u0001\u001a\u0001\u001a\u0001\u001a\u0005\u001a\u00a0\b\u001a"+
		"\n\u001a\f\u001a\u00a3\t\u001a\u0001\u001a\u0001\u001a\u0001\u001a\u0001"+
		"\u001a\u0001\u001a\u0001\u001a\u0002\u008c\u00a1\u0000\u001b\u0001\u0001"+
		"\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006\r\u0007\u000f"+
		"\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019\r\u001b\u000e\u001d\u000f"+
		"\u001f\u0010!\u0011#\u0012%\u0013\'\u0014)\u0015+\u0016-\u0017/\u0018"+
		"1\u00193\u001a5\u001b\u0001\u0000\u0004\u0002\u0000AZaz\u0003\u000009"+
		"AZaz\u0001\u000009\u0003\u0000\t\n\r\r  \u00b2\u0000\u0001\u0001\u0000"+
		"\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000"+
		"\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000"+
		"\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000"+
		"\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000"+
		"\u0000\u0013\u0001\u0000\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000"+
		"\u0000\u0017\u0001\u0000\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000"+
		"\u0000\u001b\u0001\u0000\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000"+
		"\u0000\u001f\u0001\u0000\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0000"+
		"#\u0001\u0000\u0000\u0000\u0000%\u0001\u0000\u0000\u0000\u0000\'\u0001"+
		"\u0000\u0000\u0000\u0000)\u0001\u0000\u0000\u0000\u0000+\u0001\u0000\u0000"+
		"\u0000\u0000-\u0001\u0000\u0000\u0000\u0000/\u0001\u0000\u0000\u0000\u0000"+
		"1\u0001\u0000\u0000\u0000\u00003\u0001\u0000\u0000\u0000\u00005\u0001"+
		"\u0000\u0000\u0000\u00017\u0001\u0000\u0000\u0000\u00039\u0001\u0000\u0000"+
		"\u0000\u0005?\u0001\u0000\u0000\u0000\u0007A\u0001\u0000\u0000\u0000\t"+
		"D\u0001\u0000\u0000\u0000\u000bJ\u0001\u0000\u0000\u0000\rM\u0001\u0000"+
		"\u0000\u0000\u000fQ\u0001\u0000\u0000\u0000\u0011S\u0001\u0000\u0000\u0000"+
		"\u0013U\u0001\u0000\u0000\u0000\u0015W\u0001\u0000\u0000\u0000\u0017Y"+
		"\u0001\u0000\u0000\u0000\u0019[\u0001\u0000\u0000\u0000\u001b]\u0001\u0000"+
		"\u0000\u0000\u001d_\u0001\u0000\u0000\u0000\u001fa\u0001\u0000\u0000\u0000"+
		"!c\u0001\u0000\u0000\u0000#e\u0001\u0000\u0000\u0000%v\u0001\u0000\u0000"+
		"\u0000\'x\u0001\u0000\u0000\u0000){\u0001\u0000\u0000\u0000+~\u0001\u0000"+
		"\u0000\u0000-\u0081\u0001\u0000\u0000\u0000/\u0088\u0001\u0000\u0000\u0000"+
		"1\u0092\u0001\u0000\u0000\u00003\u0096\u0001\u0000\u0000\u00005\u009a"+
		"\u0001\u0000\u0000\u000078\u0005;\u0000\u00008\u0002\u0001\u0000\u0000"+
		"\u00009:\u0005w\u0000\u0000:;\u0005r\u0000\u0000;<\u0005i\u0000\u0000"+
		"<=\u0005t\u0000\u0000=>\u0005e\u0000\u0000>\u0004\u0001\u0000\u0000\u0000"+
		"?@\u0005,\u0000\u0000@\u0006\u0001\u0000\u0000\u0000AB\u0005:\u0000\u0000"+
		"BC\u0005=\u0000\u0000C\b\u0001\u0000\u0000\u0000DE\u0005w\u0000\u0000"+
		"EF\u0005h\u0000\u0000FG\u0005i\u0000\u0000GH\u0005l\u0000\u0000HI\u0005"+
		"e\u0000\u0000I\n\u0001\u0000\u0000\u0000JK\u0005d\u0000\u0000KL\u0005"+
		"o\u0000\u0000L\f\u0001\u0000\u0000\u0000MN\u0005e\u0000\u0000NO\u0005"+
		"n\u0000\u0000OP\u0005d\u0000\u0000P\u000e\u0001\u0000\u0000\u0000QR\u0005"+
		"(\u0000\u0000R\u0010\u0001\u0000\u0000\u0000ST\u0005)\u0000\u0000T\u0012"+
		"\u0001\u0000\u0000\u0000UV\u0005h\u0000\u0000V\u0014\u0001\u0000\u0000"+
		"\u0000WX\u0005m\u0000\u0000X\u0016\u0001\u0000\u0000\u0000YZ\u0005s\u0000"+
		"\u0000Z\u0018\u0001\u0000\u0000\u0000[\\\u0005+\u0000\u0000\\\u001a\u0001"+
		"\u0000\u0000\u0000]^\u0005-\u0000\u0000^\u001c\u0001\u0000\u0000\u0000"+
		"_`\u0005*\u0000\u0000`\u001e\u0001\u0000\u0000\u0000ab\u0005/\u0000\u0000"+
		"b \u0001\u0000\u0000\u0000cd\u0005%\u0000\u0000d\"\u0001\u0000\u0000\u0000"+
		"ef\u0005r\u0000\u0000fg\u0005e\u0000\u0000gh\u0005a\u0000\u0000hi\u0005"+
		"d\u0000\u0000i$\u0001\u0000\u0000\u0000jl\u0003\'\u0013\u0000km\u0003"+
		")\u0014\u0000lk\u0001\u0000\u0000\u0000lm\u0001\u0000\u0000\u0000mo\u0001"+
		"\u0000\u0000\u0000np\u0003+\u0015\u0000on\u0001\u0000\u0000\u0000op\u0001"+
		"\u0000\u0000\u0000pw\u0001\u0000\u0000\u0000qs\u0003)\u0014\u0000rt\u0003"+
		"+\u0015\u0000sr\u0001\u0000\u0000\u0000st\u0001\u0000\u0000\u0000tw\u0001"+
		"\u0000\u0000\u0000uw\u0003+\u0015\u0000vj\u0001\u0000\u0000\u0000vq\u0001"+
		"\u0000\u0000\u0000vu\u0001\u0000\u0000\u0000w&\u0001\u0000\u0000\u0000"+
		"xy\u00031\u0018\u0000yz\u0005h\u0000\u0000z(\u0001\u0000\u0000\u0000{"+
		"|\u00031\u0018\u0000|}\u0005m\u0000\u0000}*\u0001\u0000\u0000\u0000~\u007f"+
		"\u00031\u0018\u0000\u007f\u0080\u0005s\u0000\u0000\u0080,\u0001\u0000"+
		"\u0000\u0000\u0081\u0085\u0007\u0000\u0000\u0000\u0082\u0084\u0007\u0001"+
		"\u0000\u0000\u0083\u0082\u0001\u0000\u0000\u0000\u0084\u0087\u0001\u0000"+
		"\u0000\u0000\u0085\u0083\u0001\u0000\u0000\u0000\u0085\u0086\u0001\u0000"+
		"\u0000\u0000\u0086.\u0001\u0000\u0000\u0000\u0087\u0085\u0001\u0000\u0000"+
		"\u0000\u0088\u008c\u0005\"\u0000\u0000\u0089\u008b\t\u0000\u0000\u0000"+
		"\u008a\u0089\u0001\u0000\u0000\u0000\u008b\u008e\u0001\u0000\u0000\u0000"+
		"\u008c\u008d\u0001\u0000\u0000\u0000\u008c\u008a\u0001\u0000\u0000\u0000"+
		"\u008d\u008f\u0001\u0000\u0000\u0000\u008e\u008c\u0001\u0000\u0000\u0000"+
		"\u008f\u0090\u0005\"\u0000\u0000\u00900\u0001\u0000\u0000\u0000\u0091"+
		"\u0093\u0007\u0002\u0000\u0000\u0092\u0091\u0001\u0000\u0000\u0000\u0093"+
		"\u0094\u0001\u0000\u0000\u0000\u0094\u0092\u0001\u0000\u0000\u0000\u0094"+
		"\u0095\u0001\u0000\u0000\u0000\u00952\u0001\u0000\u0000\u0000\u0096\u0097"+
		"\u0007\u0003\u0000\u0000\u0097\u0098\u0001\u0000\u0000\u0000\u0098\u0099"+
		"\u0006\u0019\u0000\u0000\u00994\u0001\u0000\u0000\u0000\u009a\u009b\u0005"+
		":\u0000\u0000\u009b\u009c\u0005:\u0000\u0000\u009c\u009d\u0005-\u0000"+
		"\u0000\u009d\u00a1\u0001\u0000\u0000\u0000\u009e\u00a0\t\u0000\u0000\u0000"+
		"\u009f\u009e\u0001\u0000\u0000\u0000\u00a0\u00a3\u0001\u0000\u0000\u0000"+
		"\u00a1\u00a2\u0001\u0000\u0000\u0000\u00a1\u009f\u0001\u0000\u0000\u0000"+
		"\u00a2\u00a4\u0001\u0000\u0000\u0000\u00a3\u00a1\u0001\u0000\u0000\u0000"+
		"\u00a4\u00a5\u0005-\u0000\u0000\u00a5\u00a6\u0005:\u0000\u0000\u00a6\u00a7"+
		"\u0005:\u0000\u0000\u00a7\u00a8\u0001\u0000\u0000\u0000\u00a8\u00a9\u0006"+
		"\u001a\u0000\u0000\u00a96\u0001\u0000\u0000\u0000\t\u0000losv\u0085\u008c"+
		"\u0094\u00a1\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}