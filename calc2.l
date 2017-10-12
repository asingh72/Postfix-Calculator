%option noyywrap
%
{
#include <string.h>

#include "calc2.tab.h"
%}


digit [0-9]


int {digit}+


real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)


exp ({int}|{real})[eE]{int}


exp2 ({int}|{real})[eE][+-]{int}


exp3 [+-]({int}|{real})[eE][+-]{int}


int2 [+-]({int}|{real})


%%


({int}|{int2}|{real}|{exp}|{exp2}|{exp3})			{yylval.valI=atof(yytext);return IntegerExpr;}  


"+"                      {return ADD;}


"*"                      {return MULT;}


"-"                      {return SUBTRACT;}


"/"                      {return DIVIDE;}


\n                 	{return NEWLINE;}

 


[ \t\n]                   ;




[^-0-9+*/.;eE \t\n]+     {printf ("Invalid Character: %c\n");

	
		yytext[0]; 
			exit(1);}
 



%%

