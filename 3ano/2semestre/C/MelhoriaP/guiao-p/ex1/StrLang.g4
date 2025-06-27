grammar StrLang;


main: stat* EOF;

stat
    :   'print' expr                #printExpr
    |   ID ':' expr                 #AtribExpr
    ;  



expr
    :   expr '/' expr '/' expr      #replaceExpr
    |   'trim' expr                 #trimExpr
    |   expr '-' expr               #removeExpr
    |   expr '+' expr               #contactExpr
    |   '(' expr ')'                #parentExpr
    |   ID                          #idExpr
    |   STR                         #StrExpr
    |   'input' '(' expr ')'        #inputExpr
    ;





ID: [a-zA-Z] [a-zA-Z0-9]*;
STR: '"' .*? '"';

WS: [ \t\n\r]+ -> skip;
COMMENT: '//' .*? '\n' -> skip;