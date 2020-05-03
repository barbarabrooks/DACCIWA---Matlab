%function NC_HATPRO_BLT_v4(dn,do,fn_meta, platform, version, offset, flag_moving)

fn_meta='G:\renfrew\radiometer\meta_BLT_v1.txt';
do='G:\renfrew\radiometer\NC\BLT\v1';
dn='G:\renfrew\radiometer\matlab';
platform ='alliance';
version ='1';
offset = 15;
flag_moving = 1; %0 = stationary, 1 = moving, 2 = trajectory

% Wrapper to create NC files for hatpro
%input
%   dn: directory holding the matlab files
%   do: directory for nc files
%   fn_STAa: full path to project STAa file
%   platform: name of platform (lowercase)
%   version: version of dataset (string)
%   offset: at what height is the instrument above MSL
%   flag_moving: indicateif platofrmis movingor not - %0 = stationary, 1 = moving, 2 = trajectory
%
%file name: <instrument_name>_<platform_name>_<YYYYMMDD>_<data_product>_v<version>.nc

%fields for name
instrument_name = 'ncas-scanning-radiometer-1';
data_product = 'boundary-layer-temperature-profiles';

%get meat data
meta = get_meta_tsv_v1(fn_meta);

%get list of what is to be converted
list=dir(dn);

% run through list ad create nc files
for n=5:length(list)
    %get file time stamp assumes structure YYYYMMDD.mat
    temp=list(n).name;
    ix=strfind(temp,'.');
    timestamp=temp(1:ix-1);%timestamp
    clear temp
    
    %nc file name and path
    fc=fullfile (do,[instrument_name,'_',platform,'_',timestamp,'_',data_product,'_v',version,'.nc']);
  
    display(list(n).name)
    
    %load data file
    load(fullfile(dn,list(n).name));
    
    if ~isempty(data.TPB)
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes - generic function
        write_NC_header_v1(fc, meta, data.TPB.ET, data.TPB.lat, data.TPB.lon, flag_moving); 
        %Dimensions - General
        write_NC_dimensions_v1(fc, length(data.TPB.ET), length(data.TPB.lat), length(data.TPB.lon),  flag_moving);        
        %Variables - General - Time
        write_NC_time_v1(fc, data.TPB.ET, data.TPB.DoY, data.TPB.DT);
        %Variables - General - Position
        write_NC_position_v1(fc, data.TPB.lat, data.TPB.lon, flag_moving);
        %only required when instrument on moving platform
        if flag_moving == 1
            %Variables - General - Motion (can be remmed out if not needed
            write_NC_motion_v1(fc, data.TPB.course_true, data.TPB.orientation, data.TPB.speed_wr_water, data.TPB.speed_wr_ground,...
                data.TPB.RPY, data.TPB.rate_RPY, data.TPB.flag_angle, data.TPB.flag_rate, flag_moving);
        end
        
        write_NC_BLT_header_v4(fc);
        write_NC_BLT_dimensions_v4(length(data.TPB.Z),fc);
        write_NC_BLT_variables_v4(fc, data.TPB, offset);
        write_NC_BLT_qc_flags_v4(fc, data.TPB.flag);
    end
    %clear fc temp ix f3 data data1
end
