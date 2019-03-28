%{
#include <string>
#include <stdio.h>
#include <iostream>

using namespace std;

extern int yylex();
extern int yyparse();
extern FILE *yyin;

#define YYERROR_VERBOSE 1

void yyerror(const char* msg){
    std::cout << "Error: " << msg << std::endl;
    exit(-1);
}

%}

%union{
    int ival;
    char* sval;
};

%token <ival> NUMBER
%token <sval> VAR
%token END 0 "End Of File" 
%token TK_ERROR "Error"

%%

input: input NUMBER { cout<< "found int " << $2 <<endl; }
    | input VAR { cout<< "found var "<< $2  <<endl; }
    | NUMBER { cout<< "found int "  << $1 <<endl; }
    | VAR { cout<< "found var " << $1 <<endl; }
;