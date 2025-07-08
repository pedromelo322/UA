grammar FracLang;



main: (stat|expr)* EOF;


stat
    :   'display' expr ';'       #displayStat
    |   ID '<=' expr ';'         #AtribStat
    ;




expr
    :   op=('+'|'-') expr       #unaryExpr
    |   expr op=('*'|':') expr  #mulDivExpr
    |   expr op=('+'|'-') expr  #addSubExpr
    |   'reduce' expr           #reduceExpr
    |   '(' expr ')'            #parentExpr
    |   'read' STR              #readExpr
    |   FRAC                    #fracExpr   
    |   ID                      #idExpr
    ;









FRAC: NUM ('/' NUM)?;
NUM: [0-9]+;
ID: [a-z]+;
STR: '"' .*? '"';

WS: [ \t\r\n] -> skip;
Comment: '--' .*? '\n' -> skip;







