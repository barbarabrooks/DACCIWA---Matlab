function [d1]=get_FAS_219_mnd_v1(fn)
%fn='E:\WORKING\sodar\reproc\160618.mnd'
fid=fopen(fn);
if fid>0
    for n=1:47
        junk=fgetl(fid);clear junk
    end;
    n=0;
    while ~feof(fid)
        if feof(fid)
            break
        end
        junk=fgetl(fid);
        if ((~isempty(junk)) && (length(junk)<100)) 
            n=n+1;
            d1.TIME(n,1)=str2num(junk(1:4));
            d1.TIME(n,2)=str2num(junk(6:7));
            d1.TIME(n,3)=str2num(junk(9:10));
            d1.TIME(n,4)=str2num(junk(12:13));
            d1.TIME(n,5)=str2num(junk(15:16));
            d1.TIME(n,6)=str2num(junk(18:19));
            m=0;
        end
    
        if ((~isempty(junk)) && (length(junk)>100)) 
            m=m+1;
            d1.temp(:,m,n)=str2num(junk);
            clear temp junk
        end
    end
    fclose(fid);
else
    disp('Unable to open file')
end