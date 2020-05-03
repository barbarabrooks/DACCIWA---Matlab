function write_NC_variables_EB2_RAD(fn_nc, data)
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
        as(4).Name='valid_min';as(4).Value=min(data.RD.ST);
        as(5).Name='valid_max';as(5).Value=max(data.RD.ST);
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day_of_year
        ts.Name='day_of_year';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value=['Day number from: ',num2str(data.RD.DT(1,1)),'-01-01 00:00:00 UTC'];
        as(2).Name='long_name';as(2).Value='Day of Year';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DoY);
        as(4).Name='valid_max';as(4).Value=max(data.RD.DoY);
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%year
        ts.Name='year';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Year';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DT(:,1));
        as(4).Name='valid_max';as(4).Value=max(data.RD.DT(:,1));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%month
        ts.Name='month';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Month';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DT(:,2));
        as(4).Name='valid_max';as(4).Value=max(data.RD.DT(:,2));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%day
        ts.Name='day';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Day';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DT(:,3));
        as(4).Name='valid_max';as(4).Value=max(data.RD.DT(:,3));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%hour
        ts.Name='hour';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Hour';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DT(:,4));
        as(4).Name='valid_max';as(4).Value=max(data.RD.DT(:,4));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%minute
        ts.Name='minute';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Minute';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DT(:,5));
        as(4).Name='valid_max';as(4).Value=max(data.RD.DT(:,5));
        clear ix
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc
%second
        ts.Name='second';
        ts.Nctype='double';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Second';
        as(3).Name='valid_min';as(3).Value=min(data.RD.DT(:,6));
        as(4).Name='valid_max';as(4).Value=max(data.RD.DT(:,6));
        clear ix
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
        as(5).Name='valid_min';as(5).Value=min(data.RD.IRUPCOR);
        as(6).Name='valid_max';as(6).Value=max(data.RD.IRUPCOR);
        as(7).Name='cell_methods';as(7).Value='time: point';
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
        as(5).Name='valid_min';as(5).Value=min(data.RD.IRDNCOR);
        as(6).Name='valid_max';as(6).Value=max(data.RD.IRDNCOR);
        as(7).Name='cell_methods';as(7).Value='time: point';
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
        as(5).Name='valid_min';as(5).Value=min(data.RD.SWUP);
        as(6).Name='valid_max';as(6).Value=max(data.RD.SWUP);
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
        as(5).Name='valid_min';as(5).Value=min(data.RD.SWDN);
        as(6).Name='valid_max';as(6).Value=max(data.RD.SWDN);
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
       
%qc_flag_upwelling_shortwave
        ts.Name='qc_flag_upwelling_shortwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: upwelling shortwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_downwelling_shortwave
        ts.Name='qc_flag_downwelling_shortwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: downwelling shortwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc          
%qc_flag_upwelling_longwave
        ts.Name='qc_flag_upwelling_longwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: upwelling longwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc    
%qc_flag_downwelling_longwave
        ts.Name='qc_flag_downwelling_longwave';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: downwelling longwave';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=4;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
%qc_flag_body_temperature
        ts.Name='qc_flag_body_temperature';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: sensor body temperature';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc      
%qc_flag_cleaning
        ts.Name='qc_flag_cleaning';
        ts.Nctype='int';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Qulaity flag: sensor cleaning';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=3;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        