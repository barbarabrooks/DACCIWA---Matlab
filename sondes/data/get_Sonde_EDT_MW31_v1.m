function [d]=get_Sonde_EDT_MW31_v1(fn,type) % parse a sounding
%fn='E:\WORKING\Sondes\edt\20160723_210032UTC_1s.txt'
%fn='D:\temp\acse sondes\EDT_20140706_12UTC.tsv';
ix=strfind(fn,'_');
d.date=fn(ix(1)+1:ix(2)-1);
d.time=[fn(ix(2)+1:ix(2)+2),'00','00'];
%read in data
fid=fopen(fn);
if fid>0
    for n = 1:39
        junk = fgetl(fid);
        if n==7
            d.sn=junk;
        end
        clear junk
    end 
    n = 0;
    while ~feof(fid)
        junk = fgetl(fid);
        temp = str2num(junk);
        n = n + 1;
        d.EP(n,1)=temp(1);
        d.PP(n,1)=temp(8);
        d.T(n,1)=temp(3)-273.15;% kelvin in file
        d.RH(n,1)=temp(4);
        d.WS(n,1)=temp(12);
        d.WD(n,1)=temp(11);
        d.LAT(n,1)=temp(16);
        d.LON(n,1)=temp(15);
        d.AcRate(n,1)=NaN;%not given by MW31
        d.Z(n,1)=temp(7);
        clear junk temp
    end
    fclose(fid);
end    
