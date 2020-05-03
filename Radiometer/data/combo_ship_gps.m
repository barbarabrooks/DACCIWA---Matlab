load('G:\renfrew\ship\matlab\ship.mat')
ship_old = ship;

load('G:\renfrew\ship\IGT - NEMA\matlab\IGT_nema_1min.mat')
nmea = ship;
clear ship

ship = ship_old;
ship.Speed_wr_water = ones(size(ship.DoY)).*NaN;

for n = 1 : length(ship.DoY)
    ix = find(nmea.doy == ship.DoY(n));
    if ~isempty (ix)
        if isnan(ship.Course(n))
            ship.Course(n) = nmea.heading(ix(1));
        end
        if isnan(ship.Speed(n))
            ship.Speed(n) = nmea.speed_wr_ground(ix(1));
        end
        if isnan(ship.Orientation(n))
            ship.Orientation(n) = nmea.heading(ix(1));
        end
        if isnan(ship.Lat(n))
            ship.Lat(n) = nmea.lat(ix(1));
        end
        if isnan(ship.Lon(n))
            ship.Lon(n) = nmea.lon(ix(1));
        end
        if isnan(ship.Speed_wr_water(n))
            ship.Speed_wr_water(n) = nmea.speed_wr_water(ix(1));
        end
     
    end
end