function write_NC_data_METEK_winds(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.sonic.mean_T)==1);
    if ~isempty(ix)
        data.sonic.mean_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.std_T)==1);
    if ~isempty(ix)
        data.sonic.std_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.mean_WS)==1);
    if ~isempty(ix)
        data.sonic.mean_WS(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.gust_WS)==1);
    if ~isempty(ix)
        data.sonic.gust_WS(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.mean_WD)==1);
    if ~isempty(ix)
        data.sonic.mean_WD(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.gust_WD)==1);
    if ~isempty(ix)
        data.sonic.gust_WD(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.mean_uvw)==1);
    if ~isempty(ix)
        data.sonic.mean_uvw(ix)=-1e20;   
    end
    
    ix=find(isnan(data.sonic.std_uvw)==1);
    if ~isempty(ix)
        data.sonic.std_uvw(ix)=-1e20;   
    end
%Save data
    nc_varput(fn_nc,'time',data.sonic.ET);
    nc_varput(fn_nc,'alt_time',data.sonic.ST);
    nc_varput(fn_nc,'day_of_year',data.sonic.DoY);
    nc_varput(fn_nc,'year',data.sonic.DT(:,1));
    nc_varput(fn_nc,'month',data.sonic.DT(:,2));
    nc_varput(fn_nc,'day',data.sonic.DT(:,3));
    nc_varput(fn_nc,'hour',data.sonic.DT(:,4));
    nc_varput(fn_nc,'minute',data.sonic.DT(:,5));
    nc_varput(fn_nc,'second',data.sonic.DT(:,6));
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    
    nc_varput(fn_nc,'wind_speed',data.sonic.mean_WS);
    nc_varput(fn_nc,'wind_from_direction',data.sonic.mean_WD);
    nc_varput(fn_nc,'wind_speed_of_gust',data.sonic.gust_WS(:,2));
    nc_varput(fn_nc,'wind_speed_of_gust_from_direction',data.sonic.gust_WD(:,2));
    nc_varput(fn_nc,'eastward_wind',data.sonic.mean_uvw(:,1));
    nc_varput(fn_nc,'northward_wind',data.sonic.mean_uvw(:,2));
    nc_varput(fn_nc,'upward_air_velocity',data.sonic.mean_uvw(:,3));
    nc_varput(fn_nc,'divergence_of_eastward_wind',data.sonic.std_uvw(:,1));
    nc_varput(fn_nc,'divergence_of_northward_wind',data.sonic.std_uvw(:,2));
    nc_varput(fn_nc,'divergence_of_upward_air_velocity',data.sonic.std_uvw(:,3));
    nc_varput(fn_nc,'sonic_air_temperature',data.sonic.mean_T+273.15);
    nc_varput(fn_nc,'divergence_of_sonic_air_temperature',data.sonic.std_T);
    
    nc_varput(fn_nc,'qc_flag_temperature',data.sonic.flag.T);
    nc_varput(fn_nc,'qc_flag_wind_speed',data.sonic.flag.WS);
    nc_varput(fn_nc,'qc_flag_wind_direction',data.sonic.flag.WD);
    nc_varput(fn_nc,'qc_flag_wind_component_eastward',data.sonic.flag.uvw(:,1));
    nc_varput(fn_nc,'qc_flag_wind_component_northward',data.sonic.flag.uvw(:,2));
    nc_varput(fn_nc,'qc_flag_wind_component_upward',data.sonic.flag.uvw(:,3));
    