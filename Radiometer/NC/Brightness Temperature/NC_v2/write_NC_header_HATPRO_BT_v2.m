function write_NC_header_HATPRO_BT_v2(fn_nc, meta, data)
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
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'start_time',datestr(min(data.ST),'YYYY-mm-DDTHH:MM:SS'));	
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'end_time',datestr(max(data.ST),'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_location',meta{36});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_height',meta{37});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'location_keywords',meta{38});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'history',meta{39});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'comment',meta{40});
    %flags - temperature
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_comment',meta{41});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_0_description',meta{42});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_1_description',meta{43});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_1_assessment',meta{44});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_2_description',meta{45});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_2_assessment',meta{46});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_3_description',meta{47});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_temperature_qc_value_3_assessment',meta{48});
    %flags - RH
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_comment',meta{49});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_0_description',meta{50});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_1_description',meta{51});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_1_assessment',meta{52});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_2_description',meta{53});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_2_assessment',meta{54});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_3_description',meta{55});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_relative_humidity_qc_value_3_assessment',meta{56});
    %flags - pressure
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_comment',meta{57});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_0_description',meta{58});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_1_description',meta{59});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_1_assessment',meta{60});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_2_description',meta{61});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_2_assessment',meta{62});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_3_description',meta{63});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_pressure_qc_value_3_assessment',meta{64});
    %flags - precipitation
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_comment',meta{65});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_0_description',meta{66});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_1_description',meta{67});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_1_assessment',meta{68});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_2_description',meta{69});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_2_assessment',meta{70});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_3_description',meta{71});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_precipitation_qc_value_3_assessment',meta{72});
    %flags - ch1
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_comment',meta{73});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_0_description',meta{74});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_1_description',meta{75});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_1_assessment',meta{76});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_2_description',meta{77});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_2_assessment',meta{78});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_3_description',meta{79});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_1_failure_value_3_assessment',meta{80});
    %flags - ch2
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_comment',meta{81});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_0_description',meta{82});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_1_description',meta{83});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_1_assessment',meta{84});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_2_description',meta{85});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_2_assessment',meta{86});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_3_description',meta{87});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_2_failure_value_3_assessment',meta{88});
    %flags - ch3
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_comment',meta{89});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_0_description',meta{90});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_1_description',meta{91});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_1_assessment',meta{92});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_2_description',meta{93});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_2_assessment',meta{94});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_3_description',meta{95});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_3_failure_value_3_assessment',meta{96});
    %flags - ch4
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_comment',meta{97});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_0_description',meta{98});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_1_description',meta{99});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_1_assessment',meta{100});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_2_description',meta{101});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_2_assessment',meta{102});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_3_description',meta{103});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_4_failure_value_3_assessment',meta{104});
    %flags - ch5
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_comment',meta{105});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_0_description',meta{106});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_1_description',meta{107});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_1_assessment',meta{108});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_2_description',meta{109});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_2_assessment',meta{110});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_3_description',meta{111});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_5_failure_value_3_assessment',meta{112});
    %flags - ch6
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_comment',meta{113});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_0_description',meta{114});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_1_description',meta{115});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_1_assessment',meta{116});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_2_description',meta{117});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_2_assessment',meta{118});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_3_description',meta{119});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_6_failure_value_3_assessment',meta{120});
    %flags - ch7
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_comment',meta{121});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_0_description',meta{122});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_1_description',meta{123});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_1_assessment',meta{124});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_2_description',meta{125});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_2_assessment',meta{126});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_3_description',meta{127});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_7_failure_value_3_assessment',meta{128});
    %flags - ch8
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_comment',meta{129});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_0_description',meta{130});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_1_description',meta{131});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_1_assessment',meta{132});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_2_description',meta{133});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_2_assessment',meta{134});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_3_description',meta{135});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_8_failure_value_3_assessment',meta{136});
    %flags - ch9
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_comment',meta{137});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_0_description',meta{138});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_1_description',meta{139});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_1_assessment',meta{140});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_2_description',meta{141});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_2_assessment',meta{142});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_3_description',meta{143});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_9_failure_value_3_assessment',meta{144});
    %flags - ch10
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_comment',meta{145});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_0_description',meta{146});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_1_description',meta{147});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_1_assessment',meta{148});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_2_description',meta{149});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_2_assessment',meta{150});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_3_description',meta{151});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_10_failure_value_3_assessment',meta{152});
    %flags - ch11
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_comment',meta{153});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_0_description',meta{154});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_1_description',meta{155});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_1_assessment',meta{156});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_2_description',meta{157});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_2_assessment',meta{158});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_3_description',meta{159});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_11_failure_value_3_assessment',meta{160});
    %flags - ch12
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_comment',meta{161});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_0_description',meta{162});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_1_description',meta{163});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_1_assessment',meta{164});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_2_description',meta{165});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_2_assessment',meta{166});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_3_description',meta{167});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_12_failure_value_3_assessment',meta{168});
    %flags - ch13
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_comment',meta{169});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_value_0_description',meta{170});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failurevalue_1_description',meta{171});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_value_1_assessment',meta{172});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_value_2_description',meta{173});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_value_2_assessment',meta{174});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_value_3_description',meta{175});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_13_failure_value_3_assessment',meta{176});
    %flags - ch14
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_comment',meta{177});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_0_description',meta{178});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_1_description',meta{179});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_1_assessment',meta{180});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_2_description',meta{181});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_2_assessment',meta{182});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_3_description',meta{183});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_channel_14_failure_value_3_assessment',meta{184});
    %flags T stability
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_comment',meta{185});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_0_description',meta{186});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_1_description',meta{187});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_1_assessment',meta{188});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_2_description',meta{189});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_2_assessment',meta{190});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_3_description',meta{191});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_3_assessment',meta{192});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_4_description',meta{193});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_4_assessment',meta{194});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_5_description',meta{195});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_5_assessment',meta{196});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_6_description',meta{197});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_6_assessment',meta{198});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_7_description',meta{199});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_t_receiver_temperature_stability_value_7_assessment',meta{200});
    %flags RH stability
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_comment',meta{201});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_0_description',meta{202});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_1_description',meta{203});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_1_assessment',meta{204});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_2_description',meta{205});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_2_assessment',meta{206});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_3_description',meta{207});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_3_assessment',meta{208});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_4_description',meta{209});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_4_assessment',meta{210});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_5_description',meta{211});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_5_assessment',meta{212});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_6_description',meta{213});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_6_assessment',meta{214});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_7_description',meta{215});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_rh_receiver_temperature_stability_value_7_assessment',meta{216});