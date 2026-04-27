%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

DIGIT    [0-9]
DIGITS   {DIGIT}+
FRAC_OPT (\.{DIGITS})?
ID       [a-zA-Z][a-zA-Z0-9_]*
TEXT     \"[^\"\n]*\"
%%

[ \t\n]            // skip whitespace
"//"[^\n]*         // skip comments

"+"                { return PLUS; }
"-"                { return MINUS; }
"*"                { return TIMES; }
"/"                { return DIV; }
"("                { return LPAR; }
")"                { return RPAR; }
"="                { return ASSIGN; }
","                { return COMMA; }

"print"            { return PRINT; }
"length"           { return LENGTH; }
"concat"           { return CONCAT; }

{DIGITS}{FRAC_OPT} { return NUM; }
{ID}               { return ID; }
{TEXT}             { return STRING; }

.                  { return ERROR; }

%%
