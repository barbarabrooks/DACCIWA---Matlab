function write_NC_HATPRO_MET(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

%fn_nc=fullfile(fn_nc);
load(fn_data);
data1=data;clear data
data=data1.MET;clear data1

meta=get_meta_HATPRO_MET(fn_meta);

%create nc file, assumes NC_CLOBBER
    nc_create_empty(fn_nc);
%global attributes
    write_NC_header_HATPRO_MET(fn_nc,meta,data);   
%Dimensions
    write_NC_dimensions_HATPRO_MET(fn_nc,meta,data);        
%Variables
    write_NC_variables_HATPRO_MET(fn_nc,data);
%Data    
    write_NC_data_HATPRO_MET(fn_nc,meta,data);
    
end