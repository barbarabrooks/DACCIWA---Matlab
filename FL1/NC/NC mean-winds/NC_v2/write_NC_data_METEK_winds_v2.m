function write_NC_data_METEK_winds_v2(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.means.sonic.mean_T)==1);
    if ~isempty(ix)
        data.means.sonic.mean_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.std_T)==1);
    if ~isempty(ix)
        data.means.sonic.std_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.mean_WS)==1);
    if ~isempty(ix)
        data.means.sonic.mean_WS(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.gust_WS)==1);
    if ~isempty(ix)
        data.means.sonic.gust_WS(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.mean_WD)==1);
    if ~isempty(ix)
        data.means.sonic.mean_WD(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.gust_WD)==1);
    if ~isempty(ix)
        data.means.sonic.gust_WD(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.mean_uvw)==1);
    if ~isempty(ix)
        data.means.sonic.mean_uvw(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.sonic.std_uvw)==1);
    if ~isempty(ix)
        data.means.sonic.std_uvw(ix)=-1e20;   
    end
%Save data
    nc_varput(fn_nc,'time',data.means.ET);
    nc_varput(fn_nc,'day_of_year',data.means.DoY);
    nc_varput(fn_nc,'year',data.means.DT(:,1));
    nc_varput(fn_nc,'month',data.means.DT(:,2));
    nc_varput(fn_nc,'day',data.means.DT(:,3));
    nc_varput(fn_nc,'hour',data.means.DT(:,4));
    nc_varput(fn_nc,'minute',data.means.DT(:,5));
    nc_varput(fn_nc,'second',data.means.DT(:,6));
    nc_varput(fn_nc,'latitude',meta{length(meta)-2});
    nc_varput(fn_nc,'longitude',meta{length(meta)-1});
    
    nc_varput(fn_nc,'wind_speed',data.means.sonic.mean_WS);
    nc_varput(fn_nc,'wind_from_direction',data.means.sonic.mean_WD);
    nc_varput(fn_nc,'wind_speed_of_gust',data.means.sonic.gust_WS(:,2));
    nc_varput(fn_nc,'wind_speed_of_gust_from_direction',data.means.sonic.gust_WD(:,2));
    nc_varput(fn_nc,'eastward_wind',data.means.sonic.mean_uvw(:,1));
    nc_varput(fn_nc,'northward_wind',data.means.sonic.mean_uvw(:,2));
    nc_varput(fn_nc,'upward_air_velocity',data.means.sonic.mean_uvw(:,3));
    nc_varput(fn_nc,'divergence_of_eastward_wind',data.means.sonic.std_uvw(:,1));
    nc_varput(fn_nc,'divergence_of_northward_wind',data.means.sonic.std_uvw(:,2));
    nc_varput(fn_nc,'divergence_of_upward_air_velocity',data.means.sonic.std_uvw(:,3));
    nc_varput(fn_nc,'sonic_air_temperature',data.means.sonic.mean_T+273.15);
    nc_varput(fn_nc,'divergence_of_sonic_air_temperature',data.means.sonic.std_T);
    
    nc_varput(fn_nc,'qc_flag_temperature',data.means.sonic.flag.T);
    nc_varput(fn_nc,'qc_flag_wind_speed',data.means.sonic.flag.WS);
    nc_varput(fn_nc,'qc_flag_wind_direction',data.means.sonic.flag.WD);
    nc_varput(fn_nc,'qc_flag_wind_component_eastward',data.means.sonic.flag.uvw(:,1));
    nc_varput(fn_nc,'qc_flag_wind_component_northward',data.means.sonic.flag.uvw(:,2));
    nc_varput(fn_nc,'qc_flag_wind_component_upward',data.means.sonic.flag.uvw(:,3));
    