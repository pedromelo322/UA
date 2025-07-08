import java.io.IOException;
import java.util.Scanner;
import java.io.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class TupleNumMain {
   public static void main(String[] args) {

      

      try {
         Scanner sc = new Scanner(new File(args[0]));
         StringBuilder content = new StringBuilder();
         while (sc.hasNextLine()){
            content.append(sc.nextLine()).append('\n');
         }


         // create a CharStream that reads from standard input:
         CharStream input = CharStreams.fromString(content.toString());
         // create a lexer that feeds off of input CharStream:
         TupleNumLexer lexer = new TupleNumLexer(input);
         // create a buffer of tokens pulled from the lexer:
         CommonTokenStream tokens = new CommonTokenStream(lexer);
         // create a parser that feeds off the tokens buffer:
         TupleNumParser parser = new TupleNumParser(tokens);
         // replace error listener:
         //parser.removeErrorListeners(); // remove ConsoleErrorListener
         //parser.addErrorListener(new ErrorHandlingListener());
         // begin parsing at main rule:
         ParseTree tree = parser.main();
         if (parser.getNumberOfSyntaxErrors() == 0) {
            // print LISP-style tree:
            // System.out.println(tree.toStringTree(parser));
            VIinterpreter visitor0 = new VIinterpreter();
            visitor0.visit(tree);
         }
      }
      catch(IOException e) {
         e.printStackTrace();
         System.exit(1);
      }
      catch(RecognitionException e) {
         e.printStackTrace();
         System.exit(1);
      }
   }
}
