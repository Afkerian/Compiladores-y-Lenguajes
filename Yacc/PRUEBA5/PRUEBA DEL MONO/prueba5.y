%{
#include <stdio.h>
int flag=0;
%}
%{
int yylex();
void yyerror();
%}
%token A B D PAU NL
%%
str1	:	str2 nl	{ }
	;
str2	: str2 PAU str3 { } 
	| str3 { }
	;
str3 	: str4 str3 str4 { }
	|str4 { }
	;
str4 	: str5 str6 { }
	| A str5 { } | A str6 { } | str5 { } ;
str5 	: str6 A { } ;
str6 	: B { } | D { } ;
nl	:	NL	{printf("\n La secuencia es aceptada"); return(0);}
	;
%%
void main(){
	printf("\n Ingrese una secuencia \n");
	yyparse();
	if(flag==0){
		printf("\n la secuencia ingresada es valida es un mono\n\n");
	}
}
void yyerror(){
	printf("\\n la secuencia ingresada es invalida no es mono\n\n");
	flag=1;
}
