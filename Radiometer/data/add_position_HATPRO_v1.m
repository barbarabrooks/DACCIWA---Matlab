function add_position_HATPRO_v1(dn,fsh)
%this only needs to be run if the deployed on a moving platform
%need to DD Lat long, heading
%dn - directory with mat lab files in - same for output
%fsh - full path to ship data mat file

%dn='E:\ACSE - radiometer\matlab';
%fsh = 'E:\ACSE - radiometer\ship_5sec_BB.mat';

load(fsh);
list=dir(dn);

for n = 73 : length(list)
    load(fullfile(dn,list(n).name));
    display(['n= ' , num2str(n) , ' ' , fullfile(dn,list(n).name)])
    
    %HKD
    data.HKD.lat = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.lon = ones(size(data.HKD.DoY)).*NaN;
    data.HKD.heading = ones(size(data.HKD.DoY)).*NaN;
    for m = 1 : length(data.HKD.DoY)
        ix=find(ship.doy<=data.HKD.DoY(m));
        if ~isempty(ix)
            data.HKD.lat(m)=ship.lat(ix(end));
            data.HKD.lon(m)=ship.long(ix(end));
            data.HKD.heading(m)=ship.heading(ix(end));
        end
    end
    
    %HPC
    data.HPC.lat = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.lon = ones(size(data.HPC.DoY)).*NaN;
    data.HPC.heading = ones(size(data.HPC.DoY)).*NaN;
    for m = 1 : length(data.HPC.DoY)
        ix=find(ship.doy<=data.HPC.DoY(m));
        if ~isempty(ix)
            data.HPC.lat(m)=ship.lat(ix(end));
            data.HPC.lon(m)=ship.long(ix(end));
            data.HPC.heading(m)=ship.heading(ix(end));
        end
    end
    
    %IWV
    data.IWV.lat = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.lon = ones(size(data.IWV.DoY)).*NaN;
    data.IWV.heading = ones(size(data.IWV.DoY)).*NaN;
    for m = 1 : length(data.IWV.DoY)
        ix=find(ship.doy<=data.IWV.DoY(m));
        if ~isempty(ix)
            data.IWV.lat(m)=ship.lat(ix(end));
            data.IWV.lon(m)=ship.long(ix(end));
            data.IWV.heading(m)=ship.heading(ix(end));
        end
    end
    
    %LWP
    data.LWP.lat = ones(size(data.LWP.DoY)).*NaN;
    data.LWP.lon = ones(size(data.LWP.DoY)).*NaN;
    data.LWP.heading = ones(size(data.LWP.DoY)).*NaN;
    for m = 1 : length(data.LWP.DoY)
        ix=find(ship.doy<=data.LWP.DoY(m));
        if ~isempty(ix)
            data.LWP.lat(m)=ship.lat(ix(end));
            data.LWP.lon(m)=ship.long(ix(end));
            data.LWP.heading(m)=ship.heading(ix(end));
        end
    end
    
    %MET
    data.MET.lat = ones(size(data.MET.DoY)).*NaN;
    data.MET.lon = ones(size(data.MET.DoY)).*NaN;
    data.MET.heading = ones(size(data.MET.DoY)).*NaN;
    for m = 1 : length(data.MET.DoY)
        ix=find(ship.doy<=data.MET.DoY(m));
        if ~isempty(ix)
            data.MET.lat(m)=ship.lat(ix(end));
            data.MET.lon(m)=ship.long(ix(end));
            data.MET.heading(m)=ship.heading(ix(end));
        end
    end
    
    %STA
    data.STA.lat = ones(size(data.STA.DoY)).*NaN;
    data.STA.lon = ones(size(data.STA.DoY)).*NaN;
    data.STA.heading = ones(size(data.STA.DoY)).*NaN;
    for m = 1 : length(data.STA.DoY)
        ix=find(ship.doy<=data.STA.DoY(m));
        if ~isempty(ix)
            data.STA.lat(m)=ship.lat(ix(end));
            data.STA.lon(m)=ship.long(ix(end));
            data.STA.heading(m)=ship.heading(ix(end));
        end
    end
    
    %TPB
    data.TPB.lat = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.lon = ones(size(data.TPB.DoY)).*NaN;
    data.TPB.heading = ones(size(data.TPB.DoY)).*NaN;
    for m = 1 : length(data.TPB.DoY)
        ix=find(ship.doy<=data.TPB.DoY(m));
        if ~isempty(ix)
            data.TPB.lat(m)=ship.lat(ix(end));
            data.TPB.lon(m)=ship.long(ix(end));
            data.TPB.heading(m)=ship.heading(ix(end));
        end
    end
    
    %TPC
    data.TPC.lat = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.lon = ones(size(data.TPC.DoY)).*NaN;
    data.TPC.heading = ones(size(data.TPC.DoY)).*NaN;
    for m = 1 : length(data.TPC.DoY)
        ix=find(ship.doy<=data.TPC.DoY(m));
        if ~isempty(ix)
            data.TPC.lat(m)=ship.lat(ix(end));
            data.TPC.lon(m)=ship.long(ix(end));
            data.TPC.heading(m)=ship.heading(ix(end));
        end
    end
    
    %BRT
    data.BRT.lat = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.lon = ones(size(data.BRT.DoY)).*NaN;
    data.BRT.heading = ones(size(data.BRT.DoY)).*NaN;
    for m = 1 : length(data.BRT.DoY)
        ix=find(ship.doy<=data.BRT.DoY(m));
        if ~isempty(ix)
            data.BRT.lat(m)=ship.lat(ix(end));
            data.BRT.lon(m)=ship.long(ix(end));
            data.BRT.heading(m)=ship.heading(ix(end));
        end
    end
    
    save(fullfile(dn,list(n).name),'data')
    clear data 
end