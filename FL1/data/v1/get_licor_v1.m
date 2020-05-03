%function [licor]=get_licor_v2(fn)

fn='E:\raw\fluxtower2b\2016-06\160616_095046.40.licor'
% dump file to cell array
fid=fopen(fn);
c1=0;c2=0;
if fid>0
    while ~feof(fid)
        junk=fgetl(fid);
        ix_C=findstr(junk,'(');
        if ((~isempty(ix_C))&(length(ix_C)==6))
            c1=c1+1;
            licor.message{c1}=junk;
        else
            c2=c2+1;
            data{c2}=junk;
        end
    end
    fclose('all');
end
fclose('all');
clear c1 c2

%pre-size data arrays
licor.DT=ones(length(data),6).*NaN;
licor.CO2=ones(length(data),2).*NaN;%mmol/m3 micromole/mol
licor.H2O=ones(length(data),2).*NaN;%mmol/m3 mmole/mol
licor.TT=ones(length(data),1).*NaN;%C
licor.PP=ones(length(data),1).*NaN;%kPa

for n=1:length(data)
    junk=data{n};
    if ((~isempty(junk)) & (length(junk)>100) & (length(junk)<125) & (junk(1)=='2'))
        temp=str2num(junk);
        if ~isempty(temp)
            if length(temp)==19
                licor.DT(n,:)=temp(1:6);
                licor.CO2(n,:)=temp(10:12);
                licor.H2O(n,:)=temp(17:19);
                licor.TT(n)=temp(14);
                licor.PP(n)=temp(15);
            end
        end
    end
end