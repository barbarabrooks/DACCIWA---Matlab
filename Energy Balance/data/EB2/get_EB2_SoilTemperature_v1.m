function [SoilTemperature]=get_EB2_SoilTemperature_v1(fn)
%fn='E:\raw\fluxtower1a\Download_19062016_06HR\CR5000_SoilTemperature.dat';

fid=fopen(fn);

for n=1:4
    junk=fgetl(fid);
end

cc=0;
while ~feof(fid)
    junk=fgetl(fid);
    if ~isempty(junk)
        cc=cc+1;
        SoilTemperature.DT(cc,1)=str2num(junk(2:5));
        SoilTemperature.DT(cc,2)=str2num(junk(7:8));
        SoilTemperature.DT(cc,3)=str2num(junk(10:11));
        SoilTemperature.DT(cc,4)=str2num(junk(13:14));
        SoilTemperature.DT(cc,5)=str2num(junk(16:17));
        SoilTemperature.DT(cc,6)=str2num(junk(19:20));
        
        ix=findstr(junk,',');
        temp=junk(ix(1)+1:ix(2)-1);
        if strcmp(temp(1),'"')~=1
            SoilTemperature.record(cc,1)=str2num(temp);
        else
            SoilTemperature.record(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(2)+1:ix(3)-1);
        if strcmp(temp(1),'"')~=1
            SoilTemperature.T1(cc,1)=str2num(temp);
        else
            SoilTemperature.T1(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(3)+1:ix(4)-1);
        if strcmp(temp(1),'"')~=1
            SoilTemperature.T2(cc,1)=str2num(temp);
        else
            SoilTemperature.T2(cc,1)=NaN;
        end
        clear temp
       
        temp=junk(ix(4)+1:end);
        if strcmp(temp(1),'"')~=1
            SoilTemperature.T3(cc,1)=str2num(temp);
        else
            SoilTemperature.T3(cc,1)=NaN;
        end
        clear temp
    end
end
fclose(fid);