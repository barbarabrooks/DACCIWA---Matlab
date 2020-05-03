function [data]=get_STA(fi)
       
D=dlmread(fi,',',12,0);
data.DT=D(:,1:6);
data.DT(:,1)=data.DT(:,1)+2000;
data.flag=D(:,7);
data.LI=D(:,8);%K
data.KOI=D(:,9);%K
data.TTI=D(:,10);%K
data.KI=D(:,11);%K
data.SI=D(:,12);%K
data.CAPE=D(:,13);%J/Kg
