%{
#include <stdio.h>
#include "y.tab.h"
FILE *salida;
%}
%option noyywrap
%option yylineno
DIGITO [0-9]
ID [A-Za-z][a-zA-Z0-9_]*
%%
{DIGITO}+("."{DIGITO}+)? {yylval.real=atof(yytext); return(TKN_NUM);}
"="	{return(TKN_ASIGN);}
";"	{return(TKN_PTOCOMA);}
"*"	{return(TKN_MULT);}
"/"	{return(TKN_DIV);}
"+"	{return(TKN_MAS);}
"-"	{return(TKN_MENOS);}
"^"	{return(TKN_POW);}
"("	{return(TKN_PARENTESISI);}
")"	{return(TKN_PARENTESISD);}
{ID}	{return(TKN_ID);}
%%
int main (int argc, char *argv[]){
	if((yyin=fopen("ingreso.txt", "rt"))==NULL)
	{
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);	
	}else
	{
	if((salida=fopen("salida.txt", "w"))== NULL)
	{
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);	
	}
	yyparse();
	}
	fclose(salida);
	fclose(yyin);
return 0;
}
