function NC_EB_SOIL_v2(dn,do,fn_meta)
%dn='E:\WORKING\EB1\matlab';
%do='E:\';
%fn_meta='C:\Users\lecbjb\Desktop\Data Project\Stationary\ncas-energy-balance-1\Soil\Example META Data File\Meta data.csv';
% Wrapper to create NC files for pro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_meta: full path to project meta file
%
% ncas-aws-<n>_<platform_name>_<YYYYMMDD>_<data_product>_<version>.nc
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
   
    %local fettle
    data.SHF.SHF=[data.SHF.SHF1 data.SHF.SHF2 data.SHF.SHF3];
    data.SHF.flag.SHF=[data.SHF.flag.SHF1 data.SHF.flag.SHF2 data.SHF.flag.SHF3];

    data.SM.SM=[data.SM.SM_kPA1 data.SM.SM_kPA2 data.SM.SM_kPA3];
    data.SM.flag.SM=[data.SM.flag.SM1 data.SM.flag.SM2 data.SM.flag.SM3];

    data.ST.ST=[data.ST.T1 data.ST.T2 data.ST.T3];
    data.ST.flag.ST=[data.ST.flag.ST1 data.ST.flag.ST2 data.ST.flag.ST3];
    
    %create nc file, assumes NC_CLOBBER
    nc_create_empty(fc);
    %global attributes
    write_NC_header_EB_SOIL_v2(fc,meta,data);   
    %Dimensions
    write_NC_dimensions_EB_SOIL_v2(fc,meta,data);        
    %Variables
    write_NC_variables_EB_SOIL_v2(fc,data);
    %Data    
    write_NC_data_EB_SOIL_v2(fc,meta,data);
    
    clear fc temp ix f3 data
end

end