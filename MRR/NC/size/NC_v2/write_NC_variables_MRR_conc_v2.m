function write_NC_variables_MRR_conc_v2(fn_nc, meta, data)
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
        as(7).Name='calendar';as(7).Value='julian';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc   
%altitude
        ts.Name='altitude';
        ts.Nctype='double';
        dc=cell(1);dc{1}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='standard_name';as(2).Value='altitude';
        as(3).Name='long_name';as(3).Value='Geometric height above geoid (WGS84).';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='axis';as(5).Value='Z';
        as(6).Name='valid_min';as(6).Value=0;
        as(7).Name='valid_max';as(7).Value=31000+meta{length(meta)};
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
%spectral_bin
        ts.Name='spectral_bin';
        ts.Nctype='double';
        dc=cell(1);dc{1}='spectral_bin';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Spectral Bin';
        as(3).Name='valid_min';as(3).Value=0;
        as(4).Name='valid_max';as(4).Value=63;
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
%qc_flag
        ts.Name='qc_flag';
        ts.Nctype='int';
        dc=cell(1,3);dc{1}='time';dc{2}='spectral_bin';dc{3}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='1';
        as(2).Name='long_name';as(2).Value='Data Quality flag';
        as(3).Name='valid_min';as(3).Value=1;
        as(4).Name='valid_max';as(4).Value=7;
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
        
%spectral_reflectivity
        ts.Name='spectral_reflectivity';
        ts.Nctype='double';
        dc=cell(1,3);dc{1}='time';dc{2}='spectral_bin';dc{3}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='dB';
        as(2).Name='long_name';as(2).Value='Spectral Reflectivity';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=-20;
        as(5).Name='valid_max';as(5).Value=10;
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc  
 %rain_drop_diameter
        ts.Name='rain_drop_diameter';
        ts.Nctype='double';
        dc=cell(1,3);dc{1}='time';dc{2}='spectral_bin';dc{3}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='mm';
        as(2).Name='long_name';as(2).Value='Rain Drop Diameter';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=100;
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
%drop_size_distribution
        ts.Name='drop_size_distribution';
        ts.Nctype='double';
        dc=cell(1,3);dc{1}='time';dc{2}='spectral_bin';dc{3}='altitude';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m-3 mm-1';
        as(2).Name='long_name';as(2).Value='Rain Size Distribution';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=0;
        as(5).Name='valid_max';as(5).Value=10e+010;
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc 
        