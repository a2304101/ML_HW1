clear all;clc;
RMSE1=[0 0 0 0 0 0 0 0 0]
x= csvread('4_train.csv',1,1,[1,1,20,1])
t= csvread('4_train.csv',1,0,[1,0,20,0])
RMSE2=[0 0 0 0 0 0 0 0 0]
xx= csvread('4_test.csv',1,1,[1,1,10,1])
tt= csvread('4_test.csv',1,0,[1,0,10,0])

n=9

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
 
 p=fliplr(w')
xt = linspace(min(x),max(x));
yt = polyval(p,xt);
  tempMatrix = [x y1]
  drawMatrix = sortrows(tempMatrix)
  tempMatrix2 = [xx y2]
  drawMatrix2 = sortrows(tempMatrix2)
figure
hold on
plot(x,t,'o')
plot(xt,yt)

figure
plot(x,t,'o')
plot(xx,tt,'o')
hold on
plot(drawMatrix(:,1),drawMatrix(:,2))
plot(drawMatrix2(:,1),drawMatrix2(:,2))
hold on
%u1=polyval(p,x)
RMSE=sqrt( 1/length(x)* sum( ( y1-t).^2  )) 
RMSE2=sqrt( 1/length(xx)* sum( ( y2-tt).^2  )) 
for i=1:1:9
[RMSE3(i),RMSE4(i)]=hass3(i,0)
end
x5=[1:1:9]
figure
hold on
plot(x5,RMSE3,'-ro')
plot(x5,RMSE4,'-bo')
xlabel('M','FontSize',38)
ylabel('E_RMS','FontSize',38)

h = legend('Training','Test')
set(h,'FontSize',40)


for i=-40:1:0
  [RMSE5(i+41),RMSE6(i+41)]  =hass3(9,exp(i/2))
end
x6=[-20:0.5:0]
figure
hold on
plot(x6,RMSE5,'-r')
plot(x6,RMSE6,'-b')
xlabel('ln(lamda)','FontSize',38)
ylabel('E_RMS','FontSize',38)

h = legend('Training','Test')
set(h,'FontSize',40)

