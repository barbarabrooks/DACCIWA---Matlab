function write_NC_variables_HATPRO_MET(fn_nc, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=min(data.ET);
        as(6).Name='valid_max';as(6).Value=max(data.ET);
        clear ix
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
%alt_time
        ts.Name='alt_time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 0000-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 0000-01-01)';
        as(4).Name='valid_min';as(4).Value=min(data.ST);
        as(5).Name='valid_max';as(5).Value=max(data.ST);
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day_of_year
        ts.Name='day_of_year';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value=['Day number from: ',num2str(data.DT(1,1)),'-01-01 00:00:00 UTC'];
        as(2).Name='long_name';as(2).Value='Day of Year';
        as(3).Name='valid_min';as(3).Value=min(data.DoY);
        as(4).Name='valid_max';as(4).Value=max(data.DoY);
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%year
        ts.Name='year';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Year';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,1));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,1));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%month
        ts.Name='month';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Month';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,2));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,2));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day
        ts.Name='day';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,3));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,3));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%hour
        ts.Name='hour';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Hour';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,4));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,4));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%minute
        ts.Name='minute';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Minute';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,5));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,5));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%second
        ts.Name='second';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Second';
        as(3).Name='valid_min';as(3).Value=min(data.DT(:,6));
        as(4).Name='valid_max';as(4).Value=max(data.DT(:,6));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
 %surface_air_pressure
        ts.Name='surface_air_pressure';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='Pa';
        as(2).Name='standard_name';as(2).Value='surface_air_pressure';
        as(3).Name='long_name';as(3).Value='Pressure';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=54000;
        as(6).Name='valid_max';as(6).Value=110000;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%air_temperature
        ts.Name='air_temperature';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='air_temperature';
        as(3).Name='long_name';as(3).Value='Temperature';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=233;
        as(6).Name='valid_max';as(6).Value=338;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%relative_humidity
        ts.Name='relative_humidity';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='%';
        as(2).Name='standard_name';as(2).Value='relative_humidity';
        as(3).Name='long_name';as(3).Value='RH';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=100;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 

%qc_flag_temperature
        ts.Name='qc_flag_temperature';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: Temperature';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_relative_humidity
        ts.Name='qc_flag_relative_humidity';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: Humidity';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
 %qc_flag_pressure
        ts.Name='qc_flag_pressure';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: Pressure';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
 %qc_flag_precipitation
        ts.Name='qc_flag_precipitation';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: Rainfall Rate and Accumulated rain';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc