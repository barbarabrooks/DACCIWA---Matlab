function write_NC_variables_EB_RAD_v2(fn_nc, data)
%time
        ts.Name='time';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='seconds since 1970-01-01 00:00:00 UTC';
        as(2).Name='standard_name';as(2).Value='time';
        as(3).Name='long_name';as(3).Value='Time (seconds since 1970-01-01)';
        as(4).Name='axis';as(4).Value='T';
        as(5).Name='valid_min';as(5).Value=min(data.RD.ET);
        as(6).Name='valid_max';as(6).Value=max(data.RD.ET);
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
        
%downwelling_longwave_flux_in_air (up facing)
        ts.Name='downwelling_longwave_flux_in_air';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='downwelling_longwave_flux_in_air';
        as(3).Name='long_name';as(3).Value='Downwelling LW radiation';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=1000;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%upwelling_longwave_flux_in_air (down facing)
        ts.Name='upwelling_longwave_flux_in_air';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='upwelling_longwave_flux_in_air';
        as(3).Name='long_name';as(3).Value='Upwelling LW radiation';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=1000;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
%downwelling_shortwave_flux_in_air (up facing)
        ts.Name='downwelling_shortwave_flux_in_air';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='downwelling_shortwave_flux_in_air';
        as(3).Name='long_name';as(3).Value='Downwelling SW radiation';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=2000;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%upwelling_shortwave_flux_in_air (down facing)
        ts.Name='upwelling_shortwave_flux_in_air';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='W m-2';
        as(2).Name='standard_name';as(2).Value='upwelling_shortwave_flux_in_air';
        as(3).Name='long_name';as(3).Value='Upwelling SW radiation';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=0;
        as(6).Name='valid_max';as(6).Value=2000;
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
       
%qc_flag_upwelling_shortwave
        ts.Name='qc_flag_upwelling_shortwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: upwelling shortwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_downwelling_shortwave
        ts.Name='qc_flag_downwelling_shortwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: downwelling shortwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%qc_flag_upwelling_longwave
        ts.Name='qc_flag_upwelling_longwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: upwelling longwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_downwelling_longwave
        ts.Name='qc_flag_downwelling_longwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: downwelling longwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_body_temperature
        ts.Name='qc_flag_body_temperature';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: sensor body temperature';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%qc_flag_cleaning
        ts.Name='qc_flag_cleaning';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag: sensor cleaning';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        