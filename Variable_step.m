function [T,V,m]= Variable_step(fun,a,b,e)
% ʹ�ñ䲽���㷨��ֵ��⹫ʽ

% �ж���������Ƿ��㹻
if nargin~=4
    error('��������Ҫ����ֵ�f���Ͻ���½��Լ����e')
end
 
k=0; % ��������
n=1; % ���仮�ָ���
h=b-a; %���½���
T(1)=h/2*(fun(a)+fun(b));
d=b-a; %�����
while e<=d
    k=k+1;
    h=h/2;
    sum=0;
    % �����һ��T
    for i=1:n
        sum=sum+fun(a+(2*i-1)*h);
    end
    T(k+1)=T(k)/2+h*sum;
    n=n*2;
    d=abs(T(k+1)-T(k));
end
V = T(k+1);
m = k+1;