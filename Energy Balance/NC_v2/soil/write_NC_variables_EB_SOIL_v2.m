function write_NC_variables_EB_SOIL_v2(fn_nc, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=min(data.SHF.ET);
        as(6).Name='valid_max';as(6).Value=max(data.SHF.ET);
        as(7).Name='calendar';as(7).Value='julian';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%latitude
        ts.Name='latitude';
        ts.Nctype='double';
        dc=cell(1);dc{1}='latitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree_north';
        as(2).Name='standard_name';as(2).Value='latitude';
        as(3).Name='long_name';as(3).Value='Latitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%longitude
        ts.Name='longitude';
        ts.Nctype='double';
        dc=cell(1);dc{1}='longitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree_east';
        as(2).Name='standard_name';as(2).Value='longitude';
        as(3).Name='long_name';as(3).Value='Longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%sensor_number
        ts.Name='sensor_number';
        ts.Nctype='int';
        dc=cell(1);dc{1}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Sensor number';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day_of_year
        ts.Name='day_of_year';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day of Year';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=366;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%year
        ts.Name='year';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Year';
        as(3).Name='valid_min';as(3).Value=1900;
        as(4).Name='valid_max';as(4).Value=2100;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%month
        ts.Name='month';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Month';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=12;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day
        ts.Name='day';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=31;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%hour
        ts.Name='hour';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Hour';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=23;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%minute
        ts.Name='minute';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Minute';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=59;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%second
        ts.Name='second';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Second';
        as(3).Name='valid_min';as(3).Value=0.0000;
        as(4).Name='valid_max';as(4).Value=59.9999;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
        
%downward_heat_flux_in_soil
        ts.Name='downward_heat_flux_in_soil';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='downward_heat_flux_in_soil';
        as(3).Name='long_name';as(3).Value='Downward Heat Flux in Soil';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=-200;
        as(6).Name='valid_max';as(6).Value=200;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%soil_temperature
        ts.Name='soil_temperature';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='soil_temperature';
        as(3).Name='long_name';as(3).Value='Soil Temperature';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=238.15;
        as(6).Name='valid_max';as(6).Value=323.15;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%soil_water_potential
        ts.Name='soil_water_potential';
        ts.Nctype='double';
        dc=cell(1,2);dc{1}='time';dc{2}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='kPa';
        as(2).Name='long_name';as(2).Value='Soil Water Potential';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=200;
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
            
%qc_flag_soil_heat_flux
        ts.Name='qc_flag_soil_heat_flux';
        ts.Nctype='int';
        dc=cell(1,2);dc{1}='time';dc{2}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Soil Heat Flux';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%qc_flag_soil_temperature
        ts.Name='qc_flag_soil_temperature';
        ts.Nctype='int';
        dc=cell(1,2);dc{1}='time';dc{2}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Soil Temperature';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_soil_water_potential
        ts.Name='qc_flag_soil_water_potential';
        ts.Nctype='int';
        dc=cell(1,2);dc{1}='time';dc{2}='sensor_number';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Soil Water Potential';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
        
        
        
        
        