function [d]=get_Sonde_EDT_MW41_v2(fn) % parse a sounding

%fn = 'G:\renfrew\Messages_corrected\20180204_1200\edt_1s_20180204_1204.txt';  
% read header
fid=fopen(fn);
if fid>0
    msg1 = 'Sonde serial number';%N4820388
    msg2 = 'Release point latitude';%64.150208°N
    msg3 = 'Release point longitude';%21.938856°W
    msg4 = 'Release point height from sea level';%0.00 m
    msg5 = 'Balloon release date';%04/02/18
    msg6 = 'Balloon release time';%12:04:44
    msg7 = 'Surface pressure';%1000.0 hPa
    msg8 = 'Surface temperature';%7.5 °C
    msg9 = 'Surface relative humidity';%95 %
    msg10 = 'Surface wind speed';%10.0 m/s
    msg11 = 'Surface wind direction';%179°
    for n = 1:39
        junk = fgetl(fid);
        if strfind(junk, msg1)
            d.SN = junk(51:end);
        end
        if strfind(junk, msg5)
            date = junk(51:end);
            d.DT(1,1)=str2num(date(7:8))+2000;
            d.DT(1,2)=str2num(date(4:5));
            d.DT(1,3)=str2num(date(1:2));
        end    
        if strfind(junk, msg6)
            time = junk(51:end);
            d.DT(1,4)=str2num(time(1:2));
            d.DT(1,5)=str2num(time(4:5));
            d.DT(1,6)=str2num(time(7:8));
        end
        clear junk
    end 
    fclose(fid);
end

%find start of data
fid=fopen(fn);
if fid>0
    msg12 = 'Elapsed';
    for n = 1:39
        junk = fgetl(fid);
        if strfind(junk, msg12)
            st_point = n+1;
            break
        end
    end    
    clear junk
    fclose(fid);
end

%read in data
formatSpec = '%f%*s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f';
delimiter = '\t';
fid=fopen(fn);
if fid>0
    for n = 1:st_point
        junk = fgetl(fid);
    end
    n = 0;
    while ~feof(fid) 
        dataArray = textscan(fid, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
    end
end
fclose(fid);

d.EP=dataArray{1};
d.PP=dataArray{2};
d.TT=dataArray{3};
d.RH=dataArray{4};
d.WS=dataArray{6};
d.WD=dataArray{7};
d.LAT=dataArray{10};
d.LON=dataArray{11};
d.AcRate=dataArray{12};
d.ZZ=dataArray{13};

[~, ~, E]=file_times(d.DT');
new_E=E+d.EP;
[~, d.JD, d.DT] = unixtime2mat(new_E);    
