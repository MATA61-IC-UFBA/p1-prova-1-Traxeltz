%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ID
%token NUM
%token STRING

%token PRINT
%token LENGTH
%token CONCAT

%token PLUS
%token MINUS
%token TIMES
%token DIV
%token LPAR
%token RPAR
%token ASSIGN
%token COMMA

%token ERROR

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: ID ASSIGN expr
| PRINT LPAR expr_list RPAR
| expr
;

expr_list
: expr
| expr_list COMMA expr

expr
: factor
| expr PLUS factor
| expr MINUS factor
;

factor
: term
| factor TIMES term
| factor DIV term
;

term
: NUM
| STRING
| ID
| LPAR expr RPAR
| func_call
;

func_call
: LENGTH LPAR expr RPAR
| CONCAT LPAR expr_list RPAR
;

%%

