%{
#include <stdlib.h>
void yyerror(char *); //declare the yyerror function
#include "y.tab.h" //include the header file generated
%}
%%
[0-9]+ { yylval = atoi(yytext); return INTEGER;} /*atoi() function converts a
string into an integer numerical representation.*/

[-+()=\n] { return *yytext; } /* accepted operators */
[ \t] ; // ignore whitespace

. yyerror("Invalid input!");
%%
int yywrap(void) {
return 1; //returns 1 when end of input is reached.
}