function write_NC_header_EB_SOIL_v2(fn_nc, meta, data)
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
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'start_time',datestr(min(data.SHF.ST),'YYYY-mm-DDTHH:MM:SS'));	
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'end_time',datestr(max(data.SHF.ST),'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_location',meta{36});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_height',meta{37});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'location_keywords',meta{38});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'history',meta{39});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'comment',meta{40});
    %flags - soil heat flux
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_comment',meta{41});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_0_description',meta{42});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_1_description',meta{43});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_1_assessment',meta{44});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_2_description',meta{45});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_2_assessment',meta{46});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_3_description',meta{47});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_heat_flux_value_3_assessment',meta{48});
   %flags - soil temperature
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_comment',meta{49});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_0_description',meta{50});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_1_description',meta{51});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_1_assessment',meta{52});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_2_description',meta{53});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_2_assessment',meta{54});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_3_description',meta{55});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_temperature_value_3_assessment',meta{56});
    %flags - soil water potential
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_comment',meta{57});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_0_description',meta{58});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_1_description',meta{59});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_1_assessment',meta{60});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_2_description',meta{61});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_2_assessment',meta{62});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_3_description',meta{63});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_3_assessment',meta{64});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_4_description',meta{65});
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_flag_soil_water_potential_value_4_assessment',meta{66});