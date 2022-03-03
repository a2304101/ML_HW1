clear;clc;
imported_data = importdata('5_X.mat')
imported_data2 = importdata('5_T.mat')

[row,col]=size(imported_data);
imported_data11(:,1)=imported_data(:,2)
imported_data11(:,2)=imported_data(:,3)
imported_data11(:,3)=imported_data(:,4)

imported_data12(:,1)=imported_data(:,1)
imported_data12(:,2)=imported_data(:,3)
imported_data12(:,3)=imported_data(:,4)

imported_data13(:,1)=imported_data(:,1)
imported_data13(:,2)=imported_data(:,2)
imported_data13(:,3)=imported_data(:,4)

imported_data14(:,1)=imported_data(:,1)
imported_data14(:,2)=imported_data(:,2)
imported_data14(:,3)=imported_data(:,3)

for i=1:1:40
    clas1(i,:)=imported_data(i,:)
    clas11_target(i,:)=imported_data2(i,:)
    cla11(i,:)=imported_data11(i,:)
    cla12(i,:)=imported_data12(i,:)
    cla13(i,:)=imported_data13(i,:)
    cla14(i,:)=imported_data14(i,:)
end
for i=51:1:90
    clas1(i-10,:)=imported_data(i,:)
    clas11_target(i-10,:)=imported_data2(i,:)
    cla11(i-10,:)=imported_data11(i,:)
    cla12(i-10,:)=imported_data12(i,:)
    cla13(i-10,:)=imported_data13(i,:)
    cla14(i-10,:)=imported_data14(i,:)
end
for i=101:1:140
    clas1(i-20,:)=imported_data(i,:)
    clas11_target(i-20,:)=imported_data2(i,:)
    cla11(i-20,:)=imported_data11(i,:)
    cla12(i-20,:)=imported_data12(i,:)
    cla13(i-20,:)=imported_data13(i,:)
    cla14(i-20,:)=imported_data14(i,:)
end


[RMSEtrain1,w1]  = hass(clas1,clas11_target,1)
[RMSEtrain2,w2]  = hass(clas1,clas11_target,2)

RMSEtrain11  = hass(cla11,clas11_target,2)
RMSEtrain12  = hass(cla12,clas11_target,2)
RMSEtrain13  = hass(cla13,clas11_target,2)
RMSEtrain14  = hass(cla14,clas11_target,2)

for i=41:1:50
    abc(i-40,:)=imported_data(i,:)
    abct(i-40,:)=imported_data2(i,:)
end
for i=91:1:100
    abc(i-80,:)=imported_data(i,:)
    abct(i-80,:)=imported_data2(i,:)
end
for i=141:1:150
    abc(i-120,:)=imported_data(i,:)
    abct(i-120,:)=imported_data2(i,:)
end
RMSEtest1 = hass2(abc,abct,w1,1)
RMSEtest2 = hass2(abc,abct,w2,2)

  

