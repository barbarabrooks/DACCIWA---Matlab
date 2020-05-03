function write_NC_MET_variables_v4(fn_nc, PP, TT, RH, offset)
%add prduct specific variables and data

%get rid of nans
ix = find(isnan(PP) == 1);
if ~isempty(PP)
    PP(ix) = -1e+020;
end
clear ix

ix = find(isnan(TT) == 1);
if ~isempty(TT)
    TT(ix) = -1e+020;
end
clear ix

ix = find(isnan(RH) == 1);
if ~isempty(RH)
    RH(ix) = -1e+020;
end
clear ix

%air_pressure
    %define varibale
        ts.Name='air_pressure';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='hPa';
        as(2).Name='standard_name';as(2).Value='air_pressure';
        as(3).Name='long_name';as(3).Value='Air Pressure';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(PP(find(PP > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(PP));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'air_pressure', single(PP));
        
%air_temperature
    %define varibale
        ts.Name='air_temperature';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='air_temperature';
        as(3).Name='long_name';as(3).Value='Air Temperature';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(TT(find(TT > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(TT));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'air_temperature', single(TT));
        
%relative_humidity
    %define varibale
        ts.Name='relative_humidity';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='%';
        as(2).Name='standard_name';as(2).Value='relative_humidity';
        as(3).Name='long_name';as(3).Value='Relative Humidity';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(RH(find(RH > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(RH));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'relative_humidity', single(RH));