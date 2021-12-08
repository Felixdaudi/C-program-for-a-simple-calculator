%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void); /* starts lexical analysis */
%}
%token INTEGER /* declare the token type INTEGER*/
%left '+' '-' /* %left to declare the operators token with precedence given
to addition. */
%%
program: program statement '\n'
|
;
statement: expr { printf("Result: %d\n", $1); }
;
expr:
INTEGER
/* $$ represents the value returned by the complete action.*/
/*$1, $2 and $3 are pseudo-variables*/
| expr '+' expr { $$ = $1 + $3; }
| expr '-' expr { $$ = $1 - $3; }
| '(' expr ')' { $$ = $2; }
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
exit(1);
}
int main(void) {
printf("Enter the expression.\n");
yyparse();
return 0;
}