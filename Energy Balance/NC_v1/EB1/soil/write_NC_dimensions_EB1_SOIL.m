function write_NC_dimensions_EB1_SOIL(fn_nc, meta, data)
[tt]=length(data.SHF.ET);
[junk,LAT]=size(meta.LAT); 
[junk,LON]=size(meta.LON); 

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%index
    nc_add_dimension(fn_nc,'sensor_number',3);
    