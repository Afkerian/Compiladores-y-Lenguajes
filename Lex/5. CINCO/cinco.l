%{
	#include <stdio.h>
	#include <stdlib.h>
%}
%%
0(0|1)0*	printf("SECUENCIA VALIDA \n");
.+		printf("SECUENCIA NO VALIDA \n");
%%
