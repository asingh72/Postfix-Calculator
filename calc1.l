%{

#include <string.h>

#define st_size 200

static int count;

static float stack [st_size];

static void push (float x) {
  
  if (++count<st_size)
        
stack[count]= x;
   
 else 
       
 {printf ("STACK FULL\n");
 exit(1);}

}

static float pop (void)
 {
    if (count>=0)
        
return stack[count--];
    
else {
      
  printf ("STACK EMPTY\n"); 
exit(1);}

}

int int_v;

%}

digit [0-9]

int {digit}+

real ({digit}+[.]{digit}*)|({digit}*[.]{digit}+)

exp ({int}|{real})[eE]{int}

exp2 ({int}|{real})[eE][+-]{int}

exp3 [+-]({int}|{real})[eE][+-]{int}

int2 [+-]({int}|{real})

%%

({int}|{int2}|{real}|{exp}|{exp2}|{exp3})  {push (atof(yytext));}

"+"                      {push (pop() + pop());}

"*"                      {push (pop() * pop());}

"-"                      {float f= pop(); push (pop() - f);}

"/"                      {float f= pop(); push (pop() / f);}

\n                 {float answer = pop();
	
		    int k=answer;

		    if(k==answer)
	
		    {printf("%d\n",k);}

		    else
		
		    {printf("%f\n",answer);}}

 

[ \t\n]                   ;



[^-0-9+*/.;eE \t\n]+     {ECHO; fprintf (stderr,"Invalid Character: ");

			printf("\n"); 
			exit(1);} 



%%


int main (void) {count= -1; yylex(); return 0;}

int yywrap (void) {return 1;}