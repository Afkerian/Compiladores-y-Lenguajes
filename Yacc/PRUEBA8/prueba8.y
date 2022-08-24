%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
void yyerror(char *s);
int demToOC(int s);
void demToHexa(int s);
%}
%token ZERO ONE
%%
N	: L {printf("\n EL NUMERO EQUIVALEMTE EN DECIMAL ES: %d\n" , $$);
	     demToOC($$);
	     demToHexa($$);	     
	}	
	;
L	: L B {$$=$1*2+$2;}
	| B   {$$=$1;} 
	;
B 	: ZERO {$$=$1;}
	| ONE {$$=$1;}
	;
%%
int main()
{
	printf("\n INGRESE LA SECUENCIA BINARIA: ");
	while(yyparse());
}

void yyerror(char *s)
{
	fprintf(stdout, "\n%s",s);
}

int demToOC(int s){
	
 printf("\n EL NUMERO EQUIVALENTE EN OCTAL ES: %o \n",s);
}


void demToHexa( int s){
    printf("\n EL NUMERO EQUIVALENTE EN HEXADECIMAL ES: %X \n",s);
}



