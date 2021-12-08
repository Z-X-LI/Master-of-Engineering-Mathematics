function [T,V,m]= Variable_step(fun,a,b,e)
% 使用变步长算法数值求解公式

% 判断输入参数是否足够
if nargin~=4
    error('请输入需要求积分的f、上界和下界以及误差e')
end
 
k=0; % 迭代次数
n=1; % 区间划分个数
h=b-a; %上下界间距
T(1)=h/2*(fun(a)+fun(b));
d=b-a; %误差间距
while e<=d
    k=k+1;
    h=h/2;
    sum=0;
    % 计算第一列T
    for i=1:n
        sum=sum+fun(a+(2*i-1)*h);
    end
    T(k+1)=T(k)/2+h*sum;
    n=n*2;
    d=abs(T(k+1)-T(k));
end
V = T(k+1);
m = k+1;