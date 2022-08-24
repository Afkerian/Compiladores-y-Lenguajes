%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	int numlin=0, numcar=0;
%}
%%
[\n]	numlin++;
.	numcar++;
%%
int main()
{
	yylex();
	printf("Numero de lineas %d\n", numlin);
	printf("Numero de caracteres %d\n", numcar);
	return 0;
} 
