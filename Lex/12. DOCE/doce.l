%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
char c;
%}
%%
[^A-Z\t]	printf("%c",(toupper(yytext[0])));
[^a-z\t]	printf("%c",(tolower(yytext[0])));
%%
int main()
{
	yylex();
	return 0;
}
