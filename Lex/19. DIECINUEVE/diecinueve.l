%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
username	printf("%s",getlogin());
%%
int main()
{
	yylex();
	return 0;
}
