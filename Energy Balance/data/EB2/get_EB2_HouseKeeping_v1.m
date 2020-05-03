function [HouseKeeping]=get_EB2_HouseKeeping_v1(fn)
%fn='E:\raw\fluxtower1a\sorted\20160628_07HR\CR5000_Housekeeping.dat';

fid=fopen(fn);

for n=1:4
    junk=fgetl(fid);
end

cc=0;
while ~feof(fid)
    junk=fgetl(fid);
    if ~isempty(junk)
        cc=cc+1;
        HouseKeeping.DT(cc,1)=str2num(junk(2:5));
        HouseKeeping.DT(cc,2)=str2num(junk(7:8));
        HouseKeeping.DT(cc,3)=str2num(junk(10:11));
        HouseKeeping.DT(cc,4)=str2num(junk(13:14));
        HouseKeeping.DT(cc,5)=str2num(junk(16:17));
        HouseKeeping.DT(cc,6)=str2num(junk(19:20));
    
        ix=findstr(junk,',');
        temp=junk(ix(1)+1:ix(2)-1);
        if strcmp(temp(1),'"')~=1
            HouseKeeping.record(cc,1)=str2num(temp);
        else
            HouseKeeping.record(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(2)+1:ix(3)-1);
        if strcmp(temp(1),'"')~=1
            HouseKeeping.loggerSupplyVolts(cc,1)=str2num(temp);
        else
            HouseKeeping.loggerSupplyVolts(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(3)+1:end);
        if strcmp(temp(1),'"')~=1
            HouseKeeping.loggerT(cc,1)=str2num(temp);
        else
            HouseKeeping.loggerT(cc,1)=NaN;
        end
        clear temp
        
    end
end
fclose(fid);