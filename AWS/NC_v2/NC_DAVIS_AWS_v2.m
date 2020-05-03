function NC_DAVIS_AWS_v2(dn,do,fn_meta)
%dn='E:\WORKING\AWS\matlab\QC';
%do='E:\';
%fn_meta='C:\Users\lecbjb\Desktop\Data Project\Stationary\ncas-aws-1\Example META Data File\Meta data.csv';
% Wrapper to create NC files for pro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%BB 17/01/2017

% read meta file
meta=get_meta_v2(fn_meta);
%get filenaming information
f1=meta{1};%instrument name
f2=lower(meta{31}); %platform
f4=meta{2};%data product
f5=meta{3};%version

list=dir(dn);
for n=3:length(list)
    %get file time stamp
    temp=list(n).name;
    ix=strfind(temp,'.');
    f3=temp(ix-8:ix-1);%timestamp
    clear temp
    %nc file name and path
    fc=fullfile (do,[f1,'_',f2,'_',f3,'_',f4,'_',f5,'.nc']);
    %load data file
    load(fullfile(dn,list(n).name));
    
    %local adjust for data file
    clear data; data=data_QC; clear data_QC
   
    %create nc file, assumes NC_CLOBBER
    nc_create_empty(fc);
    %global attributes
    write_NC_header_DAVIS_AWS_v2(fc,meta,data);   
    %Dimensions
    write_NC_dimensions_DAVIS_AWS_v2(fc,meta,data);        
    %Variables
    write_NC_variables_DAVIS_AWS_v2(fc,data);
    %Data    
    write_NC_data_DAVIS_AWS_v2(fc,meta,data);
    
    clear fc temp ix f3 data
end

end