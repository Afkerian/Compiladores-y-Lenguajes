%{
#include "y.tab.h"
#include <math.h>
extern int yylval;
%}

%%
[0-9]+	{yylval=atoi(yytext); return NUMERO;}
(B|b)(1|0)+  { 		
		char *cadena = yytext;
		int numBin= atol(&cadena[1]);
		int numDec =0;
		double exp =0;		
		while (numBin>0){
			
			numDec = numDec + (numBin%10 *pow(2.0, exp));
			numBin = numBin/10;
			exp++;
		}
		yylval=numDec;
		return BIN;
				
		}
(O|o)[0-7]+ 	{ 
		
		char *cadena = yytext;
		int numOct= atol(&cadena[1]);
		int numDec =0 ;
		double exp =0;
		
		
		while (numOct>0){
			numDec = numDec + (numOct%10 *pow(8.0, exp));
			numOct = numOct/10;
			exp++;
		}
		yylval=numDec;
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
		 
		 		yylval=numDec;
		 		return HEX;
		 		
		 	}

[\t]	;
\n	return 0;
.	return yytext[0];
%%
