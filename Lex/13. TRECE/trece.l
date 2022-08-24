%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
%}
%%
^A.*	{printf("%s",yytext);}
.+	{printf(" ");}
%%
int main()
{
	yylex();
	return 0;
}
