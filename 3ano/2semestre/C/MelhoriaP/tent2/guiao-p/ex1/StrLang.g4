grammar StrLang;

main: stat* EOF;


stat
    :   'print' expr            #printStat
    |   ID ':' expr             #atribStat
    ;


expr  
    :   expr '/' expr '/' expr  #replaceStat
    |   '(' expr ')'            #parentStat
    |   'trim' expr             #trimStat
    |   expr op=('+'|'-') expr  #addSubStat
    |   'input' '(' expr ')'    #inputStat 
    |   ID                      #IdExpr
    |   STR                     #StrExpr
    ;





STR: '"' .*? '"';
ID: [a-zA-Z] [a-zA-Z0-9]* ;

COMMENT: '//' .*? '\n' -> skip;
WS: [ \t\r\n]+ -> skip;
