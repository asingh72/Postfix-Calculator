%{
#include <stdio.h>

#include <stdlib.h>

extern int yylex();

extern int yyparse();

void yyerror(const char* x);

%}


%union 
{
	int  valI;
	
float valF;
}
;

%token<valI> IntegerExpr

%token ADD MULT SUBTRACT DIVIDE NEWLINE

%type<valI> IntExpr

%start calc


%%
calc:
	|calc line
;


	line: NEWLINE
	
	|IntExpr NEWLINE {float ans=$1; int k=ans;if(k==ans){printf("%d\n",k);}
		else{printf("%f\n",ans);}}
	
;

IntExpr: IntegerExpr {$$=$1;}
		
|IntExpr IntExpr ADD {$$=$1+$2;}
		
|IntExpr IntExpr SUBTRACT {$$=$1-$2;}
		
|IntExpr IntExpr MULT {$$=$1*$2;}
		
|IntExpr IntExpr DIVIDE {$$=$1/$2;}
;

%%

int main()  {
yyparse();
return 0;}

void yyerror(const char* x){
fprintf(stderr,"ERROR:%s\n",x);
exit(1);
}