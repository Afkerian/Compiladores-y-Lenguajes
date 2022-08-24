%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int nlines=0;
%}
DIGITO [0-9]
BINARIO (b|B)(1|0)+
ID	[a-zA-Z][a-zA-Z0-9]*
%%
{DIGITO}+("."{DIGITO})? 	{yylval.real=atof(yytext);return (NUM);}
{BINARIO}			{
					for(int i=1;i<yyleng;i++){
						switch(yytext[i]){
							case '1':
								yylval.real=1;
								return (ONE);
								break;
							case '0':
								yylval.real=0;
								return (ZERO);
								break;
						}
						printf("Esto es una prueba %d" ,i);
						
					}
				}
"="				{return (tkn_asign);}
";"				{return (tkn_ptocoma);}
"+"				{return (tkn_mas);}
"-"				{return (tkn_menos);}
"*"				{return (tkn_mult);}
"/"				{return (tkn_div);}
"sqtr"				{return (tkn_raiz);}
"^"				{return (tkn_elev);}
"("				{return (tkn_paa);}
")"				{return (tkn_pac);}
"cos"				{return (tkn_cos);}
"sen"				{return (tkn_sen);}
"ln"				{return (tkn_lognat);}
"e"				{return (tkn_e);}
{ID}				{return (tkn_id);}
"\n"				{nlines++;}
.				;
%%

