function write_NC_data_SONDES_v4(fn_nc, data)
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
    
    ix=find(isnan(data.ZZ)==1);
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
    nc_varput(fn_nc,'day_of_year',single(data.DoY));
    nc_varput(fn_nc,'year',int32(data.DT(:,1)));
    nc_varput(fn_nc,'month',int32(data.DT(:,2)));
    nc_varput(fn_nc,'day',int32(data.DT(:,3)));
    nc_varput(fn_nc,'hour',int32(data.DT(:,4)));
    nc_varput(fn_nc,'minute',int32(data.DT(:,5)));
    nc_varput(fn_nc,'second',single(data.DT(:,6)));
    nc_varput(fn_nc,'elapsed_time',single(data.EP));
    nc_varput(fn_nc,'latitude',single(data.LAT));
    nc_varput(fn_nc,'longitude',single(data.LON));
    nc_varput(fn_nc,'altitude',single(data.ZZ));
    nc_varput(fn_nc,'air_pressure',single(data.PP));
    nc_varput(fn_nc,'air_temperature',single(data.TT+273.15));
    nc_varput(fn_nc,'relative_humidity',single(data.RH));
    nc_varput(fn_nc,'wind_speed',single(data.WS));
    nc_varput(fn_nc,'wind_from_direction',single(data.WD));
    nc_varput(fn_nc,'upward_balloon_velocity',single(data.AcRate));
    nc_varput(fn_nc,'qc_flag',int8(data.flag));
    
    