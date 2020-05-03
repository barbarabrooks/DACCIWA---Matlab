function [SoilMoisture]=get_EB1_SoilMoisture_v1(fn)
%fn='E:\raw\fluxtower1a\Download_19062016_06HR\CR5000_SoilMoisture.dat';

fid=fopen(fn);

for n=1:4
    junk=fgetl(fid);
end

cc=0;
while ~feof(fid)
    junk=fgetl(fid);
    if ~isempty(junk)
        cc=cc+1;
        SoilMoisture.DT(cc,1)=str2num(junk(2:5));
        SoilMoisture.DT(cc,2)=str2num(junk(7:8));
        SoilMoisture.DT(cc,3)=str2num(junk(10:11));
        SoilMoisture.DT(cc,4)=str2num(junk(13:14));
        SoilMoisture.DT(cc,5)=str2num(junk(16:17));
        SoilMoisture.DT(cc,6)=str2num(junk(19:20));
        
        ix=findstr(junk,',');
        temp=junk(ix(1)+1:ix(2)-1);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.record(cc,1)=str2num(temp);
        else
            SoilMoisture.record(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(2)+1:ix(3)-1);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.SM_kOH1(cc,1)=str2num(temp);
        else
            SoilMoisture.SM_kOH1(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(3)+1:ix(4)-1);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.SM_kPA1(cc,1)=str2num(temp);
        else
            SoilMoisture.SM_kPA1(cc,1)=NaN;
        end
        clear temp
       
        temp=junk(ix(4)+1:ix(5)-1);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.SM_kOH2(cc,1)=str2num(temp);
        else
            SoilMoisture.SM_kOH2(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(5)+1:ix(6)-1);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.SM_kPA2(cc,1)=str2num(temp);
        else
            SoilMoisture.SM_kPA2(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(6)+1:ix(7)-1);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.SM_kOH3(cc,1)=str2num(temp);
        else
            SoilMoisture.SM_kOH3(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(7)+1:end);
        if strcmp(temp(1),'"')~=1
            SoilMoisture.SM_kPA3(cc,1)=str2num(temp);
        else
            SoilMoisture.SM_kPA3(cc,1)=NaN;
        end
        clear temp
        
    end
end
fclose(fid);