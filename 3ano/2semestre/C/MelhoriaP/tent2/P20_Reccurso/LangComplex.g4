grammar LangComplex;


main: (stat ';')* EOF;

stat
    :   'display' expr          #displayStat
    |   ID '<= ' expr           #atribStat
    ;



expr
    :   '(' expr ')'            #parentExpr
    |   op=('+'|'-') expr       #unaryExpr
    |   expr op=('*'|':') expr  #mulDivExpr
    |   expr op=('+'|'-') expr  #addSubExpr
    |   're' types              #realExpr
    |   'im' types              #imagExpr
    |   types                   #typesExpr
    ;


types
    :   ID                      #idType
    |   COMP                    #compType
    ;


COMP:   (REAL ('+'|'-'))? NUM'i'
    |   REAL
    ;

REAL: NUM ('.' NUM)?;

NUM: [0-9]+;

ID: [a-zA-Z] [a-zA-Z0-9]*;


WS: [ \t\r\n]   ->skip;
COMMENT: '*COM*' .*? '\n'   ->skip;
