function [d]=get_ceilometer_file_v1(fn) % parse an houropf data
%fn='D:\temp\20160630\C_2016063003.txt'
[X]=importdata(fn);
MaxLines = length(X);
%message cycle consists of 5 message lines.
%start of the cycle is a line containing the instrument model CS000802
start_of_cycle=1;
cc=0;
for n=1:MaxLines
    temp=char(X{n,:});
    ix=strfind(temp,'CS');
    if ~isempty(ix)
        cc=cc+1;
        start_of_cycle(cc)=n;
    end
    clear ix temp
end
% find the position of the info line which has the resolution and no gates
temp=start_of_cycle-3;ix=find(temp>1);
info=temp(ix);clear temp clear ix
for n=1:length(info)
    temp=char(X{info(1),:});
    no_gates(n)=str2num(temp(37:40));
    gate_res(n)=str2num(temp(34:35));
    Z(n,:)=((0:no_gates(n)-1).*gate_res(n))+(gate_res(n)/2);
    clear temp
end
%find position of data lines
temp=start_of_cycle-2;ix=find(temp>1);
data=temp(ix);clear temp ix
temp=char(X{data,:});
DT(1,:)=str2num(temp(:,1:4));
DT(2,:)=str2num(temp(:,6:7));
DT(3,:)=str2num(temp(:,9:10));
DT(4,:)=str2num(temp(:,12:13));
DT(5,:)=str2num(temp(:,15:16));
DT(6,:)=str2num(temp(:,18:26));
for n=1:length(data)
    XX(n,:)= (sscanf(temp(n,28:end),'%5x')./1000)./10000;
end
clear temp n data info start_of_cycle cc MaxLines X

d.DT=DT';
[DoY, ST, ET]=file_times(DT);clear DT
d.DoY=DoY';clear DoY
d.ST=ST';clear ST
d.ET=ET';clear ET
d.ZZ=Z;clear Z
d.BB=XX;clear XX
d.no_gates=no_gates'; clear no_gates
d.gate_res=gate_res'; clear gate_res