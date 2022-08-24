%{
#include <stdio.h>
yyerror(char *s);
%}
%token NOMBRE NUMERO
%%
inicio   :  NOMBRE '=' E 
	 |  E {printf("=%d\n",$1);}
	 ;
E	 :  E '+' E {$$=$1 + $3;}
	 |  E '-' E {$$=$1 - $3;}
	 |  NUMERO {$$=$1;}
	 ;
%%
main()
{
	yyparse();
	yylex();
}
yyerror(char *s)
{
	fprintf(stderr, "%s\n",s);
}	 	
