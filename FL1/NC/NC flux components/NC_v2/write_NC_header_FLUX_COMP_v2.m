function write_NC_header_FLUX_COMP_v2(fn_nc, meta, data)
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
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'start_time',datestr(min(data.runs.end_of_run_ST),'YYYY-mm-DDTHH:MM:SS'));	
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'end_time',datestr(max(data.runs.end_of_run_ST),'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_location',meta{36});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_height',meta{37});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'location_keywords',meta{38});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'history',meta{39});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'comment',meta{40});
    %flags - skew u
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_comment',meta{41});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_value_0_description',meta{42});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_value_0_assessment',meta{43})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_value_1_description',meta{44});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_value_1_assessment',meta{45});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_value_2_description',meta{46});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_u_value_2_assessment',meta{47});
   %flags - skew v
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_comment',meta{48});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_value_0_description',meta{49});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_value_0_assessment',meta{50})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_value_1_description',meta{51});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_value_1_assessment',meta{52});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_value_2_description',meta{53});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_v_value_2_assessment',meta{54});
   %flags - skew w
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_comment',meta{55});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_value_0_description',meta{56});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_value_0_assessment',meta{57})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_value_1_description',meta{58});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_value_1_assessment',meta{59});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_value_2_description',meta{60});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_w_value_2_assessment',meta{61});
    %flags - skew Ts
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_comment',meta{62});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_value_0_description',meta{63});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_value_0_assessment',meta{64})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_value_1_description',meta{65});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_value_1_assessment',meta{66});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_value_2_description',meta{67});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_skew_ts_value_2_assessment',meta{68});
    %flags - kurtosis u
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_comment',meta{69});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_value_0_description',meta{70});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_value_0_assessment',meta{71})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_value_1_description',meta{72});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_value_1_assessment',meta{73});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_value_2_description',meta{74});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_u_value_2_assessment',meta{75});
   %flags - kurtosis v
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_comment',meta{76});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_value_0_description',meta{77});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_value_0_assessment',meta{78})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_value_1_description',meta{79});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_value_1_assessment',meta{80});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_value_2_description',meta{81});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_v_value_2_assessment',meta{82});
   %flags - kurtosis w
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_comment',meta{83});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_value_0_description',meta{84});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_value_0_assessment',meta{85})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_value_1_description',meta{86});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_value_1_assessment',meta{87});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_value_2_description',meta{88});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_w_value_2_assessment',meta{89});
    %flags - kurtosis Ts
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_comment',meta{90});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_value_0_description',meta{91});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_value_0_assessment',meta{92})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_value_1_description',meta{93});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_value_1_assessment',meta{94});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_value_2_description',meta{95});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_kurtosis_ts_value_2_assessment',meta{96});
    %flags - sstclass_wu
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wu_comment',meta{97});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wu_value_0_description',meta{98});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wu_value_1_description',meta{99});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wu_value_1_assessment',meta{100});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wu_value_9_description',meta{101});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wu_value_9_assessment',meta{102});
    %flags - sstclass_wv
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wv_comment',meta{103});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wv_value_0_description',meta{104});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wv_value_1_description',meta{105});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wv_value_1_assessment',meta{106});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wv_value_9_description',meta{107});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wv_value_9_assessment',meta{108});
    %flags - sstclass_wt
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wt_comment',meta{109});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wt_value_0_description',meta{110});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wt_value_1_description',meta{111});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wt_value_1_assessment',meta{112});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wt_value_9_description',meta{113});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_sst_class_wt_value_9_assessment',meta{114});
    %flags - quality_wu
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_comment',meta{115});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_0_description',meta{116});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_0_assessment',meta{117})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_1_description',meta{118});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_1_assessment',meta{119});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_2_description',meta{120});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_2_assessment',meta{121});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_3_description',meta{122});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wu_value_3_assessment',meta{123});
    %flags - quality_wv
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_comment',meta{124});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_0_description',meta{125});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_0_assessment',meta{126})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_1_description',meta{127});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_1_assessment',meta{128});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_2_description',meta{129});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_2_assessment',meta{130});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_3_description',meta{131});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wv_value_3_assessment',meta{132});
    %flags - quality_wts
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_comment',meta{133});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_0_description',meta{134});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_0_assessment',meta{135})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_1_description',meta{136});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_1_assessment',meta{137});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_2_description',meta{138});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_2_assessment',meta{139});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_3_description',meta{140});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_quality_wts_value_3_assessment',meta{141});
    %flags - itc_class
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_comment',meta{142});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_0_description',meta{143});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_0_assessment',meta{144})
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_1_description',meta{145});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_1_assessment',meta{146});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_2_description',meta{147});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_2_assessment',meta{148});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_3_description',meta{149});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_itc_class_value_3_assessment',meta{150});
    
    
    
    