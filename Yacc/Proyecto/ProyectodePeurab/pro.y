%{
#include <stdio.h>
#include <math.h>
void yyerror(char *s);
int yylex();
%}

%token NOMBRE NUMERO ZERO ONE
%type Bin B
%start inicio
%left '+' '-'
%left '*' '/'
%right '^'
%%
inicio: NOMBRE '=' E
| E {printf("=%d\n",$1);}
;
E:	E '+' E 	{$$ = $1 + $3;}
|	E '-' E 	{$$ = $1 - $3;}
|	E '*' E 	{$$ = $1 * $3;}
|	E '/' E 	{$$ = $1 / $3;}
|	E '^' E 	{$$ = pow($1,$3);}
|	'(' E ')'	{$$ = $2;}	
|	NUMERO {$$ = $1;}
|	Bin	{$$=$1;}
;
Bin:	Bin B {$$=$1*2+$2;} 	|
	B {$$=$1;}		;
B:	ZERO {$$=$1;} | ONE {$$=$1;} ; 
%%
void main(){
	yyparse();
	yylex();
}

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
