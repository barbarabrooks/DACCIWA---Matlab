function write_NC_EB2_SOIL(fn_nc,fn_data,fn_meta)

%this converts the data to netcdf
%input
%   fn_nc: fullpath and filename to create nc file
%   fn_data: fullpath to datafile to be converted
%   fn_meat: full path and file name of projct meta file
%BB 23/06/2016

%fn_nc=fullfile(fn_nc);
load(fn_data);
data.SHF.SHF=[data.SHF.SHF1 data.SHF.SHF2 data.SHF.SHF3];
data.SHF.flag.SHF=[data.SHF.flag.SHF1 data.SHF.flag.SHF2 data.SHF.flag.SHF3];

data.SM.SM=[data.SM.SM_kPA1 data.SM.SM_kPA2 data.SM.SM_kPA3];
data.SM.flag.SM=[data.SM.flag.SM1 data.SM.flag.SM2 data.SM.flag.SM3];

data.ST.ST=[data.ST.T1 data.ST.T2 data.ST.T3];
data.ST.flag.ST=[data.ST.flag.ST1 data.ST.flag.ST2 data.ST.flag.ST3];

meta=get_meta_EB2_SOIL(fn_meta);

%create nc file, assumes NC_CLOBBER
    nc_create_empty(fn_nc);
%global attributes
    write_NC_header_EB2_SOIL(fn_nc,meta,data);   
%Dimensions
    write_NC_dimensions_EB2_SOIL(fn_nc,meta,data);        
%Variables
    write_NC_variables_EB2_SOIL(fn_nc,data);
%Data    
    write_NC_data_EB2_SOIL(fn_nc,meta,data);
    
end