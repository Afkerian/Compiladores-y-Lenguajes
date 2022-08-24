%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
int nlines=0;
%}
DIGITO [0-9]
ID 	[a-zA-Z][a-zA-Z0-9]*
BINARIO (B|b)(1|0)+
%%
{DIGITO}+("."{DIGITO}+)?  {yylval.real=atof(yytext); return (NUM);}
{BINARIO}		   {	int d=0;
				for(int i=1;i<=yyleng;i++){
					switch(yytext[i]){
						case '1':
							d=1;							
							break;
						case '0':
							break;					
					}
				printf("Esto es una prueba %d " ,i);
				yylval.real=d;
				printf("Esto es una prueba %d " ,i);
				return (BIN);
				}
			  }
"="				{return (TKN_ASIGN);}
";"				{return (TKN_PTOCOMA);}
"*"				{return (TKN_MULT);}
"/"				{return (TKN_DIV);}
"+"				{return (TKN_MAS);}
"-"				{return (TKN_MENOS);}
"^"				{return (TKN_ELEV);}
"sqrt"				{return (TKN_RAIZ);}
"("				{return (TKN_PAA);}
")"				{return (TKN_PAC);}
"cos"				{return (TKN_COS);}
"sen"				{return (TKN_SEN);}
"ln"				{return (TKN_LOGNAT);}
"e"				{return (TKN_E);}
{ID}				{return (TKN_ID);}
"\n"				{nlines++;}
.				;
%%	
