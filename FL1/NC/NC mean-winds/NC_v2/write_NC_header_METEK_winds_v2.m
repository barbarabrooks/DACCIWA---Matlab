function write_NC_header_METEK_winds_v2(fn_nc, meta, data)
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'Conventions',meta{4});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'source',meta{5});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'instrument_manufacturer',meta{6});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'instrument_model',meta{7});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'serial_number',meta{8});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'operational_software',meta{9});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'operational_software_version',meta{10});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'creator_name',meta{11});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'creator_email',meta{12});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'creator_url',meta{13});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'institution',meta{14});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'processing_software',meta{15});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'processing_software_version',meta{16});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'calibration_sensitivity',meta{17});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'calibration_certification_date',meta{18});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'calibration_certification_url',meta{19});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'sampling_interval',meta{20});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'averaging_interval',meta{21});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'data_set_version',meta{22});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'data_product_level',meta{23});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'last_revised_date',datestr(now,'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'project',meta{25});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'project_principle_investigator',meta{26});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'project_principle_investigator_contact',meta{27});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'licence',meta{28});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'acknowledgement',meta{29});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_type',meta{30});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_name',meta{31});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'title',meta{32});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'feature_type',meta{33});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'start_time',datestr(min(min(data.means.ST)),'YYYY-mm-DDTHH:MM:SS'));	
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'end_time',datestr(max(max(data.means.ST)),'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_location',meta{36});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_height',meta{37});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'location_keywords',meta{38});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'history',meta{39});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'comment',meta{40});
    %flags - temperature
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_comment',meta{41});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_0_description',meta{42});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_1_description',meta{43});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_1_assessment',meta{44});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_2_description',meta{45});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_2_assessment',meta{46});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_3_description',meta{47});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_value_3_assessment',meta{48});
    %flags - wind speed
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_comment',meta{49});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_0_description',meta{50});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_1_description',meta{51});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_1_assessment',meta{52});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_2_description',meta{53});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_2_assessment',meta{54});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_3_description',meta{55});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_3_assessment',meta{56});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_4_description',meta{57});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_speed_value_4_assessment',meta{58});
    %flags - wind direction
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_comment',meta{59});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_0_description',meta{60});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_1_description',meta{61});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_1_assessment',meta{62});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_2_description',meta{63});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_2_assessment',meta{64});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_3_description',meta{65});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_3_assessment',meta{66});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_4_description',meta{67});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_direction_value_4_assessment',meta{68});
    %flags - U
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_comment',meta{69});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_0_description',meta{70});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_1_description',meta{71});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_1_assessment',meta{72});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_2_description',meta{73});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_2_assessment',meta{74});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_3_description',meta{75});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_eastward_value_3_assessment',meta{76});
    %flags - V
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_comment',meta{77});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_0_description',meta{78});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_1_description',meta{79});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_1_assessment',meta{80});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_2_description',meta{81});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_2_assessment',meta{82});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_3_description',meta{83});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_northward_value_3_assessment',meta{84});
    %flags - W
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_comment',meta{85});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_0_description',meta{86});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_1_description',meta{87});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_1_assessment',meta{88});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_2_description',meta{89});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_2_assessment',meta{90});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_3_description',meta{91});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_wind_component_upward_value_3_assessment',meta{92});