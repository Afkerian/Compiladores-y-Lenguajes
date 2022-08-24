%{
#include <stdio.h>
int flag=0;
%}
%{
int yylex();
void yyerror();
%}
%token UNO CERO A NL
%%
str1	:	str2 	nl	{ }
	;
str2	: 	UNO  str2 UNO	{ }
	|	CERO str2 CERO	{ }
	|	A { }
	;	
nl	:	NL	{printf("\n La secuencia es aceptada"); return(0);}
	;
%%
void main(){
	printf("\n Ingrese una secuencia (cualquier combinacion de 0 y 1)\n");
	yyparse();
	if(flag==0){
		printf("\n la secuencia ingresada es valida para L=[waw^r | donde w es cualquier cadena binaria]\n\n");
	}
}
void yyerror(){
	printf("\\n la secuencia ingresada es invalida para L=[waw^r| donde w es cualquier cadena binaria]\n\n");
	flag=1;
}
