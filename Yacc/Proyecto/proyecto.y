%{
#include <stdio.h>
#include <math.h>
void yyerror(char *s);
int yylex();
%}

%token NOMBRE NUMERO BIN OCTAL HEX
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
|	BIN {$$=$1;}
|	OCTAL {$$=$1;}
|	HEX {$$=$1;}
;
%%
void main(){
	yyparse();
	yylex();
}

void yyerror(char *s){
	fprintf(stderr, "%s\n", s);
}
