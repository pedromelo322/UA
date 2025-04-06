grammar Hello;

greetings : 'Hello' ID ;

ID : [a-z]+;
WS : [ \t\r\n]+ -> skip;