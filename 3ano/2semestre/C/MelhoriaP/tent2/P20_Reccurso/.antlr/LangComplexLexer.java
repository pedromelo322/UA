// Generated from /home/pedromelo1316/Documents/UA/3ano/2semestre/C/MelhoriaP/tent2/P20_Reccurso/LangComplex.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast", "CheckReturnValue", "this-escape"})
public class LangComplexLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, COMP=12, REAL=13, NUM=14, ID=15, WS=16, COMMENT=17;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "COMP", "REAL", "NUM", "ID", "WS", "COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'display'", "'<= '", "'('", "')'", "'+'", "'-'", "'*'", 
			"':'", "'re'", "'im'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"COMP", "REAL", "NUM", "ID", "WS", "COMMENT"
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


	public LangComplexLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "LangComplex.g4"; }

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
		"\u0004\u0000\u0011s\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002\u0001"+
		"\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004"+
		"\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007"+
		"\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b"+
		"\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e\u0002"+
		"\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0001\u0000\u0001\u0000\u0001"+
		"\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0002\u0001\u0002\u0001"+
		"\u0003\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005\u0001"+
		"\u0006\u0001\u0006\u0001\u0007\u0001\u0007\u0001\b\u0001\b\u0001\t\u0001"+
		"\t\u0001\t\u0001\n\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001\u000b"+
		"\u0003\u000bG\b\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b"+
		"\u0003\u000bM\b\u000b\u0001\f\u0001\f\u0001\f\u0003\fR\b\f\u0001\r\u0004"+
		"\rU\b\r\u000b\r\f\rV\u0001\u000e\u0001\u000e\u0005\u000e[\b\u000e\n\u000e"+
		"\f\u000e^\t\u000e\u0001\u000f\u0001\u000f\u0001\u000f\u0001\u000f\u0001"+
		"\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0010\u0001"+
		"\u0010\u0005\u0010k\b\u0010\n\u0010\f\u0010n\t\u0010\u0001\u0010\u0001"+
		"\u0010\u0001\u0010\u0001\u0010\u0001l\u0000\u0011\u0001\u0001\u0003\u0002"+
		"\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013"+
		"\n\u0015\u000b\u0017\f\u0019\r\u001b\u000e\u001d\u000f\u001f\u0010!\u0011"+
		"\u0001\u0000\u0005\u0002\u0000++--\u0001\u000009\u0002\u0000AZaz\u0003"+
		"\u000009AZaz\u0003\u0000\t\n\r\r  x\u0000\u0001\u0001\u0000\u0000\u0000"+
		"\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000\u0000\u0000"+
		"\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000\u0000\u0000"+
		"\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000\u0000\u000f"+
		"\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000\u0000\u0013"+
		"\u0001\u0000\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000\u0000\u0017"+
		"\u0001\u0000\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000\u0000\u001b"+
		"\u0001\u0000\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000\u0000\u001f"+
		"\u0001\u0000\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0001#\u0001\u0000"+
		"\u0000\u0000\u0003%\u0001\u0000\u0000\u0000\u0005-\u0001\u0000\u0000\u0000"+
		"\u00071\u0001\u0000\u0000\u0000\t3\u0001\u0000\u0000\u0000\u000b5\u0001"+
		"\u0000\u0000\u0000\r7\u0001\u0000\u0000\u0000\u000f9\u0001\u0000\u0000"+
		"\u0000\u0011;\u0001\u0000\u0000\u0000\u0013=\u0001\u0000\u0000\u0000\u0015"+
		"@\u0001\u0000\u0000\u0000\u0017L\u0001\u0000\u0000\u0000\u0019N\u0001"+
		"\u0000\u0000\u0000\u001bT\u0001\u0000\u0000\u0000\u001dX\u0001\u0000\u0000"+
		"\u0000\u001f_\u0001\u0000\u0000\u0000!c\u0001\u0000\u0000\u0000#$\u0005"+
		";\u0000\u0000$\u0002\u0001\u0000\u0000\u0000%&\u0005d\u0000\u0000&\'\u0005"+
		"i\u0000\u0000\'(\u0005s\u0000\u0000()\u0005p\u0000\u0000)*\u0005l\u0000"+
		"\u0000*+\u0005a\u0000\u0000+,\u0005y\u0000\u0000,\u0004\u0001\u0000\u0000"+
		"\u0000-.\u0005<\u0000\u0000./\u0005=\u0000\u0000/0\u0005 \u0000\u0000"+
		"0\u0006\u0001\u0000\u0000\u000012\u0005(\u0000\u00002\b\u0001\u0000\u0000"+
		"\u000034\u0005)\u0000\u00004\n\u0001\u0000\u0000\u000056\u0005+\u0000"+
		"\u00006\f\u0001\u0000\u0000\u000078\u0005-\u0000\u00008\u000e\u0001\u0000"+
		"\u0000\u00009:\u0005*\u0000\u0000:\u0010\u0001\u0000\u0000\u0000;<\u0005"+
		":\u0000\u0000<\u0012\u0001\u0000\u0000\u0000=>\u0005r\u0000\u0000>?\u0005"+
		"e\u0000\u0000?\u0014\u0001\u0000\u0000\u0000@A\u0005i\u0000\u0000AB\u0005"+
		"m\u0000\u0000B\u0016\u0001\u0000\u0000\u0000CD\u0003\u0019\f\u0000DE\u0007"+
		"\u0000\u0000\u0000EG\u0001\u0000\u0000\u0000FC\u0001\u0000\u0000\u0000"+
		"FG\u0001\u0000\u0000\u0000GH\u0001\u0000\u0000\u0000HI\u0003\u001b\r\u0000"+
		"IJ\u0005i\u0000\u0000JM\u0001\u0000\u0000\u0000KM\u0003\u0019\f\u0000"+
		"LF\u0001\u0000\u0000\u0000LK\u0001\u0000\u0000\u0000M\u0018\u0001\u0000"+
		"\u0000\u0000NQ\u0003\u001b\r\u0000OP\u0005.\u0000\u0000PR\u0003\u001b"+
		"\r\u0000QO\u0001\u0000\u0000\u0000QR\u0001\u0000\u0000\u0000R\u001a\u0001"+
		"\u0000\u0000\u0000SU\u0007\u0001\u0000\u0000TS\u0001\u0000\u0000\u0000"+
		"UV\u0001\u0000\u0000\u0000VT\u0001\u0000\u0000\u0000VW\u0001\u0000\u0000"+
		"\u0000W\u001c\u0001\u0000\u0000\u0000X\\\u0007\u0002\u0000\u0000Y[\u0007"+
		"\u0003\u0000\u0000ZY\u0001\u0000\u0000\u0000[^\u0001\u0000\u0000\u0000"+
		"\\Z\u0001\u0000\u0000\u0000\\]\u0001\u0000\u0000\u0000]\u001e\u0001\u0000"+
		"\u0000\u0000^\\\u0001\u0000\u0000\u0000_`\u0007\u0004\u0000\u0000`a\u0001"+
		"\u0000\u0000\u0000ab\u0006\u000f\u0000\u0000b \u0001\u0000\u0000\u0000"+
		"cd\u0005*\u0000\u0000de\u0005C\u0000\u0000ef\u0005O\u0000\u0000fg\u0005"+
		"M\u0000\u0000gh\u0005*\u0000\u0000hl\u0001\u0000\u0000\u0000ik\t\u0000"+
		"\u0000\u0000ji\u0001\u0000\u0000\u0000kn\u0001\u0000\u0000\u0000lm\u0001"+
		"\u0000\u0000\u0000lj\u0001\u0000\u0000\u0000mo\u0001\u0000\u0000\u0000"+
		"nl\u0001\u0000\u0000\u0000op\u0005\n\u0000\u0000pq\u0001\u0000\u0000\u0000"+
		"qr\u0006\u0010\u0000\u0000r\"\u0001\u0000\u0000\u0000\u0007\u0000FLQV"+
		"\\l\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}