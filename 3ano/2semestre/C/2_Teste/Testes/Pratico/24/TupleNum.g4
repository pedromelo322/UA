grammar TupleNum;


main: stat* EOF;



stat
    : 'print' expr* (',' expr)* ';'     #printStat
    | ID ':=' expr ';'                  #AtrStat
    ;




expr
    : '[' NUM (',' NUM)* ']'            #listExpr
    | ID                                #idExpr
    ;   








NUM: [0-9]+;
ID: [a-zA-Z_0-9]+ ;


WS: [ \r\t\n]+ -> skip;
COMMENT: '--' (~[\r\n])* -> skip;

