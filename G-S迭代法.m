%%高斯-塞得勒迭代法
%%线性方程组M*X = b，M是方阵，X0是初始解向量，epsilon是控制精度
function GSIM = Gauss(M,b,X0,epsilon)
[m,n] = size(M);
d = diag(M); L = zeros(m,n); U = zeros(m,n); D = zeros(m,n);
ub = 10000;X = zeros(m,ub);X(:,1) = X0;X_delta = X;X_end = zeros(m,1);k_end = 0;e = floor(abs(log(epsilon)));
for i = 1:m
    for j = 1:n
        if i > j
            L(i,j) = -M(i,j);
        elseif i < j
            U(i,j) = -M(i,j);
        elseif i == j
            D(i,j) = d(i);
        end
    end
end
B = (D-L)\U;
f = (D-L)\b;
for k = 1:ub-1
    X(:,k+1) = B*X(:,k)+f;
    X_delta(:,k) = X(:,k+1)-X(:,k);
    delta = norm(X_delta(:,k),2);
    if delta < epsilon
         break;
    end
end
disp('迭代解及迭代次数为：');
k
GSIM = [X(:,k)'];
end



