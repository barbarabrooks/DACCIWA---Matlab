function write_NC_data_LICOR_conc_v2(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.means.licor.mean_T)==1);
    if ~isempty(ix)
        data.means.licor.mean_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.std_T)==1);
    if ~isempty(ix)
        data.means.licor.std_T(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.mean_PP)==1);
    if ~isempty(ix)
        data.means.licor.mean_PP(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.std_PP)==1);
    if ~isempty(ix)
        data.means.licor.std_PP(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.mean_CO2)==1);
    if ~isempty(ix)
        data.means.licor.mean_CO2(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.std_CO2)==1);
    if ~isempty(ix)
        data.means.licor.std_CO2(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.mean_H2O)==1);
    if ~isempty(ix)
        data.means.licor.mean_H2O(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.licor.std_H2O)==1);
    if ~isempty(ix)
        data.means.licor.std_H2O(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.water.mean_Q)==1);
    if ~isempty(ix)
        data.means.water.mean_Q(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.water.std_Q)==1);
    if ~isempty(ix)
        data.means.water.std_Q(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.water.mean_WVMMR)==1);
    if ~isempty(ix)
        data.means.water.mean_WVMMR(ix)=-1e20;   
    end
    
    ix=find(isnan(data.means.water.std_WVMMR)==1);
    if ~isempty(ix)
        data.means.water.std_WVMMR(ix)=-1e20;   
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
    
    nc_varput(fn_nc,'air_temperature',data.means.licor.mean_T+273.15);
    nc_varput(fn_nc,'divergence_of_air_temperature',data.means.licor.std_T);
    nc_varput(fn_nc,'air_pressure',data.means.licor.mean_PP.*10);
    nc_varput(fn_nc,'divergence_of_air_pressure',data.means.licor.std_PP);
    nc_varput(fn_nc,'mole_concentration_of_carbon_dioxide_in_air',data.means.licor.mean_CO2(:,1));
    nc_varput(fn_nc,'divergence_of_mole_concentration_of_carbon_dioxide_in_air',data.means.licor.std_CO2(:,1));
    nc_varput(fn_nc,'mole_concentration_of_water_vapor_in_air',data.means.licor.mean_H2O(:,1));
    nc_varput(fn_nc,'divergence_of_mole_concentration_of_water_vapor_in_air',data.means.licor.std_H2O(:,1));
    nc_varput(fn_nc,'specific_humidity',data.means.water.mean_Q);
    nc_varput(fn_nc,'divergence_of_specific_humidity',data.means.water.std_Q);
    nc_varput(fn_nc,'humidity_mixing_ratio',data.means.water.mean_WVMMR(:,1));
    nc_varput(fn_nc,'divergence_of_wvmmr',data.means.water.std_WVMMR(:,1));
    
    nc_varput(fn_nc,'qc_flag_temperature',data.means.licor.flag.T);
    nc_varput(fn_nc,'qc_flag_pressure',data.means.licor.flag.PP);
    nc_varput(fn_nc,'qc_flag_co2_concentration',data.means.licor.flag.CO2);
    nc_varput(fn_nc,'qc_flag_h2o_concentration',data.means.licor.flag.H2O);
    