function write_NC_MET_qc_flags_v4(fn_nc, flag)

%qc_flag_surface_temperature
    %define variable
        ts.Name='qc_flag_surface_temperature';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Surface Temperature';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_temperature_outside_sensor_operational_range',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
    %save data
        nc_varput(fn_nc,'qc_flag_surface_temperature',int8(flag.T));
        
%qc_flag_surface_relative_humidity
    %define variable
        ts.Name='qc_flag_surface_relative_humidity';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Surface Relative Humidity';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_relative_humidity_outside_sensor_operational_range',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data       
        nc_varput(fn_nc,'qc_flag_surface_relative_humidity',int8(flag.RH));
    
 %qc_flag_surface_pressure
    %define variable
        ts.Name='qc_flag_surface_pressure';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Surface Pressure';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'bad_data_pressure_outside_sensor_operational_range',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data  
        nc_varput(fn_nc,'qc_flag_surface_pressure',int8(flag.PP));
        
 %qc_flag_precipitation
    %define variable
        ts.Name='qc_flag_precipitation';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: Precipitation';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s',... 
    'not_used',...
    'good_data',... 
    'suspect_data_precipitation_detected',...
    'suspect_data_time_stamp_error');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
    %save data       
        nc_varput(fn_nc,'qc_flag_precipitation',flag.RAIN);
        