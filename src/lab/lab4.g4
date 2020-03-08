grammar lab4;
// https://blog.dgunia.de/2017/10/26/creating-and-testing-an-antlr-parser-with-intellij-idea-or-android-studio/
//https://www.baeldung.com/java-antlr
//https://mvnrepository.com/artifact/org.antlr/antlr4-runtime/4.8-1
start: method;

// int[] arr = new int[5];
// String[] arr = new String[value];

method: MethodIditifer? Static? returnType Id '(' params? ')' '{' returnStat? '}';


returnStat: 'return' (Id | value) Semicolon;
params: param (',' param)*;
param: Type Id;
MethodIditifer: 'public' | 'private' | 'protected';
returnType: Id | Type | 'void';
Type: 'int' | 'double' | 'long' | 'float' | 'String';
Static: 'static';
Id: ('a'..'z' | 'A'..'Z' | '_' | '$')+ ('a'..'z' | 'A'..'Z' | '_' | '$' | '0'..'9')*;//


value: number | StringType;
number: Integer | doubleType;
doubleType: Integer '.' Integer;
Integer: ('0'..'9')+;
StringType: '"' ~('"')* '"';
Semicolon: ';';//