function write_NC_data_DAVIS_AWS(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.TT)==1);
    if ~isempty(ix)
        data.TT(ix)=-1e20;   
    end
    
    ix=find(isnan(data.PP)==1);
    if ~isempty(ix)
        data.PP(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.RH)==1);
    if ~isempty(ix)
        data.RH(ix)=-1e20;   
    end
    
    ix=find(isnan(data.WS)==1);
    if ~isempty(ix)
        data.WS(ix)=-1e20;   
    end
    
    ix=find(isnan(data.WD)==1);
    if ~isempty(ix)
        data.WD(ix)=-1e20;   
    end
    
    ix=find(isnan(data.LW)==1);
    if ~isempty(ix)
        data.LW(ix)=-1e20;   
    end
    
    ix=find(isnan(data.SW_irrad)==1);
    if ~isempty(ix)
        data.SW_irrad(ix)=-1e20;   
    end
    
    ix=find(isnan(data.RR)==1);
    if ~isempty(ix)
        data.RR(ix)=-1e20;
    end
    
    ix=find(isnan(data.AR)==1);
    if ~isempty(ix)
        data.AR(ix)=-1e20;   
    end
    
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
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    
    nc_varput(fn_nc,'surface_air_pressure',data.PP./100);%pressure in PA in files
    nc_varput(fn_nc,'air_temperature',(data.TT+273.15));% temperatur in C in files
    nc_varput(fn_nc,'relative_humidity',data.RH);
    nc_varput(fn_nc,'wind_speed',data.WS);
    nc_varput(fn_nc,'wind_from_direction',data.WD);
    nc_varput(fn_nc,'thickness_of_rainfall_amount',data.AR);
    nc_varput(fn_nc,'rainfall_rate',data.RR);
    nc_varput(fn_nc,'downwelling_longwave_flux_in_air',data.LW);
    nc_varput(fn_nc,'cie_weighted_downwelling_shortwave_flux_in_air',data.SW_irrad);
    
    nc_varput(fn_nc,'qc_flag_temperature',data.flag_TT);
    nc_varput(fn_nc,'qc_flag_relative_humidity',data.flag_RH);
    nc_varput(fn_nc,'qc_flag_pressure',data.flag_PP);
    nc_varput(fn_nc,'qc_flag_wind',data.flag_WIN);
    nc_varput(fn_nc,'qc_flag_radiation',data.flag_RAD);
    nc_varput(fn_nc,'qc_flag_precipitation',data.flag_PPT);
    