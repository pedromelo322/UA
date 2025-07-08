grammar TupleNum;

main: (stat ';')* EOF;



stat
    :   'while' expr 'do:' (stat ';')* 'end'        #WhileStat
    |   'print' (expr (',' expr)*)?                 #PrintStat
    |   ID ':=' expr                                #AtribStat
    ;



expr
    :   '(' expr ')'                                #ParentExpr
    |   op=('head'|'tail'|'sum'|'average') expr     #SubExpr
    |   op=('+'|'-') expr                           #UnaryExpr
    |   expr op=('+'|'-') expr                      #AddSubExpr
    |   'read'                                      #ReadExpr
    |   ID                                          #IdExpr
    |   TUPLE                                       #TupleExpr
    ;
    



ID: [a-zA-Z] [a-zA-Z0-9]*;
TUPLE: '[' (REAL (',' REAL)*)? ']';

REAL: NUM ('.' NUM)?;

NUM: [0-9]+;

STR: [a-zA-Z]+;


COMMENT: '--' .*? '\n' ->skip;
WS: [ \t\r\n] -> skip;