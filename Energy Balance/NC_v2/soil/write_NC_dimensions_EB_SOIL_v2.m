function write_NC_dimensions_EB_SOIL_v2(fn_nc, meta, data)
[tt,~]=size(data.SHF.ET);
[~,LAT]=size(meta{length(meta)-2}); 
[~,LON]=size(meta{length(meta)-1}); 

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%index
    nc_add_dimension(fn_nc,'sensor_number',3);
    