%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern int yylex(void);
extern char *yytext;
extern int nlines;
extern FILE *yyin;
void yyerror(char *s);
%}
%union
{
	float real;
}
%start Calculadora
%token <real> TKN_NUM
%token TKN_ASIGN
%token TKN_PTOCOMA
%token TKN_MULT
%token TKN_DIV
%token TKN_MAS
%token TKN_MENOS
%token TKN_ELEV
%token TKN_RAIZ
%token TKN_LOGNAT
%token TKN_E
%token TKN_PAA
%token TKN_PAC
%token TKN_COS
%token TKN_SEN
%token <real> TKN_ID
%type Calculadora
%type <real> Expresion
%left TKN_MAS TKN_MENOS
%left TKN_MULT TKN_DIV
%right TKN_ELEV TKN_RAIZ
%%

Calculadora:	TKN_ID {printf("El valor de %s es: ", yytext);}
		TKN_ASIGN Expresion TKN_PTOCOMA {printf("%5.2f\n", $4);};
Expresion:	TKN_NUM {$$=$1;} |
		Expresion TKN_MAS Expresion	{$$=$1+$3;} |
		Expresion TKN_MENOS Expresion	{$$=$1-$3;} |
		Expresion TKN_MULT Expresion	{$$=$1*$3;} |
		Expresion TKN_DIV Expresion	{$$=$1/$3;} |
		Expresion TKN_ELEV TKN_PAA Expresion TKN_PAC	{$$=pow($1,$4);} |
		TKN_RAIZ TKN_PAA Expresion TKN_PAC	{$$=sqrt($3);} |
		TKN_PAA Expresion TKN_PAC	{$$=$2;}    |
		TKN_COS TKN_PAA Expresion TKN_PAC	{$$=cos($3);} |
		TKN_SEN TKN_PAA Expresion TKN_PAC	{$$=sin($3);} |
		TKN_LOGNAT TKN_PAA Expresion TKN_PAC	{$$=log($3);} |
		TKN_E TKN_ELEV TKN_PAA Expresion TKN_PAC	{$$=exp($4);} ;
%%

void yyerror(char *s){
	printf("Error %s", s);
}

int main (int argc, char **argv){
	if (argc>1){
		yyin=fopen(argv[1], "rt");
	}else{
		yyin=stdin;
	}

yyparse();
printf("FIN del Analisis. Entrada CORRECTA.\n");
printf("Numero de lineas analizadas: %d\n", nlines);
return 0;
}	
