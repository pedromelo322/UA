// Generated from /home/pedromelo1316/Documents/UA/3ano/2semestre/C/MelhoriaP/p24/TupleNum.g4 by ANTLR 4.13.1
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
	static { RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, WS=20, COMMENT=21, STR=22, ID=23, NUM=24;
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
			"T__17", "T__18", "WS", "COMMENT", "STR", "ID", "NUM"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'print'", "','", "';'", "':='", "'while'", "'do'", "':'", "'end'", 
			"'head'", "'tail'", "'sum'", "'average'", "'-'", "'+'", "'('", "')'", 
			"'read'", "'['", "']'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, "WS", "COMMENT", "STR", 
			"ID", "NUM"
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
		"\u0004\u0000\u0018\u00a2\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002"+
		"\u0001\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002"+
		"\u0004\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002"+
		"\u0007\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002"+
		"\u000b\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0002\u000e\u0007\u000e"+
		"\u0002\u000f\u0007\u000f\u0002\u0010\u0007\u0010\u0002\u0011\u0007\u0011"+
		"\u0002\u0012\u0007\u0012\u0002\u0013\u0007\u0013\u0002\u0014\u0007\u0014"+
		"\u0002\u0015\u0007\u0015\u0002\u0016\u0007\u0016\u0002\u0017\u0007\u0017"+
		"\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0000"+
		"\u0001\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003"+
		"\u0001\u0003\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004\u0001\u0004"+
		"\u0001\u0004\u0001\u0005\u0001\u0005\u0001\u0005\u0001\u0006\u0001\u0006"+
		"\u0001\u0007\u0001\u0007\u0001\u0007\u0001\u0007\u0001\b\u0001\b\u0001"+
		"\b\u0001\b\u0001\b\u0001\t\u0001\t\u0001\t\u0001\t\u0001\t\u0001\n\u0001"+
		"\n\u0001\n\u0001\n\u0001\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001"+
		"\u000b\u0001\u000b\u0001\u000b\u0001\u000b\u0001\f\u0001\f\u0001\r\u0001"+
		"\r\u0001\u000e\u0001\u000e\u0001\u000f\u0001\u000f\u0001\u0010\u0001\u0010"+
		"\u0001\u0010\u0001\u0010\u0001\u0010\u0001\u0011\u0001\u0011\u0001\u0012"+
		"\u0001\u0012\u0001\u0013\u0001\u0013\u0001\u0013\u0001\u0013\u0001\u0014"+
		"\u0001\u0014\u0001\u0014\u0001\u0014\u0005\u0014}\b\u0014\n\u0014\f\u0014"+
		"\u0080\t\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0014\u0001\u0015"+
		"\u0001\u0015\u0005\u0015\u0088\b\u0015\n\u0015\f\u0015\u008b\t\u0015\u0001"+
		"\u0015\u0001\u0015\u0001\u0016\u0001\u0016\u0005\u0016\u0091\b\u0016\n"+
		"\u0016\f\u0016\u0094\t\u0016\u0001\u0017\u0004\u0017\u0097\b\u0017\u000b"+
		"\u0017\f\u0017\u0098\u0001\u0017\u0001\u0017\u0004\u0017\u009d\b\u0017"+
		"\u000b\u0017\f\u0017\u009e\u0003\u0017\u00a1\b\u0017\u0002~\u0089\u0000"+
		"\u0018\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006"+
		"\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019\r\u001b\u000e"+
		"\u001d\u000f\u001f\u0010!\u0011#\u0012%\u0013\'\u0014)\u0015+\u0016-\u0017"+
		"/\u0018\u0001\u0000\u0004\u0003\u0000\t\n\r\r  \u0002\u0000AZaz\u0003"+
		"\u000009AZaz\u0001\u000009\u00a7\u0000\u0001\u0001\u0000\u0000\u0000\u0000"+
		"\u0003\u0001\u0000\u0000\u0000\u0000\u0005\u0001\u0000\u0000\u0000\u0000"+
		"\u0007\u0001\u0000\u0000\u0000\u0000\t\u0001\u0000\u0000\u0000\u0000\u000b"+
		"\u0001\u0000\u0000\u0000\u0000\r\u0001\u0000\u0000\u0000\u0000\u000f\u0001"+
		"\u0000\u0000\u0000\u0000\u0011\u0001\u0000\u0000\u0000\u0000\u0013\u0001"+
		"\u0000\u0000\u0000\u0000\u0015\u0001\u0000\u0000\u0000\u0000\u0017\u0001"+
		"\u0000\u0000\u0000\u0000\u0019\u0001\u0000\u0000\u0000\u0000\u001b\u0001"+
		"\u0000\u0000\u0000\u0000\u001d\u0001\u0000\u0000\u0000\u0000\u001f\u0001"+
		"\u0000\u0000\u0000\u0000!\u0001\u0000\u0000\u0000\u0000#\u0001\u0000\u0000"+
		"\u0000\u0000%\u0001\u0000\u0000\u0000\u0000\'\u0001\u0000\u0000\u0000"+
		"\u0000)\u0001\u0000\u0000\u0000\u0000+\u0001\u0000\u0000\u0000\u0000-"+
		"\u0001\u0000\u0000\u0000\u0000/\u0001\u0000\u0000\u0000\u00011\u0001\u0000"+
		"\u0000\u0000\u00037\u0001\u0000\u0000\u0000\u00059\u0001\u0000\u0000\u0000"+
		"\u0007;\u0001\u0000\u0000\u0000\t>\u0001\u0000\u0000\u0000\u000bD\u0001"+
		"\u0000\u0000\u0000\rG\u0001\u0000\u0000\u0000\u000fI\u0001\u0000\u0000"+
		"\u0000\u0011M\u0001\u0000\u0000\u0000\u0013R\u0001\u0000\u0000\u0000\u0015"+
		"W\u0001\u0000\u0000\u0000\u0017[\u0001\u0000\u0000\u0000\u0019c\u0001"+
		"\u0000\u0000\u0000\u001be\u0001\u0000\u0000\u0000\u001dg\u0001\u0000\u0000"+
		"\u0000\u001fi\u0001\u0000\u0000\u0000!k\u0001\u0000\u0000\u0000#p\u0001"+
		"\u0000\u0000\u0000%r\u0001\u0000\u0000\u0000\'t\u0001\u0000\u0000\u0000"+
		")x\u0001\u0000\u0000\u0000+\u0085\u0001\u0000\u0000\u0000-\u008e\u0001"+
		"\u0000\u0000\u0000/\u0096\u0001\u0000\u0000\u000012\u0005p\u0000\u0000"+
		"23\u0005r\u0000\u000034\u0005i\u0000\u000045\u0005n\u0000\u000056\u0005"+
		"t\u0000\u00006\u0002\u0001\u0000\u0000\u000078\u0005,\u0000\u00008\u0004"+
		"\u0001\u0000\u0000\u00009:\u0005;\u0000\u0000:\u0006\u0001\u0000\u0000"+
		"\u0000;<\u0005:\u0000\u0000<=\u0005=\u0000\u0000=\b\u0001\u0000\u0000"+
		"\u0000>?\u0005w\u0000\u0000?@\u0005h\u0000\u0000@A\u0005i\u0000\u0000"+
		"AB\u0005l\u0000\u0000BC\u0005e\u0000\u0000C\n\u0001\u0000\u0000\u0000"+
		"DE\u0005d\u0000\u0000EF\u0005o\u0000\u0000F\f\u0001\u0000\u0000\u0000"+
		"GH\u0005:\u0000\u0000H\u000e\u0001\u0000\u0000\u0000IJ\u0005e\u0000\u0000"+
		"JK\u0005n\u0000\u0000KL\u0005d\u0000\u0000L\u0010\u0001\u0000\u0000\u0000"+
		"MN\u0005h\u0000\u0000NO\u0005e\u0000\u0000OP\u0005a\u0000\u0000PQ\u0005"+
		"d\u0000\u0000Q\u0012\u0001\u0000\u0000\u0000RS\u0005t\u0000\u0000ST\u0005"+
		"a\u0000\u0000TU\u0005i\u0000\u0000UV\u0005l\u0000\u0000V\u0014\u0001\u0000"+
		"\u0000\u0000WX\u0005s\u0000\u0000XY\u0005u\u0000\u0000YZ\u0005m\u0000"+
		"\u0000Z\u0016\u0001\u0000\u0000\u0000[\\\u0005a\u0000\u0000\\]\u0005v"+
		"\u0000\u0000]^\u0005e\u0000\u0000^_\u0005r\u0000\u0000_`\u0005a\u0000"+
		"\u0000`a\u0005g\u0000\u0000ab\u0005e\u0000\u0000b\u0018\u0001\u0000\u0000"+
		"\u0000cd\u0005-\u0000\u0000d\u001a\u0001\u0000\u0000\u0000ef\u0005+\u0000"+
		"\u0000f\u001c\u0001\u0000\u0000\u0000gh\u0005(\u0000\u0000h\u001e\u0001"+
		"\u0000\u0000\u0000ij\u0005)\u0000\u0000j \u0001\u0000\u0000\u0000kl\u0005"+
		"r\u0000\u0000lm\u0005e\u0000\u0000mn\u0005a\u0000\u0000no\u0005d\u0000"+
		"\u0000o\"\u0001\u0000\u0000\u0000pq\u0005[\u0000\u0000q$\u0001\u0000\u0000"+
		"\u0000rs\u0005]\u0000\u0000s&\u0001\u0000\u0000\u0000tu\u0007\u0000\u0000"+
		"\u0000uv\u0001\u0000\u0000\u0000vw\u0006\u0013\u0000\u0000w(\u0001\u0000"+
		"\u0000\u0000xy\u0005-\u0000\u0000yz\u0005-\u0000\u0000z~\u0001\u0000\u0000"+
		"\u0000{}\t\u0000\u0000\u0000|{\u0001\u0000\u0000\u0000}\u0080\u0001\u0000"+
		"\u0000\u0000~\u007f\u0001\u0000\u0000\u0000~|\u0001\u0000\u0000\u0000"+
		"\u007f\u0081\u0001\u0000\u0000\u0000\u0080~\u0001\u0000\u0000\u0000\u0081"+
		"\u0082\u0005\n\u0000\u0000\u0082\u0083\u0001\u0000\u0000\u0000\u0083\u0084"+
		"\u0006\u0014\u0000\u0000\u0084*\u0001\u0000\u0000\u0000\u0085\u0089\u0005"+
		"\"\u0000\u0000\u0086\u0088\t\u0000\u0000\u0000\u0087\u0086\u0001\u0000"+
		"\u0000\u0000\u0088\u008b\u0001\u0000\u0000\u0000\u0089\u008a\u0001\u0000"+
		"\u0000\u0000\u0089\u0087\u0001\u0000\u0000\u0000\u008a\u008c\u0001\u0000"+
		"\u0000\u0000\u008b\u0089\u0001\u0000\u0000\u0000\u008c\u008d\u0005\"\u0000"+
		"\u0000\u008d,\u0001\u0000\u0000\u0000\u008e\u0092\u0007\u0001\u0000\u0000"+
		"\u008f\u0091\u0007\u0002\u0000\u0000\u0090\u008f\u0001\u0000\u0000\u0000"+
		"\u0091\u0094\u0001\u0000\u0000\u0000\u0092\u0090\u0001\u0000\u0000\u0000"+
		"\u0092\u0093\u0001\u0000\u0000\u0000\u0093.\u0001\u0000\u0000\u0000\u0094"+
		"\u0092\u0001\u0000\u0000\u0000\u0095\u0097\u0007\u0003\u0000\u0000\u0096"+
		"\u0095\u0001\u0000\u0000\u0000\u0097\u0098\u0001\u0000\u0000\u0000\u0098"+
		"\u0096\u0001\u0000\u0000\u0000\u0098\u0099\u0001\u0000\u0000\u0000\u0099"+
		"\u00a0\u0001\u0000\u0000\u0000\u009a\u009c\u0005.\u0000\u0000\u009b\u009d"+
		"\u0007\u0003\u0000\u0000\u009c\u009b\u0001\u0000\u0000\u0000\u009d\u009e"+
		"\u0001\u0000\u0000\u0000\u009e\u009c\u0001\u0000\u0000\u0000\u009e\u009f"+
		"\u0001\u0000\u0000\u0000\u009f\u00a1\u0001\u0000\u0000\u0000\u00a0\u009a"+
		"\u0001\u0000\u0000\u0000\u00a0\u00a1\u0001\u0000\u0000\u0000\u00a10\u0001"+
		"\u0000\u0000\u0000\u0007\u0000~\u0089\u0092\u0098\u009e\u00a0\u0001\u0006"+
		"\u0000\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}