function write_NC_dimensions_HATPRO_BT(fn_nc, meta, data)
[tt,zz]=size(data.ET);
[junk,LAT]=size(meta.LAT); 
[junk,LON]=size(meta.LON);
[ff]=length(data.FREQ);

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
%radiation_frequency
    nc_add_dimension(fn_nc,'radiation_frequency',ff);    
    