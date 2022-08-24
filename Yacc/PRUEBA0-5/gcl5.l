%{
#include "y.tab.h"
%}
%%
"0" {return CERO;}
"1" {return UNO;}
"a" {return A;}
[\n] {return NL;}
.	;
%%
