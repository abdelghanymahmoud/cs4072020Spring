grammar lab1;

start: Type dec (',' dec)* ';' | if1;
dec: Id ('=' exp)?;
exp: part (Sign part)*;
Sign: '*' | '-' | '+' | '/';
part: (number | Id);
Type: 'int' | 'double';
Id: ('a'..'z' | 'A'..'Z' | '_' | '$')+;
Integer: ('0'..'9')+;
double: Integer '.' Integer;
number: Integer | double;
if: 'if' '('part Cond part ')' '{' ( Type dec ';')* '}' ;
Cond: '<' |'>' |'==' ;
//if: 'if' '('(scond ('^'|'&&' | '||') scond)+ | scond ')' '{' ( Type dec ';')* '}' ;
scond:  part Cond part;
else:  'else' '{' ( Type dec ';')* '}' ;
if1: if | (if else) ;