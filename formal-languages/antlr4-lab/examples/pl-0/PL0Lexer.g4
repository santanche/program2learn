lexer grammar PL0Lexer;

// Keywords
CONST       : 'const' ;
VAR         : 'var' ;
PROCEDURE   : 'procedure' ;
CALL        : 'call' ;
BEGIN       : 'begin' ;
END         : 'end' ;
IF          : 'if' ;
THEN        : 'then' ;
WHILE       : 'while' ;
DO          : 'do' ;
ODD         : 'odd' ;

// Operators & punctuation
DOT         : '.' ;
COMMA       : ',' ;
SEMICOLON   : ';' ;
ASSIGN      : ':=' ;
EQ          : '=' ;
HASH        : '#' ;
LT          : '<' ;
LEQ         : '<=' ;
GT          : '>' ;
GEQ         : '>=' ;
PLUS        : '+' ;
MINUS       : '-' ;
STAR        : '*' ;
SLASH       : '/' ;
LPAREN      : '(' ;
RPAREN      : ')' ;
QUESTION    : '?' ;
BANG        : '!' ;

// Literals & identifiers
NUMBER      : [0-9]+ ;
IDENT       : [a-zA-Z][a-zA-Z0-9]* ;

// Ignored
WS          : [ \t\r\n]+ -> skip ;
