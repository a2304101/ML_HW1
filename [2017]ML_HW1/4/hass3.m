function [RMSE,RMSE2]=hass3(n,lamda)
RMSE1=[0 0 0 0 0 0 0 0 0]
x= csvread('4_train.csv',1,1,[1,1,20,1])
t= csvread('4_train.csv',1,0,[1,0,20,0])
RMSE2=[0 0 0 0 0 0 0 0 0]
xx= csvread('4_test.csv',1,1,[1,1,10,1])
tt= csvread('4_test.csv',1,0,[1,0,10,0])

V = ones(length(x), n + 1);
for j = 1:1: n
    V(:, j+1) = V(:, j ) .* x;
end
w = pinv((V')*V)*(V')*t;

V2 = ones(length(xx), n + 1);
for j = 1:1: n
    V2(:, j+1) = V2(:, j ) .* xx;
end

 y1 = V*w;
 y2 = V2*w;
RMSE=sqrt( 1/length(x)* sum( ( y1-t).^2 ) +lamda*sum(w.^2)) 
RMSE2=sqrt( 1/length(xx)* sum( ( y2-tt).^2  ) +lamda*sum(w.^2))