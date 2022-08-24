%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
[+-]?(i|I){1,3}	{printf("Es numero Romano %s \n",yytext);}
.+	{printf("No es numero Romano %s \n",yytext);}
%%
int main()
{
	yylex();
	return 0;
}
