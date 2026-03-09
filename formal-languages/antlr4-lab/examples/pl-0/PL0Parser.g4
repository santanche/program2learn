parser grammar PL0Parser;

options {
    tokenVocab = PL0Lexer;
}

program
    : block DOT EOF
    ;

block
    : ( CONST constDecl ( COMMA constDecl )* SEMICOLON )?
      ( VAR IDENT ( COMMA IDENT )* SEMICOLON )?
      ( PROCEDURE IDENT SEMICOLON block SEMICOLON )*
      statement
    ;

constDecl
    : IDENT EQ NUMBER
    ;

statement
    : IDENT ASSIGN expression                               # assignStmt
    | CALL IDENT                                            # callStmt
    | QUESTION IDENT                                        # readStmt
    | BANG expression                                       # writeStmt
    | BEGIN statement ( SEMICOLON statement )* END          # beginStmt
    | IF condition THEN statement                           # ifStmt
    | WHILE condition DO statement                          # whileStmt
    |                                                       # emptyStmt
    ;

condition
    : ODD expression                                        # oddCondition
    | expression op=( EQ | HASH | LT | LEQ | GT | GEQ )
      expression                                            # compareCondition
    ;

expression
    : ( PLUS | MINUS )? term ( ( PLUS | MINUS ) term )*
    ;

term
    : factor ( ( STAR | SLASH ) factor )*
    ;

factor
    : IDENT                                                 # identFactor
    | NUMBER                                                # numberFactor
    | LPAREN expression RPAREN                              # parenFactor
    ;
