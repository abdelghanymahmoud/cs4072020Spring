grammar lab5;

start: code+;

// declarations
code: '{' code* '}' | dec1 | dec2;
dec1: Type? assign (',' assign)* Semicolon;
dec2: ifstatment ifstatmentelse* elsestatement?;

// variable assignment
assign: Id ('=' expr)?;
expr: ArithOpr1 expr term | term;
term: ArithOpr2 term factor | factor;
factor: value | Id | '(' expr ')';

// ifstatment statement
ifstatment: 'if' '(' condtion ')'  code ;
ifstatmentelse: 'else' ifstatment;
elsestatement: 'else' code ;
condtion: codHelper (LogicOpr codHelper)*;
codHelper: expr CondOpr expr;

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
Semicolon: ';';
StringType: '"' ~('"')* '"';