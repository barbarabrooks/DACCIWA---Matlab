importfile_WP2;
importfile_gga_1s;

%gga
cc = 0;
for n = 1:length(time)
    temp = time{n};
    if (str2num(temp(9:10)) == 28)
        break
    end
    
    if (str2num(temp(end-1:end)) == 0) %1 min data
        cc =cc + 1;
        ship.DT(cc,1) = str2num(temp(1:4));
        ship.DT(cc,2) = str2num(temp(6:7));
        ship.DT(cc,3) = str2num(temp(9:10));
        ship.DT(cc,4) = str2num(temp(12:13));
        ship.DT(cc,5) = str2num(temp(15:16));
        ship.DT(cc,6) = 00;
        ship.Lat(cc,1)= lat(n);
        ship.Lon(cc,1) = lon(n);
        ship.Course(cc,1) = NaN;
        ship.Speed(cc,1) = NaN;
        ship.Orientation(cc,1) = NaN;
    end
    clear temp
end

%parse WP2 file 1 minute
for n = 1: length(Date1)
    cc =cc + 1;
    %parse date and time
    temp = Date1{n};
    temp1 = Time{n};
    ship.DT(cc,1) = str2num(temp(1:4));
    ship.DT(cc,2) = str2num(temp(6:7));
    ship.DT(cc,3) = str2num(temp(9:10));
    ship.DT(cc,4) = str2num(temp1(1:2));
    ship.DT(cc,5) = str2num(temp1(4:5));
    ship.DT(cc,6) = 00;
    clear temp temp1
    
    %parse position
    temp=Shipposition{n};
    if length(temp) == 13
        ship.Lat(cc,1) = str2num(temp(2:5)) + ((str2num(temp(8:13)))/60);
        if temp(1) == 'S'
            ship.Lat(cc,1) = ship.Lat(cc,1)*(-1);
        end
        ship.Lon(cc,1) = str2num(temp(17:20)) + ((str2num(temp(21:27)))/60);
        if temp(15) == 'W'
            ship.Lon(cc,1) = ship.Lon(cc,1)*(-1);
        end
    else
        ship.Lat(cc,1) = NaN;
        ship.Lon(cc,1) = NaN;
    end
    
    ship.Course(cc,1) = Gyro(n);
    ship.Speed(cc,1) = Shipvelocityms(n);
    ship.Orientation(cc,1) = Gyro(n);
    
end
[DoY, ~, E]=file_times(ship.DT');
ship.DoY = DoY';
ship.ET = E';