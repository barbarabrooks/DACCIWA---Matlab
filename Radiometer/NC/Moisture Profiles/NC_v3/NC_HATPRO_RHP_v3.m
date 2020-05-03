function NC_HATPRO_RHP_v3(dn,do,fn_meta)

%fn_meta='C:\Users\lecbjb\Desktop\Data Project\Stationary\ncas-scanning-radiometer-1\surface-met\Example META Data File\Meta data.csv';
% Wrapper to create NC files for pro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%
% ncas-aws-<n>_<platform_name>_<YYYYMMDD>_<data_product>_<version>.nc

%BB 24/06/2017
%fn_meta='E:\ACSE - radiometer\meta\moisture-profiles\ACSE_meta_moist_prof_v2.txt';
%dn='E:\ACSE - radiometer\matlab';
%do='E:\ACSE - radiometer\NC\V1\moisture-profiles';

%get meat data
meta = get_meta_v3(fn_meta);

%extract whats needed to create file name
[instrument_name,platform,data_product,version,scan_type] = NC_file_name_parts_v3(meta);


%get list of what is to be cnverted
list=dir(dn);

for n=3:length(list)
    %get file time stamp
    temp=list(n).name;
    ix=strfind(temp,'.');
    timestamp=temp(1:ix-1);%timestamp
    clear temp
    
    %nc file name and path
    fc=fullfile (do,[instrument_name,'_',platform,'_',timestamp,'_',data_product,'_v',version,'.nc']);
    
    display(list(n).name)
    
    %load data file
    load(fullfile(dn,list(n).name));
    
    if ~isempty(data.HPC)
        data1=data;clear data
        data=data1.HPC;clear data1
        
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes
        write_NC_header_v3(fc,meta,data);  
        %Dimensions
        write_NC_dimensions_HATPRO_RHP_v3(fc,meta,data);   
        %Variables - General - generic function
        write_NC_variables_general_v3(fc,meta,data);
        %Variables - specific - specific function
        write_NC_variables_specific_HATPRO_RHP_v3(fc, meta);
        %Data    
        write_NC_data_HATPRO_RHP_v3(fc,meta,data);
    end
    %clear fc temp ix f3 data data1
end

%end