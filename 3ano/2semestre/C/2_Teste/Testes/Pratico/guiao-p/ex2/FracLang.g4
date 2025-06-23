grammar FracLang;

main: state* EOF;

state
    :   'display' expr ';' #printExp
    |    ID '<=' expr ';'  #atributionExp
    ;


expr
    :   expr'/'expr             #fracExp
    |   op=('+'|'-') expr       #unaryExp
    |   expr op=('*'|':') expr  #muldivExp
    |   expr op=('+'|'-') expr  #addsubExp       
    |   '(' expr ')'            #ParentExp
    |   'read' STR              #inputExp
    |   ID                      #idExp
    |   NUM                     #NumExp
    ;

COMMENT: '--' ~[\r\n]* -> skip;

ID: [a-z]+;
NUM: [0-9]+;
STR: '"' (~[\r\n"])* '"';

WS: [ \n\t\r]+ -> skip;
