grammar TimeLang;

main: stat* EOF;

stat: 'write' expr? (',' expr)* ';' #writeStat
    | ID ':=' expr ';'              #atributStat 
    ; 

expr: op=('h'|'m'|'s') expr         #extractExpr
    | op=('+'|'-') expr             #aritmExpr
    | expr op=('*'|'/'|'%') expr    #divMulExpr
    | expr op=('+'|'-') expr        #addSubExpr
    | '(' expr ')'                  #ParentExpr
    | 'read' STR?                    #readExpr
    | time time? time?              #timeExpr
    | ID                            #idExpr 
    ;

time: TIME_UNIT                     #timeUnit
    ;

TIME_UNIT: NUM ('h'|'m'|'s') ;

NUM: [0-9]+;
STR: '"' (~[\n\r])* '"';
ID: [a-zA-Z] [a-zA-Z0-9]*;
WS: [ \r\t\n]+ -> skip;
COMMENT: '::-' (~[\r\n])* '-::' -> skip;