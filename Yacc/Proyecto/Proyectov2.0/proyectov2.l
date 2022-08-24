%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "y.tab.h"
int nlines = 0;
%}
DIGITO	[0-9]
ROMANO (M|m){0,3}(CM|cm|Cm|cM|Cd|cD|cd|CD|(D|d)?(C|c){0,3})(xc|XC|xC|Xc|xl|xL|Xl|XL|(L|l)?(X|x){0,3})(ix|Ix|iX|IX|iv|Iv|iV|IV|(V|v)?(I|i){0,3})
ID	[a-zA-Z][a-zA-Z0-9]*
%%

{DIGITO}+("."{DIGITO}+)?	{yylval.real=atof(yytext); return (TKN_NUM);}
{ROMANO}  {
		int d = 0;
		for (int j = 0; j < yyleng ; j ++) {
			int n =0;
			switch ( yytext [j]){
				case 'I':
					n =1;
					if (j+1 < yyleng ){
						if ( yytext [j+1] == 'V' || yytext [j+1] == 'X' || yytext [j+1] == 'v' || yytext [j+1] == 'x') {
							n=-1;
						}
					}
					break;
				case 'i':
					n =1;
					if (j+1 < yyleng ){
						if (yytext [j+1] == 'V' || yytext [j+1] == 'X' || yytext [j+1] == 'v' || yytext [j+1] == 'x') {
							n=-1;
						}
					}
					break;
				case 'V':
					n=5;
					break;
				case 'v':
					n=5;
					break;
				case 'X':
					n =10;
					if (j +1 < yyleng ){
						if ( yytext [j+1] == 'C' || yytext [j+1] == 'L'||yytext [j+1] == 'c' || yytext [j+1] == 'l') {
						n = -10;
						}
					}
					break ;
				case 'x':
					n =10;
					if (j +1 < yyleng ){
						if ( yytext [j+1] == 'C' || yytext [j+1] == 'L'||yytext [j+1] == 'c' || yytext [j+1] == 'l') {
						n = -10;
						}
					}
					break;
				case 'L':
					n =50;
					break;	
       			case 'l':
					n =50;
					break;
       			case 'C':
					n =100;
					if (j +1 < yyleng ){
						if ( yytext [j+1] == 'M'|| yytext [j+1] == 'D'||yytext [j+1] == 'm'|| yytext [j+1] == 'd') {
						n=-100;
						}
					}
					break;
       			case 'c':
					n =100;
					if (j+1 < yyleng ){
						if ( yytext [j+1] == 'M'|| yytext [j+1] == 'D'||yytext [j+1] == 'm'|| yytext [j+1] == 'd') {
						n=-100;
						}
					}
					break;
       			case 'D':
					n =500;
					break ;
       			case 'd':
					n =500;
					break ;
       			case 'M':
					n =1000;
					break ;
       			case 'm':
					n =1000;
					break ;
			}
		d+=n;
		}
		yylval.real=d;
		return ROM;
		
	}
(B|b)(1|0)+			{
					char *cadena = yytext;
					int numBin= atol(&cadena[1]);
					int numDec =0;
					double exp =0;		
					while (numBin>0){
			
					numDec = numDec + (numBin%10 *pow(2.0, exp));
					numBin = numBin/10;
					exp++;
					}
				yylval.real=numDec;
				return TKN_BIN;
				}
(0|o)[0-7]+ 	{ 
		
		char *cadena = yytext;
		int numOct= atol(&cadena[1]);
		int numDec =0 ;
		double exp =0;
		
		
		while (numOct>0){
			numDec = numDec + (numOct%10 *pow(8.0, exp));
			numOct = numOct/10;
			exp++;
		}
		yylval.real=numDec;
		return OCTAL;
		
		}
		
(h|H)[0-9A-Fa-f]+	{
		 		
		 		char *cadena=yytext;
		 		char *primero=(&cadena[1]);		 		
		 		int numDec=0,i,j,num=0;
		 		double exp=0;
		 		
		 		for(i=strlen(&cadena[1]);i>0;i--)
		 		{
		 			switch(cadena[i]){
		 				case '0':
		 					num=0;
		 					break;
		 				case '1':
		 					num=1;
		 					break;
		 				case '2':
		 					num=2;
		 					break;
	 					case '3':
		 					num=3;
		 					break;
		 				case '4':
		 					num=4;
		 					break;
		 				case '5':
		 					num=5;
		 					break;
		 				case '6':
		 					num=6;
		 					break;
		 				case '7':
		 					num=7;
		 					break;
		 				case '8':
		 					num=8;
		 					break;
		 				case '9':
		 					num=9;
		 					break;
		 				case 'A':
		 					num=10;
		 					break;
		 				case 'a':
		 					num=10;
		 					break;
		 				case 'B':
		 					num=11;
		 					break;
		 				case 'b':
		 					num=11;
		 					break;
		 				case 'C':
		 					num=12;
		 					break;
		 				case 'c':
		 					num=12;
		 					break;
		 				case 'D':
		 					num=13;
		 					break;
		 				case 'd':
		 					num=13;
		 					break;
		 				case 'E':
		 					num=14;
		 					break;
		 				case 'e':
		 					num=14;
		 					break;
		 				case 'F':
		 					num=15;
		 					break;
		 				case 'f':
		 					num=15;
		 					break;
		 			}
		 			numDec=numDec+(num*pow(16,exp));
		 			exp++;		 			
		 		}
		 
		 		yylval.real=numDec;
		 		return HEX;
		 		
		 	}		
"="				{return (TKN_ASIGN);}
";"				{return (TKN_PTOCOMA);}
"*"				{return (TKN_MULT);}
"/"				{return (TKN_DIV);}
"+"				{return (TKN_MAS);}
"-"				{return (TKN_MENOS);}
"^"				{return (TKN_ELEV);}
"sqrt"				{return (TKN_RAIZ);}
"("				{return (TKN_PAA);}
")"				{return (TKN_PAC);}
"cos"				{return (TKN_COS);}
"sen"				{return (TKN_SEN);}
"ln"				{return (TKN_LOGNAT);}
"e"				{return (TKN_E);}
{ID}				{return (TKN_ID);}
"\n"				{nlines++;}
.				;
%%
