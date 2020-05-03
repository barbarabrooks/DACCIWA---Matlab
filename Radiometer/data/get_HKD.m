function [data]=get_HKD(fi)
%fi='D:\temp\RADIOMETER\2016\06\D25\16062519.HKD.ASC';
%display(fi)
h=fopen(fi);
for n=1:10
    junk=fgetl(h);
end
clear junk
c=0;
while ~feof(h)
    c=c+1;
    C=fgetl(h);
    
    data.DT(c,1)=str2num(C(1:3))+2000;
    data.DT(c,2)=str2num(C(4:6));
    data.DT(c,3)=str2num(C(7:9));
    data.DT(c,4)=str2num(C(10:12));
    data.DT(c,5)=str2num(C(13:15));
    data.DT(c,6)=str2num(C(16:18));
    data.Tamb1(c,1)=str2num(C(45:50));
    data.Tamb2(c,1)=str2num(C(54:56));
    data.TRec1(c,1)=str2num(C(58:62));
    data.TRec2(c,1)=str2num(C(64:68));
    data.SRec1(c,1)=str2num(C(70:74));
    data.SRec2(c,1)=str2num(C(76:80));
    temp=dec2bin(hex2dec(C(end-7:end)));
    data.bin_str(c,1:32)=char(zeros(1,32));
    data.bin_str(c,(32-length(temp)+1):end)=temp;
    
end
fclose('all');
