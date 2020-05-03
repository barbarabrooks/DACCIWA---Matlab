function [SoilHeatFlux]=get_EB1_SoilHeatFlux_v1(fn)
%fn='E:\raw\fluxtower1a\Download_19062016_06HR\CR5000_SoilHeatFlux.dat';

fid=fopen(fn);

for n=1:4
    junk=fgetl(fid);
end

cc=0;
while ~feof(fid)
    junk=fgetl(fid);
    if ~isempty(junk)
        cc=cc+1;
        SoilHeatFlux.DT(cc,1)=str2num(junk(2:5));
        SoilHeatFlux.DT(cc,2)=str2num(junk(7:8));
        SoilHeatFlux.DT(cc,3)=str2num(junk(10:11));
        SoilHeatFlux.DT(cc,4)=str2num(junk(13:14));
        SoilHeatFlux.DT(cc,5)=str2num(junk(16:17));
        SoilHeatFlux.DT(cc,6)=str2num(junk(19:20));
        
        ix=findstr(junk,',');
        temp=junk(ix(1)+1:ix(2)-1);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.record(cc,1)=str2num(temp);
        else
            SoilHeatFlux.record(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(2)+1:ix(3)-1);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.SHF1(cc,1)=str2num(temp);
        else
            SoilHeatFlux.SHF1(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(3)+1:ix(4)-1);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.SHF2(cc,1)=str2num(temp);
        else
            SoilHeatFlux.SHF2(cc,1)=NaN;
        end
        clear temp
       
        temp=junk(ix(4)+1:ix(5)-1);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.SHF3(cc,1)=str2num(temp);
        else
            SoilHeatFlux.SHF3(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(5)+1:ix(6)-1);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.SHF_CAL1(cc,1)=str2num(temp);
        else
            SoilHeatFlux.SHF_CAL1(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(6)+1:ix(7)-1);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.SHF_CAL2(cc,1)=str2num(temp);
        else
            SoilHeatFlux.SHF_CAL2(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(7)+1:end);
        if strcmp(temp(1),'"')~=1
            SoilHeatFlux.SHF_CAL3(cc,1)=str2num(temp);
        else
            SoilHeatFlux.SHF_CAL3(cc,1)=NaN;
        end
        clear temp
    end
end
fclose(fid);