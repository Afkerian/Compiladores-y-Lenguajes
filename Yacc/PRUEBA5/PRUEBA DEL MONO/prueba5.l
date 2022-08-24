%{
#include "y.tab.h"
%}
%%
"a" 	{return A;}
"b" 	{return B;}
"d" 	{return D;}
"^"	{return PAU;}
[\n] {return NL;}
.	;
%%
