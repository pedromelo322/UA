// Generated from TimeLang.g4 by ANTLR 4.13.2
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
	static { RuntimeMetaData.checkVersion("4.13.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, TIME_UNIT=16, 
		NUM=17, STR=18, ID=19, WS=20, COMMENT=21;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "TIME_UNIT", "NUM", 
			"STR", "ID", "WS", "COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'write'", "','", "';'", "':='", "'h'", "'m'", "'s'", "'+'", "'-'", 
			"'*'", "'/'", "'%'", "'('", "')'", "'read'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, "TIME_UNIT", "NUM", "STR", "ID", "WS", "COMMENT"
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
		"\u0004\u0000\u0015\u0080\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014"+
		"\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000"+
		"\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003"+
		"\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005\u0001\u0006"+
		"\u0001\u0006\u0001\u0007\u0001\u0007\u0001\b\u0001\b\u0001\t\u0001\t\u0001"+
		"\n\u0001\n\u0001\u000b\u0001\u000b\u0001\f\u0001\f\u0001\r\u0001\r\u0001"+
		"\u000e\u0001\u000e\u0001\u000e\u0001\u000e\u0001\u000e\u0001\u000f\u0001"+
		"\u000f\u0001\u000f\u0001\u0010\u0004\u0010V\b\u0010\u000b\u0010\f\u0010"+
		"W\u0001\u0011\u0001\u0011\u0005\u0011\\\b\u0011\n\u0011\f\u0011_\t\u0011"+
		"\u0001\u0011\u0001\u0011\u0001\u0012\u0001\u0012\u0005\u0012e\b\u0012"+
		"\n\u0012\f\u0012h\t\u0012\u0001\u0013\u0004\u0013k\b\u0013\u000b\u0013"+
		"\f\u0013l\u0001\u0013\u0001\u0013\u0001\u0014\u0001\u0014\u0001\u0014"+
		"\u0001\u0014\u0001\u0014\u0005\u0014v\b\u0014\n\u0014\f\u0014y\t\u0014"+
		"\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014"+
		"\u0000\u0000\u0015\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005"+
		"\u000b\u0006\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019"+
		"\r\u001b\u000e\u001d\u000f\u001f\u0010!\u0011#\u0012%\u0013\'\u0014)\u0015"+
		"\u0001\u0000\u0006\u0003\u0000hhmmss\u0001\u000009\u0002\u0000\n\n\r\r"+
		"\u0002\u0000AZaz\u0003\u000009AZaz\u0003\u0000\t\n\r\r  \u0084\u0000\u0001"+
		"\u0001\u0000\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000\u0000\u0005"+
		"\u0001\u0000\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001"+
		"\u0000\u0000\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000"+
		"\u0000\u0000\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011\u0001\u0000"+
		"\u0000\u0000\u0000\u0013\u0001\u0000\u0000\u0000\u0000\u0015\u0001\u0000"+
		"\u0000\u0000\u0000\u0017\u0001\u0000\u0000\u0000\u0000\u0019\u0001\u0000"+
		"\u0000\u0000\u0000\u001b\u0001\u0000\u0000\u0000\u0000\u001d\u0001\u0000"+
		"\u0000\u0000\u0000\u001f\u0001\u0000\u0000\u0000\u0000!\u0001\u0000\u0000"+
		"\u0000\u0000#\u0001\u0000\u0000\u0000\u0000%\u0001\u0000\u0000\u0000\u0000"+
		"\'\u0001\u0000\u0000\u0000\u0000)\u0001\u0000\u0000\u0000\u0001+\u0001"+
		"\u0000\u0000\u0000\u00031\u0001\u0000\u0000\u0000\u00053\u0001\u0000\u0000"+
		"\u0000\u00075\u0001\u0000\u0000\u0000\t8\u0001\u0000\u0000\u0000\u000b"+
		":\u0001\u0000\u0000\u0000\r<\u0001\u0000\u0000\u0000\u000f>\u0001\u0000"+
		"\u0000\u0000\u0011@\u0001\u0000\u0000\u0000\u0013B\u0001\u0000\u0000\u0000"+
		"\u0015D\u0001\u0000\u0000\u0000\u0017F\u0001\u0000\u0000\u0000\u0019H"+
		"\u0001\u0000\u0000\u0000\u001bJ\u0001\u0000\u0000\u0000\u001dL\u0001\u0000"+
		"\u0000\u0000\u001fQ\u0001\u0000\u0000\u0000!U\u0001\u0000\u0000\u0000"+
		"#Y\u0001\u0000\u0000\u0000%b\u0001\u0000\u0000\u0000\'j\u0001\u0000\u0000"+
		"\u0000)p\u0001\u0000\u0000\u0000+,\u0005w\u0000\u0000,-\u0005r\u0000\u0000"+
		"-.\u0005i\u0000\u0000./\u0005t\u0000\u0000/0\u0005e\u0000\u00000\u0002"+
		"\u0001\u0000\u0000\u000012\u0005,\u0000\u00002\u0004\u0001\u0000\u0000"+
		"\u000034\u0005;\u0000\u00004\u0006\u0001\u0000\u0000\u000056\u0005:\u0000"+
		"\u000067\u0005=\u0000\u00007\b\u0001\u0000\u0000\u000089\u0005h\u0000"+
		"\u00009\n\u0001\u0000\u0000\u0000:;\u0005m\u0000\u0000;\f\u0001\u0000"+
		"\u0000\u0000<=\u0005s\u0000\u0000=\u000e\u0001\u0000\u0000\u0000>?\u0005"+
		"+\u0000\u0000?\u0010\u0001\u0000\u0000\u0000@A\u0005-\u0000\u0000A\u0012"+
		"\u0001\u0000\u0000\u0000BC\u0005*\u0000\u0000C\u0014\u0001\u0000\u0000"+
		"\u0000DE\u0005/\u0000\u0000E\u0016\u0001\u0000\u0000\u0000FG\u0005%\u0000"+
		"\u0000G\u0018\u0001\u0000\u0000\u0000HI\u0005(\u0000\u0000I\u001a\u0001"+
		"\u0000\u0000\u0000JK\u0005)\u0000\u0000K\u001c\u0001\u0000\u0000\u0000"+
		"LM\u0005r\u0000\u0000MN\u0005e\u0000\u0000NO\u0005a\u0000\u0000OP\u0005"+
		"d\u0000\u0000P\u001e\u0001\u0000\u0000\u0000QR\u0003!\u0010\u0000RS\u0007"+
		"\u0000\u0000\u0000S \u0001\u0000\u0000\u0000TV\u0007\u0001\u0000\u0000"+
		"UT\u0001\u0000\u0000\u0000VW\u0001\u0000\u0000\u0000WU\u0001\u0000\u0000"+
		"\u0000WX\u0001\u0000\u0000\u0000X\"\u0001\u0000\u0000\u0000Y]\u0005\""+
		"\u0000\u0000Z\\\b\u0002\u0000\u0000[Z\u0001\u0000\u0000\u0000\\_\u0001"+
		"\u0000\u0000\u0000][\u0001\u0000\u0000\u0000]^\u0001\u0000\u0000\u0000"+
		"^`\u0001\u0000\u0000\u0000_]\u0001\u0000\u0000\u0000`a\u0005\"\u0000\u0000"+
		"a$\u0001\u0000\u0000\u0000bf\u0007\u0003\u0000\u0000ce\u0007\u0004\u0000"+
		"\u0000dc\u0001\u0000\u0000\u0000eh\u0001\u0000\u0000\u0000fd\u0001\u0000"+
		"\u0000\u0000fg\u0001\u0000\u0000\u0000g&\u0001\u0000\u0000\u0000hf\u0001"+
		"\u0000\u0000\u0000ik\u0007\u0005\u0000\u0000ji\u0001\u0000\u0000\u0000"+
		"kl\u0001\u0000\u0000\u0000lj\u0001\u0000\u0000\u0000lm\u0001\u0000\u0000"+
		"\u0000mn\u0001\u0000\u0000\u0000no\u0006\u0013\u0000\u0000o(\u0001\u0000"+
		"\u0000\u0000pq\u0005:\u0000\u0000qr\u0005:\u0000\u0000rs\u0005-\u0000"+
		"\u0000sw\u0001\u0000\u0000\u0000tv\b\u0002\u0000\u0000ut\u0001\u0000\u0000"+
		"\u0000vy\u0001\u0000\u0000\u0000wu\u0001\u0000\u0000\u0000wx\u0001\u0000"+
		"\u0000\u0000xz\u0001\u0000\u0000\u0000yw\u0001\u0000\u0000\u0000z{\u0005"+
		"-\u0000\u0000{|\u0005:\u0000\u0000|}\u0005:\u0000\u0000}~\u0001\u0000"+
		"\u0000\u0000~\u007f\u0006\u0014\u0000\u0000\u007f*\u0001\u0000\u0000\u0000"+
		"\u0006\u0000W]flw\u0001\u0006\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}