function write_NC_dimensions_HATPRO_IWVLWP_v3(fn_nc, meta, data)
[tt,~]=size(data.ET);
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
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
    