%{
#include <stdio.h>
#include <stdlib.h>
int number_1;
int number_2;
%}
number_sequence [0-9]*
%%
{number_sequence}[0|2|4|6|8] {
                    printf("Numero Par [%d]",yyleng); 
                    return atoi(yytext);}
{number_sequence}[1|3|5|7|9] {
                    printf("Numero Impar [%d]",yyleng); 
                    return atoi(yytext);}                    
%%
int yywrap()
{
    return 1;
}                    
int main()
{
   printf("\n Ingrese un numero par y un impar\n ");
   number_1=yylex();
   number_2=yylex();
   int diff=number_1-number_2;
   if(diff%2!=0)
   {
      printf("\nse verificaron sus entradas para la correcion, \nResultado: Correcto\n");
   }
   else
   {
      printf("\nse verificaron sus entradas para la correcion, \nResultado: Incorrecto\n");
   }
   yylex();
   return 1;
}             
                    
                    
             
             
             
             
             
             
             
             
             
             
             
             
             
             
                    
                    
                    
                    
                    
