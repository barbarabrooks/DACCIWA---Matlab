function write_NC_header_EB_RAD_v2(fn_nc, meta, data)
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
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'start_time',datestr(min(data.RD.ST),'YYYY-mm-DDTHH:MM:SS'));	
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'end_time',datestr(max(data.RD.ST),'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_location',meta{36});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_height',meta{37});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'location_keywords',meta{38});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'history',meta{39});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'comment',meta{40});
    %flags - upwelling_shortwave
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_comment',meta{41});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_0_description',meta{42});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_1_description',meta{43});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_1_assessment',meta{44});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_2_description',meta{45});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_2_assessment',meta{46});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_3_description',meta{47});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_3_assessment',meta{48});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_4_description',meta{49});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_shortwave_value_4_assessment',meta{50});
    %flags - downwelling_shortwave
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_comment',meta{51});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_0_description',meta{52});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_1_description',meta{53});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_1_assessment',meta{54});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_2_description',meta{55});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_2_assessment',meta{56});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_3_description',meta{57});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_3_assessment',meta{58});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_4_description',meta{59});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_shortwave_value_4_assessment',meta{60});
    %flags - upwelling_longwave
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_comment',meta{61});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_0_description',meta{62});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_1_description',meta{63});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_1_assessment',meta{64});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_2_description',meta{65});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_2_assessment',meta{66});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_3_description',meta{67});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_3_assessment',meta{68});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_4_description',meta{69});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_upwelling_longwave_value_4_assessment',meta{70});
    %flags - downwelling_longwave
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_comment',meta{71});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_0_description',meta{72});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_1_description',meta{73});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_1_assessment',meta{74});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_2_description',meta{75});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_2_assessment',meta{76});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_3_description',meta{77});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_3_assessment',meta{78});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_4_description',meta{79});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_downwelling_longwave_value_4_assessment',meta{80});
    %flags - body_temperature
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_comment',meta{81});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_0_description',meta{82});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_1_description',meta{83});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_1_assessment',meta{84});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_2_description',meta{85});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_2_assessment',meta{86});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_3_description',meta{87});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_body_temperature_value_3_assessment',meta{88});
    %flags - cleaning
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_comment',meta{89});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_0_description',meta{90});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_1_description',meta{91});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_1_assessment',meta{92});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_2_description',meta{93});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_2_assessment',meta{94});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_3_description',meta{95});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_cleaning_value_3_assessment',meta{96});