/* Programa que permite reconocer numeros reales en notacion exponencial*/
/* y con simbolos de agrupacion */

%{
#include <stdlib.h>
#include <stdio.h>
%}

ABRIR ("["|"("|"{"|"<")
CERRAR ("]"|")"|"]"|">")
DIGITO ("+"|"-"){0,1}[0-9]+("."[0-9]+){0,1}([E,e](\]"+"|"-"){0,1}[0-9]+){0,1}

%%
{ABRIR}{DIGITO},{DIGITO}{CERRAR}  	{printf("SECUENCIA VALIDA %s\n",yytext);}
.+ 					{printf("SECUENCIA NO VALIDA %s\n",yytext);}

%%

int main(){
	yylex();
	return 0;
}
