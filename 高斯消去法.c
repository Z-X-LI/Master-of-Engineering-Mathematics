#include<stdlib.h>
#include<stdio.h>
#define N 10

 void gauss_shunxu(float a[N][N],float h[N]){
     int i,j,k;
     float x[N],temp1,temp2;
     for(k=0; k<N-1; k++){
            for(i=k + 1; i<N; i++){
                temp1=a[i][k]/a[k][k];
                h[i]-= h[k]*temp1;
                for(j=k+1; j<N; j++){
                        a[i][j]-=a[k][j]*temp1;
                }
            }
     }
     x[N-1]=h[N-1]/a[N-1][N-1];
     for(i=N-2; i>-1; i--){
            temp2=0;
            for(j=i+1; j<N; j++){
                temp2+=a[i][j]*x[j];
            }
            x[i]=(h[i]-temp2)/a[i][i];
     }
     printf("该线性方程组用Gauss顺序消元法求得的解为:\n");
     for(i=0; i<N; i++){
        printf("x%d=%lf\n",i+1,x[i]);
     }
 }

     void main() {
        float a[N][N]= {{4,2,-3,-1,2,1,0,0,0,0},{8,6,-5,-3,6,5,0,1,0,0},{4,2,-2,-1,3,2,-1,0,3,1},{0,-2,1,5,-1,3,-1,1,9,4},{-4,2,6,-1,6,7,-3,3,2,3},{8,6,-8,5,7,17,2,6,-3,5},{0,2,-1,3,-4,2,5,3,0,1},{16,10,-11,-9,17,34,2,-1,2,2},{4,6,2,-7,13,9,2,0,12,4},{0,0,-1,8,-3,-24,-8,6,3,-1}};
        float h[N]= {5,12,3,2,3,46,13,38,19,-21};
        gauss_shunxu(a,h);
    }
