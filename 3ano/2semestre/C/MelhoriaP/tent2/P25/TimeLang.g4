grammar TimeLang;

main: (stat ';')* EOF;


stat
    :   'write' (expr (',' expr)*)?             #writeStat
    |   ID ':=' expr                            #AtribStat
    |   'while' expr 'do' (stat ';')* 'end'     #whiledoStat
    |   'do' (stat ';')* 'end' 'while' expr     #whiledoStat
    ;


expr
    :   '(' expr ')'                            #ParentExpr                            
    |   op=('h'|'m'|'s') expr                   #extractExpr
    |   op=('+'|'-') expr                       #unaryExpr
    |   expr op=('*'|'/'|'%') expr              #mulDivExpr
    |   expr op=('+'|'-') expr                  #addSubExpr
    |   'read' STR?                             #readExpr
    |   ID                                      #idExpr
    |   TIME                                    #timeExpr
    ;


TIME:   Hour Min? Sec?     // 3h, 3h2m, 3h2s, 3h2m5s
    |   Min Sec?           // 2m, 2m5s
    |   Sec                // 5s
    ;


Hour: NUM 'h';
Min: NUM 'm';
Sec: NUM 's';


ID: [a-zA-Z] [a-zA-Z0-9]*;


STR: '"' .*? '"';

NUM: [0-9]+;

WS: [ \t\n\r] -> skip;
COMMENT: '::-' .*? '-::' -> skip;