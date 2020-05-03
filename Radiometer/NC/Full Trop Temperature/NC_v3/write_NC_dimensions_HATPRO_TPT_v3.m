function write_NC_dimensions_HATPRO_TPT_v3(fn_nc, meta, data)
[tt,zz]=size(data.T);
%set default for a stationary deployment 
LAT=1;LON=1;
%set if moving
for n=1:length(meta)
    if strfind(meta{n,2},'moving_platform')
        [LAT,~]=size(data.lat);
        [LON,~]=size(data.lon);
    end
end

%time
    nc_add_dimension(fn_nc,'time',tt);
%altitude
    nc_add_dimension(fn_nc,'altitude',zz);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);