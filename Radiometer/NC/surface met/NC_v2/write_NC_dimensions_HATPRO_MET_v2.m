function write_NC_dimensions_HATPRO_MET_v3(fn_nc, meta, data)
[tt,~]=size(data.ET);

for n=1:length(meta)
    if strfind(meta{n,2},'moving_platform')
        LAT=length(data.lat);
        LON=length(data.lat);
    else
        LAT=1;
        LON=1;
    end
end

%time
    nc_add_dimension(fn_nc,'time',tt);
%lataitude
    nc_add_dimension(fn_nc,'latitude',LAT);
%longitude
    nc_add_dimension(fn_nc,'longitude',LON);
    