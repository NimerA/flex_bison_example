%option noyywrap
%option yylineno

%{
#include <stdio.h>
#include <string>
#include "parser.hpp"
%}

DIGIT   [0-9]
ID      [a-z][a-z0-9_]*
WSP     [ \t\n]

%%

{DIGIT}+    { yylval.ival = atoi(yytext);   return NUMBER; }
{ID}        { yylval.sval = strdup(yytext); return VAR; }
{WSP}+      { ; }
<<EOF>>     { return END; }
.           { return TK_ERROR; }
