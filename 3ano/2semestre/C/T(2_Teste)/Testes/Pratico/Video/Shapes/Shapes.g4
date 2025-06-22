grammar Shapes;



main: state* EOF;
state: expr;


distance: 'distance' point point;


point: '('  x=expr  ','  y=expr  ')';



expr:
    expr op = ('*'|'/') expr        #ExpMultDib
    |expr op = ('+'|'-') expr       #ExpAddSub
    | '(' expr ')'                  #ExpParentices
    | distance                      #ExpDistance
    | NUM                           #ExpNum
    ;



NUM: [0-9]+;
WS: [ \t\n\r]+ -> skip;

