%{
	int total=0;
%}
WS	[ \t]+
%%
I	total +=1;
IV	total +=4;
V	total +=5;
IX	total +=9;
X	total +=10;
XL	total +=40;
L	total +=50;
XC	total +=90;
C	total +=100;
CD	total +=400;
D	total +=500;
CM	total +=900;
M 	total +=1000;
{WS}	|
\n	return total;
%%
int main()
{
	int primero,segundo;
	primero= yylex();
	segundo = yylex();
	
	printf("%d + %d  =%d\n", primero, segundo ,primero+segundo);
	return 0;
}
	
