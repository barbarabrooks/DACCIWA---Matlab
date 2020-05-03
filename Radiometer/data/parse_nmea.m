%parse nmea - want 1 minute data only
dn = 'G:\renfrew\ship\IGT - NEMA\data';
list = dir(dn);
msg1 = '$GPGGA';
msg2 = '$HEHDT';
msg3 = '$VMVHW';
msg4 = '$GPVTG';

for n = 3 : length(list)
    fid = fopen(fullfile(dn, list(n).name));
    display(list(n).name)
    cc = 0;
    xx = 0;
    sp = 0;
    if fid > 0
        temp = list(n).name;
        y1 = str2num(temp(1:4));
        M1 = str2num(temp(5:6));
        d1 = str2num(temp(7:8));
        %find start of sequence - assume gga is first
        for m = 1 : 100
            junk = fgetl(fid);
            if strfind(junk,msg1) > 0
                sp = m;
                break
            end
        end
    end 
    fclose(fid);
    
    fid = fopen(fullfile(dn, list(n).name));
    if fid > 0
        for m=1: sp - 1;
            junk = fgetl(fid);
            clear junk
        end
        
        while ~feof(fid)
            junk = fgetl(fid);
            if strfind(junk,msg1) == 1
                cc = cc+1;
                DT(cc,:) = ones(1,6).*NaN;
                lat(cc) = NaN;
                lon(cc) = NaN;
                heading(cc) = NaN;
                speed_wr_water(cc,:) = ones(1,2).*NaN;
                track_true(cc) = NaN;
                speed_wr_ground(cc) = NaN;
                
                %gives time and position
                ix = strfind(junk,',');
                %time
                temp = junk(ix(1)+1:ix(2)-1);
                DT(cc,1) = y1;
                DT(cc,2) = M1;
                DT(cc,3) = d1;
                DT(cc,4) = str2num(temp(1:2));
                DT(cc,5) = str2num(temp(3:4));
                DT(cc,6) = str2num(temp(5:6));
                clear temp
                %latitude
                temp = junk(ix(2)+1:ix(3)-1);
                if ~isempty(temp)
                    lat(cc) = str2num(temp(1:2)) + (str2num(temp(3:end)))/60;
                    if ~isempty(strfind(junk(ix(3)+1:ix(4)-1),'S'))
                        lat(cc) = lat(cc) *(-1);
                    end
                else
                    lat(cc) = NaN;
                end
                clear temp
                %longitude
                temp = junk(ix(4)+1:ix(5)-1);
                if ~isempty(temp)
                    lon(cc) = str2num(temp(1:3)) + (str2num(temp(4:end)))/60;
                    if ~isempty(strfind(junk(ix(5)+1:ix(6)-1),'W'))
                        lon(cc) = lon(cc) *(-1);
                    end
                else
                    lon(cc) = NaN;
                end
                clear temp
            end
            
            if (~isempty(strfind(junk,msg2)) && (cc ~= 0))
                %gives heading
                ix = strfind(junk,',');
                temp = str2num(junk(ix(1)+1:ix(2)-1));
                if ~isempty(temp)
                    heading(cc) = temp;
                else
                    heading(cc) = NaN;
                end
                clear ix temp
            end
            if (~isempty(strfind(junk,msg3) == 1) && (cc ~= 0))
                %give speed wrt to water in knotts (* 0.514444 to comver to ms-1) - two per cycle 
                ix = strfind(junk,',');
                xx = xx + 1;
                temp = (str2num(junk(ix(5)+1:ix(6)-1)));
                if ~isempty(temp)
                    speed_wr_water(cc,xx) = temp * 0.514444; %convert to ms-1;
                else
                    speed_wr_water(cc,xx) = NaN;
                end
                clear temp
                if xx == 2
                    xx = 0;
                end
            end
            if (~isempty(strfind(junk,msg4) == 1) && (cc ~= 0))
                %give speed wrt to ground in knotts (* 0.514444 to comver to ms-1) and track 
                ix = strfind(junk,',');
                %track - True
                temp = (str2num(junk(ix(1)+1:ix(2)-1)));
                if ~isempty(temp)
                    track_true(cc) = temp; %convert to ms-1
                else
                    track_true(cc) = NaN;
                end
                clear temp
                %speed over ground knots
                temp = (str2num(junk(ix(5)+1:ix(6)-1)));
                if ~isempty(temp)
                    speed_wr_ground(cc) = temp * 0.514444; %convert to ms-1;
                else
                    speed_wr_ground(cc) = NaN;
                end
                clear temp
            end
            
            clear junk 
        end
        fclose(fid);
        
        ix = find(DT(:,6) == 0);
        if n == 3
            ship.DT = DT(ix,:);
            ship.lat(:,1) = lat(ix);
            ship.lon(:,1) = lon(ix);
            ship.heading(:,1) = heading(ix);
            ship.speed_wr_water(:,1) = speed_wr_water(ix,1);
            %ship.track_true(:,1) = track_true(ix);
            %ship.speed_wr_ground(:,1) = speed_wr_ground(ix);
        else
            ship.DT = [ship.DT;DT(ix,:)];
            ship.lat = [ship.lat(:,1); lat(ix)']; 
            ship.lon = [ship.lon(:,1); lon(ix)'];
            ship.heading = [ship.heading; heading(ix)']; 
            ship.speed_wr_water = [ship.speed_wr_water; speed_wr_water(ix,1)];
            %ship.track_true = [ship.track_true; track_true(ix)']; 
            %ship.speed_wr_ground = [ship.speed_wr_ground; speed_wr_ground(ix)'];
        end
        ix = find(DT(:,6) == 1);
        if n == 3
            ship.track_true(:,1) = track_true(ix);
            ship.speed_wr_ground(:,1) = speed_wr_ground(ix);
        else
            ship.track_true = [ship.track_true; track_true(ix)']; 
            ship.speed_wr_ground = [ship.speed_wr_ground; speed_wr_ground(ix)'];
        end
    end
end
[JD,~,ET] = file_times(ship.DT');
ship.doy = JD';
ship.ET = ET';