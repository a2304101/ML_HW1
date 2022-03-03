function [RMSE,w]  = hass(class,class_target,n)

[row,col]=size(class);

V = ones(row, col+1);
for i=1:1:col
    V(:,i+1)=class(:,i)
end
V3= ones(row, col+1+col*col);

for i=1:1:col
    V3(:,i+1)=V(:,i+1)
end

    for i=1:1:col
            for j=1:1:col
                V3(:,1+col+j+(i-1)*col)=V(:,i+1).*V(:,j+1)
            end
        end
w21 = pinv((V3')*V3)*(V3')*class_target;
y3 = V3*w21;
w11 = pinv((V')*V)*(V')*class_target;
y1 = V*w11;
switch n
   case 1
        RMSE=sqrt( (1/row)* sum( ( y1-class_target).^2  ))  
        w=w11
   case 2
       RMSE=sqrt(( 1/row)* sum( ( y3-class_target).^2  ))  
       w=w21
end