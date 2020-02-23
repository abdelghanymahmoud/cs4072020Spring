grammar lab2;

// starting point
start: code+;//

// declarations
code: dec1 | dec2 | SingleLine;
dec1: Type? assign (',' assign)* Semicolon;
dec2: if ifelse* else?;

// variable assignment
assign: Id ('=' expr)?;
expr: expr ArithOpr1 term | term;
term: term ArithOpr2 factor | factor;
factor: value | Id | '(' expr ')';

// if statement
if: 'if' '(' condtion ')' '{' code* '}';//
ifelse: 'else' if;
else: 'else' '{' code* '}';//
condtion: codHelper (LogicOpr codHelper)*;
codHelper: expr CondOpr expr;

// comment
SingleLine: '//' ~('\n' | '\r')*;

// numbers
value: number | String;
number: Integer | double;
double: Integer '.' Integer;

// tokens
Type: 'int' | 'double' | 'long' | 'float' | 'String';
ArithOpr1: '+' | '-';
ArithOpr2: '*' | '/';
CondOpr: '<' | '>' | '==' | '>=' | '<=' | '!=';
LogicOpr: '&&' | '&' | '||' | '|' | '^';
Id: ('a'..'z' | 'A'..'Z' | '_' | '$')+ ('a'..'z' | 'A'..'Z' | '_' | '$' | '0'..'9')*;//
Integer: ('0'..'9')+;
Semicolon: ';';//
String: '"' ~('"')* '"';

/*
extension of the previous code
recursion in antlr
0- single line comment
1- type optional
2- add expression ( statement )
3- if else
4- precedence of * / + -
5- String data type "lkjldkasj"
6- for, while, do loops

*/