%{
#include <stdio.h>
%}
%%
pare	printf("Comando pare recibido \n");
inicio  printf("Comando inicio ejecutado \n");
%%
int main()
{
yylex();
return 0;
}
