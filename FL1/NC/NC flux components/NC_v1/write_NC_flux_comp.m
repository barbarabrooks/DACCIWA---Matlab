function write_NC_flux_comp(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

fn_nc=fullfile(fn_nc);
load(fn_data);

meta=get_meta_flux_comp(fn_meta);

%create nc file, assumes NC_CLOBBER
    nc_create_empty(fn_nc);
%global attributes
    write_NC_header_flux_comp(fn_nc,meta,data);   
%Dimensions
    write_NC_dimensions_flux_comp(fn_nc,meta,data);        
%Variables
    write_NC_variables_flux_comp(fn_nc,meta,data);
%Data    
    write_NC_data_flux_comp(fn_nc,meta,data);
    
end