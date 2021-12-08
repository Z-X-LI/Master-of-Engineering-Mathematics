clear all;clc;
format long
a = 10^(-8);
b = 0.25;  % 0.25
n = 1;
h = (b-a)/n;
% f = @(x)log(1+x)./(1+x.^2); 
f = @(x)sqrt(4-(sin(x)).^2);
% f = @(x)exp(x)./(4+x.^2);
% f = @(x)sin(x)./x

%%
%复合梯形公式
xi = [];
for k = 1:n-1
    xi(k) = a+k*h;
end
Tn=h/2*(f(a)+f(b))+h*sum(f(xi));
%%
%复合Simpson公式
xi1 = [];
xi2 = [];
for k = 1:n
    xi1(k) = a+(k-1/2)*h;
end
for k = 1:n-1
    xi2(k) = a+k*h;
end
Sn=h/6*(f(a)+f(b))+2*h/3*sum(f(xi1))+h/3*sum(f(xi2));
%%
%Romberg算法
e = 0.00000001;
[T1,R,r] = romberg(f,a,b,e);
%%
%变步长算法
e = 0.00000001;
[T2,V,v] = Variable_step(f,a,b,e);
