%{
#include "y.tab.h"
extern int yylval;
%}

%%
[0-9]+	{yylval=atoi(yytext); return NUMERO;}
(B|b)(1|0)	{	int d=0;
			for(int j=1;j<yyleng; j++){
						switch(yytext[j]){
							case '1':
								yylval=1;								
								return (ONE);
								break;
							case '0':
								yylval=0;
								return (ZERO);
								break;
						}
					}
		}
[\t]	;
\n	return 0;
.	return yytext[0];
%%
