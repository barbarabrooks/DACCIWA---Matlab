function write_NC_variables_v4(fn_nc, data)
%time
        ts.Name='time';
        ts.Nctype='float64';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=min(data.ET);
        as(6).Name='valid_max';as(6).Value=max(data.ET);
        as(7).Name='calendar';as(7).Value='standard';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
        
%day_of_year
        ts.Name='day_of_year';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day of Year';
        as(3).Name='valid_min';as(3).Value=single(min(data.DoY));
        as(4).Name='valid_max';as(4).Value=single(max(data.DoY));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%year
        ts.Name='year';
        ts.Nctype='int32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Year';
        as(3).Name='valid_min';as(3).Value=int32(min(data.DT(:,1)));
        as(4).Name='valid_max';as(4).Value=int32(max(data.DT(:,1)));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%month
        ts.Name='month';
        ts.Nctype='int32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Month';
        as(3).Name='valid_min';as(3).Value=int32(min(data.DT(:,2)));
        as(4).Name='valid_max';as(4).Value=int32(max(data.DT(:,2)));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%day
        ts.Name='day';
        ts.Nctype='int32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day';
        as(3).Name='valid_min';as(3).Value=int32(min(data.DT(:,3)));
        as(4).Name='valid_max';as(4).Value=int32(max(data.DT(:,3)));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%hour
        ts.Name='hour';
        ts.Nctype='int32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Hour';
        as(3).Name='valid_min';as(3).Value=int32(min(data.DT(:,4)));
        as(4).Name='valid_max';as(4).Value=int32(max(data.DT(:,4)));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%minute
        ts.Name='minute';
        ts.Nctype='int32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Minute';
        as(3).Name='valid_min';as(3).Value=int32(min(data.DT(:,5)));
        as(4).Name='valid_max';as(4).Value=int32(max(data.DT(:,5)));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%second
        ts.Name='second';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Second';
        as(3).Name='valid_min';as(3).Value=single(min(data.DT(:,6)));
        as(4).Name='valid_max';as(4).Value=single(max(data.DT(:,6)));
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      

%altitude
        ts.Name='altitude';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='standard_name';as(2).Value='altitude';
        as(3).Name='long_name';as(3).Value='Geometric height above geoid (WGS84).';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='axis';as(5).Value='Z';
        as(6).Name='valid_min';as(6).Value=single(min(data.ZZ));
        as(7).Name='valid_max';as(7).Value=single(max(data.ZZ));
        as(8).Name='cell_methods';as(8).Value='time: point';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 

 %latitude
        ts.Name='latitude';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree_north';
        as(2).Name='standard_name';as(2).Value='latitude';
        as(3).Name='long_name';as(3).Value='Latitude';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='axis';as(5).Value='Y';
        as(6).Name='valid_min';as(6).Value=single(min(data.LAT));
        as(7).Name='valid_max';as(7).Value=single(max(data.LAT));
        as(8).Name='cell_methods';as(8).Value='time: point';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%longitude
        ts.Name='longitude';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree_east';
        as(2).Name='standard_name';as(2).Value='longitude';
        as(3).Name='long_name';as(3).Value='Longitude';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='axis';as(5).Value='X';
        as(6).Name='valid_min';as(6).Value=single(min(data.LON));
        as(7).Name='valid_max';as(7).Value=single(max(data.LON));
        as(8).Name='cell_methods';as(8).Value='time: point';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
        
%air_pressure
        ts.Name='air_pressure';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='hPa';
        as(2).Name='standard_name';as(2).Value='air_pressure';
        as(3).Name='long_name';as(3).Value='Pressure';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.PP));
        as(6).Name='valid_max';as(6).Value=single(max(data.PP));
        as(7).Name='cell_methods';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
        
%air_temperature
        ts.Name='air_temperature';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='air_temperature';
        as(3).Name='long_name';as(3).Value='Temperature';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.TT+273.15));
        as(6).Name='valid_max';as(6).Value=single(max(data.TT+273.15));
        as(7).Name='cell_methods';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
        
%relative_humidity
        ts.Name='relative_humidity';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='%';
        as(2).Name='standard_name';as(2).Value='relative_humidity';
        as(3).Name='long_name';as(3).Value='RH';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.RH));
        as(6).Name='valid_max';as(6).Value=single(max(data.RH));
        as(7).Name='cell_methods';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc     
        
%wind_speed
        ts.Name='wind_speed';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='standard_name';as(2).Value='wind_speed';
        as(3).Name='long_name';as(3).Value='Wind Speed';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.WS));
        as(6).Name='valid_max';as(6).Value=single(max(data.WS));
        as(7).Name='cell_methods';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%wind_from_direction
        ts.Name='wind_from_direction';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='degree';
        as(2).Name='standard_name';as(2).Value='wind_from_direction';
        as(3).Name='long_name';as(3).Value='Wind Direction';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data.WD));
        as(6).Name='valid_max';as(6).Value=single(max(data.WD));
        as(7).Name='cell_methods';as(7).Value='time: point';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
        
%upward_balloon_velocity
        ts.Name='upward_balloon_velocity';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m s-1';
        as(2).Name='long_name';as(2).Value='Balloon Ascent Rate';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(data.AcRate));
        as(5).Name='valid_max';as(5).Value=single(max(data.AcRate));
        as(6).Name='cell_methods';as(6).Value='time: point';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc       
        
%elapsed_time
        ts.Name='elapsed_time';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='s';
        as(2).Name='long_name';as(2).Value='Elapsed Time';
        as(3).Name='_FillValue';as(3).Value=-1e+20;
        as(4).Name='valid_min';as(4).Value=single(min(data.EP));
        as(5).Name='valid_max';as(5).Value=single(max(data.EP));
        as(6).Name='cell_methods';as(6).Value='time: point';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
        
%qc_flag
        ts.Name='qc_flag';
        ts.Nctype='byte';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag';
        as(3).Name='values';as(3).Value='0b,1b,2b,3b';
        as(4).Name='meanings';as(4).Value=sprintf('%s\n%s\n%s\n%s\n',... 
    'not_used',...
    'good_data',... 
    'suspect_data_no_measurable_ascent_rate',...
    'suspect_data_horizontal_wind_speed_==_0_m_s-1');
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
        