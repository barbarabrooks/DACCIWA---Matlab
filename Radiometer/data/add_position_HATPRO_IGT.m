%function add_position_HATPRO_IGT(dn)
%this only needs to be run if the deployed on a moving platform
%need to DD Lat long, heading
%dn - directory with mat lab files in - same for output

dn='G:\renfrew\radiometer\matlab';
fsh = 'G:\renfrew\ship\matlab\ship_final_1min.mat';

load(fsh);
list=dir(dn);

for n = 3 : length(list)
    load(fullfile(dn,list(n).name));
    display(['n= ' , num2str(n) , ' ' , fullfile(dn,list(n).name)])
    
    %HKD
    data.HKD.lat = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.lon = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.course_true = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.speed_wr_ground = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.orientation = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.speed_wr_water = ones(size(data.HKD.DoY)).*NaN;
    for m = 1 : length(data.HKD.DoY)
        ix=find(ship.DoY<=data.HKD.DoY(m));
        if ~isempty(ix)
            data.HKD.lat(m) = ship.Lat(ix(end));
            data.HKD.lon(m) = ship.Lon(ix(end));
            data.HKD.course_true(m) = ship.Course(ix(end));
            data.HKD.speed_wr_ground(m) = ship.Speed(ix(end));
            data.HKD.orientation(m) = ship.Orientation(ix(end));
            data.HKD.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %HPC
    data.HPC.lat = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.lon = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.course_true = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.speed_wr_ground = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.orientation = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.speed_wr_water = ones(size(data.HPC.DoY)).*NaN;
    for m = 1 : length(data.HPC.DoY)
        ix=find(ship.DoY<=data.HPC.DoY(m));
        if ~isempty(ix)
            data.HPC.lat(m) = ship.Lat(ix(end));
            data.HPC.lon(m) = ship.Lon(ix(end));
            data.HPC.course_true(m) = ship.Course(ix(end));
            data.HPC.speed_wr_ground(m) = ship.Speed(ix(end));
            data.HPC.orientation(m) = ship.Orientation(ix(end));
            data.HPC.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %IWV
    data.IWV.lat = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.lon = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.course_true = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.speed_wr_ground = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.orientation = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.speed_wr_water = ones(size(data.IWV.DoY)).*NaN;
    for m = 1 : length(data.IWV.DoY)
        ix=find(ship.DoY<=data.IWV.DoY(m));
        if ~isempty(ix)
            data.IWV.lat(m) = ship.Lat(ix(end));
            data.IWV.lon(m) = ship.Lon(ix(end));
            data.IWV.course_true(m) = ship.Course(ix(end));
            data.IWV.speed_wr_ground(m) = ship.Speed(ix(end));
            data.IWV.orientation(m) = ship.Orientation(ix(end));
            data.IWV.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %LWP
    data.LWP.lat = ones(size(data.LWP.DoY)).*NaN;
    data.LWP.lon = ones(size(data.LWP.DoY)).*NaN;
    data.LWP.course_true = ones(size(data.LWP.DoY)).*NaN;
    data.LWP.speed_wr_ground = ones(size(data.LWP.DoY)).*NaN;
    data.LWP.orientation = ones(size(data.LWP.DoY)).*NaN;
    data.IWP.speed_wr_water = ones(size(data.LWP.DoY)).*NaN;
    for m = 1 : length(data.LWP.DoY)
        ix=find(ship.DoY<=data.LWP.DoY(m));
        if ~isempty(ix)
            data.LWP.lat(m) = ship.Lat(ix(end));
            data.LWP.lon(m) = ship.Lon(ix(end));
            data.LWP.course_true(m) = ship.Course(ix(end));
            data.LWP.speed_wr_ground(m) = ship.Speed(ix(end));
            data.LWP.orientation(m) = ship.Orientation(ix(end));
            data.LWP.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %MET
    data.MET.lat = ones(size(data.MET.DoY)).*NaN;
    data.MET.lon = ones(size(data.MET.DoY)).*NaN;
    data.MET.course_true = ones(size(data.MET.DoY)).*NaN;
    data.MET.speed_wr_ground = ones(size(data.MET.DoY)).*NaN;
    data.MET.orientation = ones(size(data.MET.DoY)).*NaN;
    data.MET.speed_wr_water = ones(size(data.MET.DoY)).*NaN;
    for m = 1 : length(data.MET.DoY)
        ix=find(ship.DoY<=data.MET.DoY(m));
        if ~isempty(ix)
            data.MET.lat(m) = ship.Lat(ix(end));
            data.MET.lon(m) = ship.Lon(ix(end));
            data.MET.course_true(m) = ship.Course(ix(end));
            data.MET.speed_wr_ground(m) = ship.Speed(ix(end));
            data.MET.orientation(m) = ship.Orientation(ix(end));
            data.MET.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %STA
    data.STA.lat = ones(size(data.STA.DoY)).*NaN;
    data.STA.lon = ones(size(data.STA.DoY)).*NaN;
    data.STA.course_true = ones(size(data.STA.DoY)).*NaN;
    data.STA.speed_wr_ground = ones(size(data.STA.DoY)).*NaN;
    data.STA.orientation = ones(size(data.STA.DoY)).*NaN;
    data.STA.speed_wr_water = ones(size(data.STA.DoY)).*NaN;
    for m = 1 : length(data.STA.DoY)
        ix=find(ship.DoY<=data.STA.DoY(m));
        if ~isempty(ix)
            data.STA.lat(m) = ship.Lat(ix(end));
            data.STA.lon(m) = ship.Lon(ix(end));
            data.STA.course_true(m) = ship.Course(ix(end));
            data.STA.speed_wr_ground(m) = ship.Speed(ix(end));
            data.STA.orientation(m) = ship.Orientation(ix(end));
            data.STA.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %TPB
    data.TPB.lat = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.lon = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.course_true = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.speed_wr_ground = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.orientation = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.speed_wr_water = ones(size(data.TPB.DoY)).*NaN;
    for m = 1 : length(data.TPB.DoY)
        ix=find(ship.DoY<=data.TPB.DoY(m));
        if ~isempty(ix)
            data.TPB.lat(m) = ship.Lat(ix(end));
            data.TPB.lon(m) = ship.Lon(ix(end));
            data.TPB.course_true(m) = ship.Course(ix(end));
            data.TPB.speed_wr_ground(m) = ship.Speed(ix(end));
            data.TPB.orientation(m) = ship.Orientation(ix(end));
            data.TPB.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %TPC
    data.TPC.lat = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.lon = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.course_true = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.speed_wr_ground = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.orientation = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.speed_wr_water = ones(size(data.TPC.DoY)).*NaN;
    for m = 1 : length(data.TPC.DoY)
        ix=find(ship.DoY<=data.TPC.DoY(m));
        if ~isempty(ix)
            data.TPC.lat(m) = ship.Lat(ix(end));
            data.TPC.lon(m) = ship.Lon(ix(end));
            data.TPC.course_true(m) = ship.Course(ix(end));
            data.TPC.speed_wr_ground(m) = ship.Speed(ix(end));
            data.TPC.orientation(m) = ship.Orientation(ix(end));
            data.TPC.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %BRT
    data.BRT.lat = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.lon = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.course_rtue = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.speed_wr_ground = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.orientation = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.speed_wr_water = ones(size(data.BRT.DoY)).*NaN;
    for m = 1 : length(data.BRT.DoY)
        ix=find(ship.DoY<=data.BRT.DoY(m));
        if ~isempty(ix)
            data.BRT.lat(m) = ship.Lat(ix(end));
            data.BRT.lon(m) = ship.Lon(ix(end));
            data.BRT.course_true(m) = ship.Course(ix(end));
            data.BRT.speed_wr_ground(m) = ship.Speed(ix(end));
            data.BRT.orientation(m) = ship.Orientation(ix(end));
            data.BRT.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %ATN
    data.ATN.lat = ones(size(data.ATN.DoY)).*NaN;
    data.ATN.lon = ones(size(data.ATN.DoY)).*NaN;
    data.ATN.course_true = ones(size(data.ATN.DoY)).*NaN;
    data.ATN.speed_wr_ground = ones(size(data.ATN.DoY)).*NaN;
    data.ATN.orientation = ones(size(data.ATN.DoY)).*NaN;
    data.ATN.speed_wr_water = ones(size(data.ATN.DoY)).*NaN;
    for m = 1 : length(data.ATN.DoY)
        ix=find(ship.DoY<=data.ATN.DoY(m));
        if ~isempty(ix)
            data.ATN.lat(m) = ship.Lat(ix(end));
            data.ATN.lon(m) = ship.Lon(ix(end));
            data.ATN.course_true(m) = ship.Course(ix(end));
            data.ATN.speed_wr_ground(m) = ship.Speed(ix(end));
            data.ATN.orientation(m) = ship.Orientation(ix(end));
            data.ATN.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %CMP_TPC
    data.CMP_TPC.lat = ones(size(data.CMP_TPC.DoY)).*NaN;
    data.CMP_TPC.lon = ones(size(data.CMP_TPC.DoY)).*NaN;
    data.CMP_TPC.course_true = ones(size(data.CMP_TPC.DoY)).*NaN;
    data.CMP_TPC.speed_wr_ground = ones(size(data.CMP_TPC.DoY)).*NaN;
    data.CMP_TPC.orientation = ones(size(data.CMP_TPC.DoY)).*NaN;
    data.CMP_TPC.speed_wr_water = ones(size(data.CMP_TPC.DoY)).*NaN;
    for m = 1 : length(data.CMP_TPC.DoY)
        ix=find(ship.DoY<=data.CMP_TPC.DoY(m));
        if ~isempty(ix)
            data.CMP_TPC.lat(m) = ship.Lat(ix(end));
            data.CMP_TPC.lon(m) = ship.Lon(ix(end));
            data.CMP_TPC.course_true(m) = ship.Course(ix(end));
            data.CMP_TPC.speed_wr_ground(m) = ship.Speed(ix(end));
            data.CMP_TPC.orientation(m) = ship.Orientation(ix(end));
            data.CMP_TPC.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    %BLH
    data.BLH.lat = ones(size(data.BLH.DoY)).*NaN;
    data.BLH.lon = ones(size(data.BLH.DoY)).*NaN;
    data.BLH.course_true = ones(size(data.BLH.DoY)).*NaN;
    data.BLH.speed_wr_ground = ones(size(data.BLH.DoY)).*NaN;
    data.BLH.orientation = ones(size(data.BLH.DoY)).*NaN;
    data.BLH.speed_wr_water = ones(size(data.BLH.DoY)).*NaN;
    for m = 1 : length(data.BLH.DoY)
        ix=find(ship.DoY<=data.BLH.DoY(m));
        if ~isempty(ix)
            data.BLH.lat(m) = ship.Lat(ix(end));
            data.BLH.lon(m) = ship.Lon(ix(end));
            data.BLH.course_true(m) = ship.Course(ix(end));
            data.BLH.speed_wr_ground(m) = ship.Speed(ix(end));
            data.BLH.orientation(m) = ship.Orientation(ix(end));
            data.BLH.speed_wr_water(m) = ship.Speed_wr_water(ix(end));
        end
    end
    
    save(fullfile(dn,list(n).name),'data')
    clear data 
end