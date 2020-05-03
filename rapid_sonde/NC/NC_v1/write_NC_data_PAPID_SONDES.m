function write_NC_data_RAPID_SONDES(fn_nc, data)
%get rid of NaN
    ix=find(isnan(data.PP)==1);
    if ~isempty(ix)
        data.PP(ix)=-1e20;   
    end
    
    ix=find(isnan(data.TT)==1);
    if ~isempty(ix)
        data.TT(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.RH)==1);
    if ~isempty(ix)
        data.RH(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.Altitude)==1);
    if ~isempty(ix)
        data.Altitude(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.WS)==1);
    if ~isempty(ix)
        data.WS(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.WD)==1);
    if ~isempty(ix)
        data.WD(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.LAT)==1);
    if ~isempty(ix)
        data.LAT(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.LON)==1);
    if ~isempty(ix)
        data.LON(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.AcRate)==1);
    if ~isempty(ix)
        data.AcRate(ix)=-1e20;   
    end
    clear ix
    
%Save data
    nc_varput(fn_nc,'time',data.ET);
    nc_varput(fn_nc,'alt_time',data.ST);
    nc_varput(fn_nc,'day_of_year',data.DoY);
    nc_varput(fn_nc,'year',data.DT(:,1));
    nc_varput(fn_nc,'month',data.DT(:,2));
    nc_varput(fn_nc,'day',data.DT(:,3));
    nc_varput(fn_nc,'hour',data.DT(:,4));
    nc_varput(fn_nc,'minute',data.DT(:,5));
    nc_varput(fn_nc,'second',data.DT(:,6));
    nc_varput(fn_nc,'elapsed_time',data.Elapsed_Time);
    nc_varput(fn_nc,'latitude',data.LAT);
    nc_varput(fn_nc,'longitude',data.LON);
    nc_varput(fn_nc,'altitude',data.Altitude);
    nc_varput(fn_nc,'air_pressure',(data.PP.*100));
    nc_varput(fn_nc,'air_temperature',(data.TT+273.15));
    nc_varput(fn_nc,'relative_humidity',data.RH);
    nc_varput(fn_nc,'wind_speed',data.WS);
    nc_varput(fn_nc,'wind_from_direction',data.WD);
    nc_varput(fn_nc,'upward_balloon_velocity',data.AcRate);
    nc_varput(fn_nc,'qc_flag',data.flag);
    
    