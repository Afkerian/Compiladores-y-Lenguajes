%{
	#include<stdlib.h>
%}
%%
[0-9]+				printf("NUMERO \n");
[a-zA-Z]+(\_|\-)*[a-zA-Z0-9]*	printf("IDENTIFICADOR \n");
.+				printf("NO ES NÚMERO, NI IDENTIFICADOR \n");
%% 
