function [DT]=get_MMR_v1(junk2)

temp=junk2(4:16);
DT(1)=2000+str2num(temp(2:3));
DT(2)=str2num(temp(4:5));
DT(3)=str2num(temp(6:7));
DT(4)=str2num(temp(8:9));
DT(5)=str2num(temp(10:11));
DT(6)=str2num(temp(12:13));

