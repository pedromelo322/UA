grammar FracLang;


main: (stat ';')* EOF;

stat
    :   'display' expr         #displayStat
    |   ID '<=' expr           #AtribStat
    ;



expr
    :   '(' expr ')'            #ParentExpr
    |   op=('+'|'-') expr       #UnaryExpr
    |   expr op=('*'|':') expr  #MulDivExpr
    |   expr op=('+'|'-') expr  #AddSubExpr
    |   'read'  STR             #ReadExpr
    |   'reduce'    expr        #ReduceExpr
    |   ID                      #IdExpr
    |   Frac                    #FracExpr
    ;




STR: '"' .+? '"';

ID: [a-z]+;

Frac: NUM ('/' NUM)?;

NUM: [0-9]+;

WS: [ \t\r\n]+ -> skip;

COMMENT: '--' .*? '\n' -> skip;