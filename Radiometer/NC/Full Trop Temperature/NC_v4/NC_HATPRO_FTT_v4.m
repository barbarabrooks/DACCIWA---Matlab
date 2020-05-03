%function NC_HATPRO_FTT_v4(dn,do,fn_STAa, platform, version, offset, flag_moving)

fn_meta='G:\renfrew\radiometer\meta_FTT_v1.txt';
do='G:\renfrew\radiometer\NC\FTT\v1';
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
data_product = 'full-troposphere-temperature-profiles';

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
    
    if ~isempty(data.TPC)
        %create nc file, assumes NC_CLOBBER
        nc_create_empty(fc);
        %global attributes - generic function
        write_NC_header_v1(fc, meta, data.TPC.ET, data.TPC.lat, data.TPC.lon, flag_moving); 
        %Dimensions - General
        write_NC_dimensions_v1(fc, length(data.TPC.ET), length(data.TPC.lat), length(data.TPC.lon),  flag_moving);        
        %Variables - General - Time
        write_NC_time_v1(fc, data.TPC.ET, data.TPC.DoY, data.TPC.DT);
        %Variables - General - Position
        write_NC_position_v1(fc, data.TPC.lat, data.TPC.lon, flag_moving);
        %only required when instrument on moving platform
        if flag_moving == 1
            %Variables - General - Motion (can be remmed out if not needed
            write_NC_motion_v1(fc, data.TPC.course_true, data.TPC.orientation, data.TPC.speed_wr_water, data.TPC.speed_wr_ground,...
                data.TPC.RPY, data.TPC.rate_RPY, data.TPC.flag_angle, data.TPC.flag_rate, flag_moving);
        end
        
        write_NC_FTT_header_v4(fc);
        write_NC_FTT_dimensions_v4(length(data.TPC.Z),fc);
        write_NC_FTT_variables_v4(fc, data.TPC, offset);
        write_NC_FTT_qc_flags_v4(fc, data.TPC.flag);
    end
    %clear fc temp ix f3 data data1
end
