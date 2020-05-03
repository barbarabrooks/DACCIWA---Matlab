function write_NC_MOIST_variables_v4(fn_nc, data, offset)
%add prduct specific variables and data

%get rid of nans
ix = find(isnan(data.Z) == 1);
if ~isempty(data.Z)
    data.Z(ix) = -1e+020;
end
clear ix

ZZ=ones(size(data.abh));
for n=1:length(data.ET)
    ZZ(n,:)= data.Z;
end
ZZ = ZZ + offset;

ix = find(isnan(data.rh) == 1);
if ~isempty(data.rh)
    data.rh(ix) = -1e+020;
end
clear ix

ix = find(isnan(data.abh) == 1);
if ~isempty(data.abh)
    data.abh(ix) = -1e+020;
end
clear ix

%altitude
    %define varibale
        ts.Name='altitude';
        ts.Nctype='float32';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='standard_name';as(2).Value='altitude';
        as(3).Name='long_name';as(3).Value='Geometric height above geoid (WGS84).';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='axis';as(5).Value='Z';
        as(6).Name='valid_min';as(6).Value=single(min(min(ZZ(find(ZZ > -1e+020)))));
        as(7).Name='valid_max';as(7).Value=single(max(max(ZZ)));
        as(8).Name='cell_methods';as(8).Value='time: mean';
        as(9).Name='coordinates';as(9).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'altitude', single(ZZ));
        
%relative_humidity
    %define varibale
        ts.Name='relative_humidity';
        ts.Nctype='float32';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='%';
        as(2).Name='standard_name';as(2).Value='relative_humidity';
        as(3).Name='long_name';as(3).Value='Relative Humidity.';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(min(data.rh(find(data.rh > -1e+020)))));
        as(6).Name='valid_max';as(6).Value=single(max(max(data.rh)));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'relative_humidity', single(data.rh));
    
  %absolute_humidity
    %define varibale
        ts.Name='absolute_humidity';
        ts.Nctype='float32';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='g m-3';
        as(2).Name='long_name';as(2).Value='Absolute Humidity.';
        as(3).Name='_FillValue';as(3).Value=-1e+020;
        as(4).Name='valid_min';as(4).Value=single(min(min(data.abh(find(data.abh > -1e+020)))));
        as(5).Name='valid_max';as(5).Value=single(max(max(data.abh)));
        as(6).Name='cell_methods';as(6).Value='time: mean';
        as(7).Name='coordinates';as(7).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'absolute_humidity', single(data.abh));