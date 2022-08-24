%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#define MAXIMA_LONGITUD_CADENA 100
extern int yylex(void);
extern char *yytext;
extern int nlines;
extern FILE *yyin;
double resp=0;
void yyerror(char *s);
void invertirCadena(char cadena[]);
void concatenarCharACadena(char c, char *cadena);
void decimalAHexadecimal(double numeroDecimal, char cadenaResultado[MAXIMA_LONGITUD_CADENA], const int base, const char digitos[]);
void imprimir(float res);

%}
%union
{
	float real;
}
%start Calculadora
%token <real> TKN_NUM
%token <real> TKN_BIN
%token <real> OCTAL
%token <real> HEX
%token <real> ROM
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
		TKN_ASIGN Expresion TKN_PTOCOMA {printf("%5.2f\n", $4); imprimir($4);};		
Expresion:	TKN_NUM {$$=$1;} |
		TKN_BIN {$$=$1;} |
		OCTAL 	{$$=$1;} |
		HEX     {$$=$1;} |
		ROM 	{$$=$1;} |
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

void invertirCadena(char cadena[]) {
    int longitud = strlen(cadena);
    int i;
    for (i = 0; i < strlen(cadena) / 2; i++) {
        char temporal = cadena[i];
        cadena[i] = cadena[longitud - i - 1];
        cadena[longitud - i - 1] = temporal;
    }
}

void concatenarCharACadena(char c, char *cadena) {
    char cadenaTemporal[2];
    cadenaTemporal[0] = c;
    cadenaTemporal[1] = '\0';
    strcat(cadena, cadenaTemporal);
}

void decimalAHexadecimal(double numeroDecimal, char cadenaResultado[MAXIMA_LONGITUD_CADENA], const int base, const char digitos[]) {
    /*
     * Separar fracción y entero
     * */
    double parteEnteraDouble; // Temporal para modf
    double parteFraccionaria;
    parteFraccionaria = modf(numeroDecimal, &parteEnteraDouble);
    int parteEntera = (int) parteEnteraDouble;
    /*
     * Declarar cadenas
     * */
    char cadenaParteEntera[MAXIMA_LONGITUD_CADENA] = "";
    char cadenaParteFraccionaria[MAXIMA_LONGITUD_CADENA] = "";
    // Realizar la conversión de la parte entera
    while (parteEntera > 0) {
        int residuo = parteEntera % base;
        char digito = digitos[residuo];
        concatenarCharACadena(digito, cadenaParteEntera);
        parteEntera /= base;
    }
    // Invertimos la cadena
    invertirCadena(cadenaParteEntera);
    // Realizar conversión de la parte fraccionaria
    double sobrante;
    do {
        double resultado = parteFraccionaria * base;
        parteFraccionaria = modf(resultado, &sobrante);
        char digito = digitos[(int) sobrante];
        concatenarCharACadena(digito, cadenaParteFraccionaria);
    } while (sobrante != 0);
    // Concatenar finalmente la parte entera y fraccionaria en el resultado
    strcpy(cadenaResultado, ""); // Limpiar cadena
    strcat(cadenaResultado, cadenaParteEntera);
    strcat(cadenaResultado, ".");
    strcat(cadenaResultado, cadenaParteFraccionaria);
}
void imprimir(float res){
    char resultado[MAXIMA_LONGITUD_CADENA] = "";
    // Decimal a hexadecimal
    decimalAHexadecimal(res, resultado, 16, "0123456789ABCDEF");
    printf("Resultado de convertir el decimal %lf a hexadecimal: %s\n", res, resultado);
    // Decimal a octal
    decimalAHexadecimal(res, resultado, 8, "01234567");
    printf("Resultado de convertir el decimal %lf a octal: %s\n", res, resultado);
    // Decimal a binario
    decimalAHexadecimal(res, resultado, 2, "01");
    printf("Resultado de convertir el decimal %lf a binario: %s\n",res, resultado);

}
