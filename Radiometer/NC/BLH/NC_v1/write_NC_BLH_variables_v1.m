function write_NC_BLH_variables_v1(fn_nc, data, offset)
%add prduct specific variables and data

%correct for instrument height above MSL
ix = find(data >= 0);
if ~isempty (ix)
    data = data + offset;
end
clear ix

ix = find(data < 0);
if ~isempty (ix)
    data = data - offset;
end
clear ix

%get rid of nans
ix = find(isnan(data) == 1);
if ~isempty(data)
    data(ix) = -1e+020;
end
clear ix

%atmosphere_boundary_layer_thickness
    %define varibale
        ts.Name='atmosphere_boundary_layer_thickness';
        ts.Nctype='float32';
        dc=cell(1);dc{1}='time';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='m';
        as(2).Name='standard_name';as(2).Value='atmosphere_boundary_layer_thickness';
        as(3).Name='long_name';as(3).Value='Atmospheric Boundary Layer Height (Height above MSL)';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(data(find(data > -1e+020))));
        as(6).Name='valid_max';as(6).Value=single(max(data));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'atmosphere_boundary_layer_thickness', single(data));
        
        
        