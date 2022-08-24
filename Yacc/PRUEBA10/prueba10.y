%{
#include <stdio.h>
#include <math.h>
void yyerror(char *s);
%}
%token  NUMERO NL
%start inicio 
%%
inicio:  E {printf("=%d\n",$1);} nl
;
E:	E '+' T {$$ = $1 + $3;}	|
	E '-' T {$$ = $1 - $3;}	|
	T 	{$$=$1;}		|
	;					
T: 	T '*' F {$$ = $1 * $3;}	|
	T '/' F {$$ = $1 / $3;}	|
	F	{$$=$1;}		|
	;
F:	F '^' F {$$ = pow($1,$3);}	|	
	P	{$$=$1;}		|
	;
P: 	'(' E ')' {$$ = $2;}		|
	NUMERO    {$$=$1;}			|
	;
nl:	NL	{printf("\n La secuencia es aceptada"); return(0);}
	;

%%
void main(){
	yyparse();
	yylex();
}

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
