function write_NC_DAVIS_AWS(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

%fn_nc=fullfile(fn_nc);
load(fn_data);
% temp fix for AWS files
    data_QC.flag_PPT=ones(size(data_QC.flag_TT));
    save(fn_data,'data_QC');

meta=get_meta_AWS(fn_meta);

data=data_QC; clear data_QC
%create nc file, assumes NC_CLOBBER
    nc_create_empty(fn_nc);
%global attributes
    write_NC_header_DAVIS_AWS(fn_nc,meta,data);   
%Dimensions
    write_NC_dimensions_DAVIS_AWS(fn_nc,meta,data);        
%Variables
    write_NC_variables_DAVIS_AWS(fn_nc,data);
%Data    
    write_NC_data_DAVIS_AWS(fn_nc,meta,data);
    
end