%{
#include<math.h>
%}
DIGITO	[0-9]
ID	[a-z][a-z0-9]*
%%
{DIGITO}+ {
	printf("Un Entero: %s (%d)\n",yytext,atoi(yytext));
}
{DIGITO}+"."{DIGITO}*  {
	printf("Un Real: %s (%g)\n",yytext,atof(yytext));
}
"if"|"then"|"begin"|"end"|"procedure"|"function"  {
	printf("Palabra Clave: %s \n",yytext);
}
{ID}	printf("Un identificador: %s \n",yytext);
"+"|"-"|"*"|"/"	printf("Un operador: %s\n",yytext);
"{"[^}\n]*"}"		//se come una linea de comentarios
[\t\n]+		//se come espacios en blanco
.			printf("Caracter no reconocido: %s\n",yytext);
%%
int main (argc, argv)
int argc;
char **argv;
{
	++argv, --argc; // se salta el nombre del programa 
	if(argc>0)
	{
		yyin=fopen(argv[0],"r");
	}
	else
	{
		yyin=stdin;
	}
	yylex();
}
