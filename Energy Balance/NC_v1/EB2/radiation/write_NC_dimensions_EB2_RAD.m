function write_NC_dimensions_EB2_RAD(fn_nc, meta, data)
[tt]=length(data.RD.ET);
[junk,LAT]=size(meta.LAT); 
[junk,LON]=size(meta.LON); 

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
    