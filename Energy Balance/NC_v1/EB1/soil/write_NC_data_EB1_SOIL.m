function write_NC_data_EB1_SOIL(fn_nc, meta, data)
%get rid of NaN
    ix=find(isnan(data.SHF.SHF)==1);
    if ~isempty(ix)
        data.SHF.SHF(ix)=-1e20;   
    end
%get rid of NaN
    ix=find(isnan(data.ST.ST)==1);
    if ~isempty(ix)
        data.ST.ST(ix)=-1e20;   
    end
%get rid of NaN
    ix=find(isnan(data.SM.SM)==1);
    if ~isempty(ix)
        data.SM.SM(ix)=-1e20;   
    end
%Save data
    nc_varput(fn_nc,'time',data.SHF.ET);
    nc_varput(fn_nc,'alt_time',data.SHF.ST);
    nc_varput(fn_nc,'day_of_year',data.SHF.DoY);
    nc_varput(fn_nc,'year',data.SHF.DT(:,1));
    nc_varput(fn_nc,'month',data.SHF.DT(:,2));
    nc_varput(fn_nc,'day',data.SHF.DT(:,3));
    nc_varput(fn_nc,'hour',data.SHF.DT(:,4));
    nc_varput(fn_nc,'minute',data.SHF.DT(:,5));
    nc_varput(fn_nc,'second',data.SHF.DT(:,6));
    nc_varput(fn_nc,'latitude',meta.LAT);
    nc_varput(fn_nc,'longitude',meta.LON);
    nc_varput(fn_nc,'sensor_number',(1:3));
    
    nc_varput(fn_nc,'downward_heat_flux_in_soil',data.SHF.SHF);
    nc_varput(fn_nc,'soil_temperature',data.ST.ST+273.15);
    nc_varput(fn_nc,'soil_water_potential',data.SM.SM);
   
    nc_varput(fn_nc,'qc_flag_soil_heat_flux',data.SHF.flag.SHF);
    nc_varput(fn_nc,'qc_flag_soil_temperature',data.ST.flag.ST);
    nc_varput(fn_nc,'qc_flag_soil_water_potential',data.SM.flag.SM);