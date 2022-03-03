clear; close all;
imported_data1 = importdata('2_data.mat')
x=imported_data1.x;
t=imported_data1.t;

for i = 1:1:100  
phi(i,:)=[0,logis1((x(i,1)-2/7)/0.1),logis1((x(i,1)-4/7)/0.1),logis1((x(i,1)-6/7)/0.1),logis1((x(i,1)-8/7)/0.1),logis1((x(i,1)-10/7)/0.1),logis1((x(i,1)-12/7)/0.1)];
end

sn=pinv(transpose(phi)*phi+10^-6*eye(7));
mn=sn*transpose(phi)*t;


w = pinv((phi')*phi)*(phi')*t;
 y1 = phi*w;
 
 
 p=fliplr(w')
xt = linspace(min(x),max(x));
yt = polyval(p,xt);
  tempMatrix = [x y1]
  drawMatrix = sortrows(tempMatrix)

figure
plot(x,t,'o')
hold on
plot(drawMatrix(:,1),drawMatrix(:,2))
hold on
x = [1;1;1;1;1;1;2];
norm = normpdf(x,mn,sn);
figure;
plot(x,norm)
