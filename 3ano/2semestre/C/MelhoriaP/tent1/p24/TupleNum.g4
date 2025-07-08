grammar TupleNum;


main: stat* EOF;


stat
    :   'print' (type (',' type)*)? ';'              #printStat
    |   ID ':=' type ';'                             #atribStat
    |   'while' expr 'do' ':' stat+ 'end' ';'        #iterativeStat
    ;


type: STR                                            #strType 
    | expr                                           #exprType
    ;


expr
    :   op=('head'|'tail'|'sum'|'average') expr     #subTupleExpr
    |   op=('-'|'+') expr                           #unaryExpr
    |   expr op=('+'|'-') expr                      #addSubExpr
    |   '(' expr ')'                                #parentExpr
    |   'read'                                      #readExpr
    |   ID                                          #idExpr
    |   '[' (NUM (',' NUM)*)? ']'                   #tupleExpr
    ;

WS: [ \t\r\n] -> skip;
COMMENT: '--' .*? '\n' -> skip;

STR: '"' .*? '"';
ID: [a-zA-Z] [a-zA-Z0-9]*;


NUM: [0-9]+ ('.' [0-9]+)?;

