grammar lab2;

// starting point
start: code+;//

// declarations
code: dec1 | dec2;
dec1: Type assign (',' assign)* Semicolon;
dec2: if | (if else);

// variable assignment
assign: Id ('=' expr)?;
expr: factor (ArithOpr factor)*;
factor: number | Id;

// if statement
if: 'if' '(' condtion ')' '{' code* '}';//
else: 'else' '{' code* '}';//
condtion: expr CondOpr expr;

// numbers
number: Integer | double;
double: Integer '.' Integer;

// tokens
Type: 'int' | 'double' | 'long' | 'float';
ArithOpr: '+' | '-' | '*' | '/';
CondOpr: '<' | '>' | '==' | '>=' | '<=' | '!=';
Id: ('a'..'z' | 'A'..'Z' | '_' | '$')+ ('a'..'z' | 'A'..'Z' | '_' | '$' | '0'..'9')*;//
Integer: ('0'..'9')+;
Semicolon: ';';//

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