%{
#include <stdio.h>
int flag=0;
%}
%{
int yylex();
void yyerror();
%}
%token UNO CERO NL
%%
str1	:	str2 	nl	{ }
	;
str2	: 	UNO  UNO str3 	{ }
	;
str3	:	UNO UNO UNO str3 CERO { }
	| 	;	
nl	:	NL	{printf("\n La secuencia es aceptada"); return(0);}
	;
%%
void main(){
	printf("\n Ingrese una secuencia (cualquier combinacion de 0 y 1)\n");
	yyparse();
	if(flag==0){
		printf("\n la secuencia ingresada es valida para L=[1^(3n+2)0^n| n>=0 ]\n\n");
	}
}
void yyerror(){
	printf("\\n la secuencia ingresada es invalida para L=[1^(3n+2)0^n| n>=0 ]\n\n");
	flag=1;
}
