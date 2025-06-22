grammar StrLang;

main: state* EOF;


state
    : 'print' expr             #ExprPrint
    | ID ':' expr               #ExprAssign
    ;


expr
    : expr '/' expr '/' expr    #ReplaceExp
    |expr '+' expr              #ConcatExp
    | expr '-' expr             #RemoveExp
    | 'trim' expr               #TrimExp
    | '(' expr ')'              #ParentExp
    | 'input' '(' expr ')'      #InputExp
    |  ID                       #IDExp
    |  STR                      #STRExp
    ;



ID: [a-zA-Z_0-9]+;
STR: '"' (~["\r\n])* '"';
WS: [ \n\t\r]+ -> skip;
COMMENT: '//' ~[\r\n]* -> skip;