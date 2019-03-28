#include <stdio.h>
#include <iostream>
#include <unordered_map>

#include <stdio.h>
#include <iostream>

#include "parser.hpp"

using namespace std;

extern FILE *yyin;
extern int yyparse();

int main(int argc, char *argv[]){

    yyin = fopen(argv[1], "r");

    yyparse();
    return 0;
}