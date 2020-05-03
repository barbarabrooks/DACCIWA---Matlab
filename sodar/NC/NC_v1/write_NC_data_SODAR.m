function write_NC_data_SODAR(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.B_avg)==1);
    if ~isempty(ix)
        data.B_avg(ix)=-1e20;   
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
    
    ix=find(isnan(data.U)==1);
    if ~isempty(ix)
        data.U(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.V)==1);
    if ~isempty(ix)
        data.V(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.W)==1);
    if ~isempty(ix)
        data.W(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.sigU)==1);
    if ~isempty(ix)
        data.sigU(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.sigV)==1);
    if ~isempty(ix)
        data.sigV(ix)=-1e20;   
    end
    clear ix
    
    ix=find(isnan(data.sigW)==1);
    if ~isempty(ix)
        data.sigW(ix)=-1e20;   
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
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    ix=strfind(meta.l34,'m');
    x=str2num(meta.l34(1:ix-1));
    xx=data.Z(1,:)+x;
    nc_varput(fn_nc,'altitude',xx);
    
    nc_varput(fn_nc,'sound_intensity_level_in_air',log10(data.B_avg));
    nc_varput(fn_nc,'wind_speed',data.WS);
    nc_varput(fn_nc,'wind_from_direction',data.WD);
    nc_varput(fn_nc,'eastward_wind',data.U);
    nc_varput(fn_nc,'northward_wind',data.V);
    nc_varput(fn_nc,'upward_air_velocity',data.W);
    nc_varput(fn_nc,'divergence_of_eastward_wind',data.sigU);
    nc_varput(fn_nc,'divergence_of_northward_wind',data.sigV);
    nc_varput(fn_nc,'divergence_of_upward_air_velocity',data.sigW);
    
    nc_varput(fn_nc,'qc_flag_mean_winds',data.flag.winds);
    nc_varput(fn_nc,'qc_flag_wind_component_eastward',data.flag.components.U);
    nc_varput(fn_nc,'qc_flag_wind_component_northward',data.flag.components.V);
    nc_varput(fn_nc,'qc_flag_wind_component_upward',data.flag.components.W);
    nc_varput(fn_nc,'qc_flag_backscatter',data.flag.backscatter);
    nc_varput(fn_nc,'qc_flag_background_noise',data.flag.background_noise);