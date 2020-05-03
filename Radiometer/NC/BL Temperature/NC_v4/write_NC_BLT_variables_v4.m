function write_NC_TPB_variables_v4(fn_nc, data, offset)
%add prduct specific variables and data

%get rid of nans
ix = find(isnan(data.Z) == 1);
if ~isempty(data.Z)
    data.Z(ix) = -1e+020;
end
clear ix

ZZ=ones(size(data.T));
for n=1:length(data.ET)
    ZZ(n,:)= data.Z;
end
ZZ = ZZ + offset;

ix = find(isnan(data.T) == 1);
if ~isempty(data.T)
    data.T(ix) = -1e+020;
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
        
%air_temperature
    %define varibale
        ts.Name='air_temperature';
        ts.Nctype='float32';
        dc=cell(1,2);dc{1}='time';dc{2}='index';ts.Dimension=dc;
        as(1).Name='units';as(1).Value='K';
        as(2).Name='standard_name';as(2).Value='air_temperature';
        as(3).Name='long_name';as(3).Value='Air Temperature.';
        as(4).Name='_FillValue';as(4).Value=-1e+020;
        as(5).Name='valid_min';as(5).Value=single(min(min(data.T(find(data.T > -1e+020)))));
        as(6).Name='valid_max';as(6).Value=single(max(max(data.T)));
        as(7).Name='cell_methods';as(7).Value='time: mean';
        as(8).Name='coordinates';as(8).Value='latitude longitude';
        ts.Attribute=as;
        nc_addvar(fn_nc,ts);clear ts as dc        
    %save data
        nc_varput(fn_nc,'air_temperature', single(data.T));
    