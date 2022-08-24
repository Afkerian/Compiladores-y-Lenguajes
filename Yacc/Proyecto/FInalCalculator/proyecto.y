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
%token <real> NUM 
%token <real> tkn_id
%token <real> ONE 
%token <real> ZERO
%token tkn_asign
%token tkn_ptocoma
%token tkn_mas
%token tkn_menos
%token tkn_mult
%token tkn_div
%token tkn_raiz
%token tkn_elev
%token tkn_paa
%token tkn_pac
%token tkn_cos
%token tkn_sen
%token tkn_lognat
%token tkn_e
%type Calculadora
%type <real> Exp
%type <real> Bin
%type <real> B
%left tkn_mas tkn_menos 
%left tkn_mult tkn_div
%right tkn_elev tkn_raiz
%%

Calculadora: 	tkn_id {printf ("El valor de %s es: ", yytext);}
		tkn_asign Exp tkn_ptocoma {printf("%5.2f\n",$4);};
Exp:		NUM {$$=$1;} |
		Bin {$$=$1;} |
		Exp tkn_mas Exp {$$=$1+$3;} |
		Exp tkn_menos Exp {$$=$1-$3;} |
		Exp tkn_mult Exp {$$=$1*$3;} |
		Exp tkn_div Exp {$$=$1/$3;} |
		Exp tkn_elev tkn_paa Exp tkn_pac {$$=pow($1,$4);} |
		tkn_raiz tkn_paa Exp tkn_pac {$$=sqrt($3);} |
		tkn_paa Exp tkn_pac {$$=$2;} |
		tkn_cos tkn_paa Exp tkn_pac {$$=cos($3);} |
		tkn_sen tkn_paa Exp tkn_pac {$$=sin($3);} |	
		tkn_lognat tkn_paa Exp tkn_pac {$$=log($3);} |
		tkn_e tkn_elev tkn_paa Exp tkn_pac {$$=exp($4);} ;
		
Bin:		Bin B {$$=$1*2+$2;} |
		B {$$=$1;};
B:		ONE {$$=$1;} | ZERO {$$=$1;} ;
		 
%%
void yyerror(char *s){
	printf("Error %s",s);
}
int main (int argc, char **argv){
	if(argc>1){
		yyin=fopen(argv[1], "rt");	
	}else{
		yyin=stdin;
	}
yyparse();
printf("FIN DEL ANALISIS, Entrada correcta \n");
printf("Numero de lineas analisas %d\n",nlines);
return 0;
} 
