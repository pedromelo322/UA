import java.io.IOException;
import java.util.Scanner;
import java.io.File;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class TimeLangMain {
   public static void main(String[] args) {
      for (String string : args) {
         try {

            StringBuilder str = new StringBuilder();
            Scanner sc = new Scanner(new File(string));

            while(sc.hasNextLine()){
               str.append(sc.nextLine() + "\n");
            }
            sc.close();


            // create a CharStream that reads from standard input:
            CharStream input = CharStreams.fromString(str.toString());
            // create a lexer that feeds off of input CharStream:
            TimeLangLexer lexer = new TimeLangLexer(input);
            // create a buffer of tokens pulled from the lexer:
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            // create a parser that feeds off the tokens buffer:
            TimeLangParser parser = new TimeLangParser(tokens);
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
}
