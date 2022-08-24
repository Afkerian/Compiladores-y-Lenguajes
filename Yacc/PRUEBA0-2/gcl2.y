%{
#include <stdio.h>
int flag=0;
%}
%{
int yylex();
void yyerror();
%}
%token A B EB ES
%%
str1 : str2 nl { }
     ;
str2 : A str2 B str3 { }
     | B str2 A str3 { }
     | ES	{ }
     ;
str3 : ES { }
     ;
nl   : EB  {printf("\n La secuencia es aceptada"); return(0);}

     ;
%%   
void main(){
	printf("\n Ingrese una secuencia (cualquier combinacion de a y b)\n");
	yyparse();
	if(flag==0){
		printf("\n la secuencia ingresada es valida para L=[ab*|ba*]\n\n");
	}
}
void yyerror(){
	printf("\\n la secuencia ingresada es invalida para L=[ab*|ba*]\n\n");
	flag=1;
}  
