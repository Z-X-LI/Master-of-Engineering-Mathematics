#include<stdio.h>
#include<stdlib.h>

void Hamming(double x)
{

	double k,f,f1=0;
	for(k=1;k<100000000;k++)
	{
	    f1=f1+1/(k*(k+x));
	}
	k=1;
	f=0.0;
	while((f1-f)>0.0000001)
	{
	    f=f+1/(k*(k+x));
		k++;
	}
	printf("%6.2f ",x);
	printf("%16.13f\n",f);
}

int main(void)
{
	double x,H=0,H1=0;
	printf("   *运行结果如下*\n");
	printf("   x");
	printf("           H\n");
	for(x=0.00;x<=1.00;x=x+0.10)
	   Hamming(x);
	for(x=10.00;x<=300.00;x=x+10.00)
	    Hamming(x);
	return 0;
}
