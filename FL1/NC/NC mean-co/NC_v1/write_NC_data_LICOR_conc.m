function write_NC_data_LICOR_conc(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.licor.mean_T)==1);
    if ~isempty(ix)
        data.licor.mean_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.std_T)==1);
    if ~isempty(ix)
        data.licor.std_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.mean_PP)==1);
    if ~isempty(ix)
        data.licor.mean_PP(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.std_PP)==1);
    if ~isempty(ix)
        data.licor.std_PP(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.mean_DPT)==1);
    if ~isempty(ix)
        data.licor.mean_DPT(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.std_DPT)==1);
    if ~isempty(ix)
        data.licor.std_DPT(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.mean_CO2)==1);
    if ~isempty(ix)
        data.licor.mean_CO2(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.std_CO2)==1);
    if ~isempty(ix)
        data.licor.std_CO2(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.mean_H2O)==1);
    if ~isempty(ix)
        data.licor.mean_H2O(ix)=-1e20;   
    end
    
    ix=find(isnan(data.licor.std_H2O)==1);
    if ~isempty(ix)
        data.licor.std_H2O(ix)=-1e20;   
    end
%Save data
    nc_varput(fn_nc,'time',data.licor.ET);
    nc_varput(fn_nc,'alt_time',data.licor.ST);
    nc_varput(fn_nc,'day_of_year',data.licor.DoY);
    nc_varput(fn_nc,'year',data.licor.DT(:,1));
    nc_varput(fn_nc,'month',data.licor.DT(:,2));
    nc_varput(fn_nc,'day',data.licor.DT(:,3));
    nc_varput(fn_nc,'hour',data.licor.DT(:,4));
    nc_varput(fn_nc,'minute',data.licor.DT(:,5));
    nc_varput(fn_nc,'second',data.licor.DT(:,6));
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    
    nc_varput(fn_nc,'air_temperature',data.licor.mean_T+273.15);
    nc_varput(fn_nc,'divergence_of_air_temperature',data.licor.std_T);
    nc_varput(fn_nc,'surface_air_pressure',data.licor.mean_PP.*100);
    nc_varput(fn_nc,'divergence_of_surface_air_pressure',data.licor.std_PP);
    nc_varput(fn_nc,'dew_point_temperature',data.licor.mean_DPT+273.15);
    nc_varput(fn_nc,'divergence_of_dew_point_temperature',data.licor.std_DPT);
    nc_varput(fn_nc,'mole_concentration_of_carbon_dioxide_in_air',data.licor.mean_CO2(:,1)./1000);
    nc_varput(fn_nc,'divergence_of_mole_concentration_of_carbon_dioxide_in_air',data.licor.std_CO2(:,1));
    nc_varput(fn_nc,'mole_concentration_of_water_vapor_in_air',data.licor.mean_H2O(:,1)./1000);
    nc_varput(fn_nc,'divergence_of_mole_concentration_of_water_vapor_in_air',data.licor.std_H2O(:,1));
    
    nc_varput(fn_nc,'qc_flag_temperature',data.licor.flag.T);
    nc_varput(fn_nc,'qc_flag_pressure',data.licor.flag.PP);
    nc_varput(fn_nc,'qc_flag_dew_point_temperature',data.licor.flag.DPT);
    nc_varput(fn_nc,'qc_flag_co2_concentration',data.licor.flag.CO2);
    nc_varput(fn_nc,'qc_flag_h2o_concentration',data.licor.flag.H2O);
    