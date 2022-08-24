%{
#include "y.tab.h"
%}
%%
"0" {return CERO;}
"1" {return UNO;}
[\n] {return NL;}
.	;
%%



