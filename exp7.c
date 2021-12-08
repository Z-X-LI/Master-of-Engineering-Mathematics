#include<stdio.h>
#include<math.h>
//#include<conio.h>
#include <stdlib.h>
float fa(float x);
float dd(float a);
main()
{
 float x,x0;
 //clrscr();
 system("cls");
 printf("input x0=");
 scanf("%f",&x0);
 x=dd(x0);
 printf("The root of f(x)=0 is x=%f \n",x);
  getchar();
 return(x);
}
float dd(float a)
{
float x,x0,e;
int i,k,N,n=0;
printf("input runtimeN=");
scanf("%d",&N);
printf("input e=");
scanf("%f",&e);
x0=a;
printf("x0=%f\n",x0);

for (i=1;i>0;i++)
{
x=fa(x0);
printf("x(%d)=%f\n",i,x);
n=n+1;
if(fabs(x-x0)<e)
 {
 printf("replease is n=%d\n",n) ;
return(x);
 }
else
{
if(n<N)
{
x0=x;
}
else
{
printf("replease is wrong") ;
break;
getchar();
}
 }
}
}
float f(float x)
{
float a;
//a=x*x*x-3*x-1;
//a = pow((3*x+1),1.0/3);
//a = 1/(x*x-3);
//a=sqrt(3+1/x);
a=x-((x*x*x-3*x-1)/(x*x-1))/3;
return a;
}
float fa(float x)
{
float a;
// a=(x*x*x-1)/3;
//a = pow((3*x+1),1.0/3);
//a = 1/(x*x-3);
//a=sqrt(3+1/x);
a=x-((x*x*x-3*x-1)/(x*x-1))/3;
return(a);
}