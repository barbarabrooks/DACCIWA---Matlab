function write_NC_dimensions_MRR_profiles(fn_nc, data, meta)
[tt,zz]=size(data.H);
[junk,LAT]=size(meta.LAT); 
[junk,LON]=size(meta.LON); 

%time
    nc_add_dimension(fn_nc,'time',tt);
%altitude
    nc_add_dimension(fn_nc,'altitude',zz);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
    