function [Radiation]=get_EB1_Radiation_v1(fn)
%fn='E:\raw\fluxtower1a\Download_19062016_06HR\CR5000_Radiation.dat';

fid=fopen(fn);

for n=1:4
    junk=fgetl(fid);
end

cc=0;
while ~feof(fid)
    junk=fgetl(fid);
    if ~isempty(junk)
        cc=cc+1;
        Radiation.DT(cc,1)=str2num(junk(2:5));
        Radiation.DT(cc,2)=str2num(junk(7:8));
        Radiation.DT(cc,3)=str2num(junk(10:11));
        Radiation.DT(cc,4)=str2num(junk(13:14));
        Radiation.DT(cc,5)=str2num(junk(16:17));
        Radiation.DT(cc,6)=str2num(junk(19:20));
        
        ix=findstr(junk,',');
        temp=junk(ix(1)+1:ix(2)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.record(cc,1)=str2num(temp);
        else
            Radiation.record(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(2)+1:ix(3)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.SWUP(cc,1)=str2num(temp);
        else
            Radiation.SWUP(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(3)+1:ix(4)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.SWDN(cc,1)=str2num(temp);
        else
            Radiation.SWDN(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(4)+1:ix(5)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.IRUP(cc,1)=str2num(temp);
        else
            Radiation.IRUP(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(5)+1:ix(6)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.IRDN(cc,1)=str2num(temp);
        else
            Radiation.IRDN(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(6)+1:ix(7)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.BodyT(cc,1)=str2num(temp);
        else
            Radiation.BodyT(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(7)+1:ix(8)-1);
        if strcmp(temp(1),'"')~=1
            Radiation.IRUPCOR(cc,1)=str2num(temp);
        else
            Radiation.IRUPCOR(cc,1)=NaN;
        end
        clear temp
        
        temp=junk(ix(8)+1:end);
        if strcmp(temp(1),'"')~=1
            Radiation.IRDNCOR(cc,1)=str2num(temp);
        else
            Radiation.IRDNCOR(cc,1)=NaN;
        end
        clear temp
    end
end
fclose(fid);