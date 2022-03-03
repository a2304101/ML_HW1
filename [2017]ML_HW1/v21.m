clear;clc;
imported_data = importdata('1_data.mat')
imported_data2 = importdata('2_data.mat')



load carsmall
X = Weight;
y = MPG;
mdl = fitlm(X,y,'quadratic');

Xnew = X;
ypred = predict(mdl,Xnew);

plot(X,y,'o',Xnew,ypred,'x')
legend('Data','Predictions')