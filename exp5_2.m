clear
clc
A=input('输入对称正定矩阵A=')
B=input('输入自由项B=')
n=length(A(:,1));
for k=1:n
   if (det(A(1:k,1:k))<=0)
       input('矩阵不是正定矩阵,请重新运行程序')
   end
end
%分解A=L*L'
for i=1:n
   t=0;
   for s=1:i-1
       t=t+L(i,s)^2;
   end
   L(i,i)=sqrt(A(i,i)-t);
   for k=i+1:n
       u=0;
       for s=1:i-1
           u=u+L(i,s)*L(k,s);
       end
       L(k,i)=(A(k,i)-u)/L(i,i);
   end
end
%分解AX=B为Ly=B  Lx=y
 
%求y
for i=1:n
   r=0;
   for k=1:i-1
       r=r+L(i,k)*y(k);
   end
   y(i)=(B(i)-r)/L(i,i);
end
%求x
for i=n:-1:1
   q=0;
   for k=i+1:n
       q=q+L(k,i)*x(k);
   end
   x(i)=(y(i)-q)/L(i,i);
end
x' %若要输出行向量，此处改为x即可