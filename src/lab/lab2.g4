grammar lab2;
// https://github.com/abdelghanymahmoud/cs4072020Spring
// starting point
start: code+;//

// declarations
code: dec1 | dec2 | SingleLine;
dec1: Type? assign (',' assign)* Semicolon;
dec2: ifstatment ifstatmentelse* elsestatement?;

// variable assignment
assign: Id ('=' expr)?;
expr: expr ArithOpr1 term | term;
term: term ArithOpr2 factor | factor;
factor: value | Id | '(' expr ')';

// ifstatment statement
ifstatment: 'ifstatment' '(' condtion ')' '{' code* '}';//
ifstatmentelse: 'else' ifstatment;
elsestatement: 'else' '{' code* '}';//
condtion: codHelper (LogicOpr codHelper)*;
codHelper: expr CondOpr expr;

// comment
SingleLine: '//' ~('\n' | '\r')*;

// numbers
value: number | StringType;
number: Integer | doubleType;
doubleType: Integer '.' Integer;

// tokens
Type: 'int' | 'double' | 'long' | 'float' | 'String';
ArithOpr1: '+' | '-';
ArithOpr2: '*' | '/';
CondOpr: '<' | '>' | '==' | '>=' | '<=' | '!=';
LogicOpr: '&&' | '&' | '||' | '|' | '^';
Id: ('a'..'z' | 'A'..'Z' | '_' | '$')+ ('a'..'z' | 'A'..'Z' | '_' | '$' | '0'..'9')*;//
Integer: ('0'..'9')+;
Semicolon: ';';//
StringType: '"' ~('"')* '"';

/*
extension of the previous code
recursion in antlr
0- single line comment
1- type optional
2- add expression ( statement )
3- ifstatment else
4- precedence of * / + -
5- String data type "lkjldkasj"
6- for, while, do loops

*/