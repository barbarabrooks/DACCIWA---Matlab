function write_NC_header_CEIL(fn_nc, meta, data)
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'Conventions',meta.l1);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'source',meta.l2);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'instrument_manufacturer',meta.l3);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'instrument_model',meta.l4);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'serial_number',meta.l5);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'operational_software',meta.l6);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'operational_software_version',meta.l7);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'creator_name',meta.l8);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'creator_email',meta.l9);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'creator_url',meta.l10);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'institution',meta.l11);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'processing_software',meta.l12);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'processing_software_version',meta.l13);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'calibration_sensitivity',meta.l14);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'calibration_certification_date',meta.l15);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'calibration_certification_url',meta.l16);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'sampling_interval',meta.l17);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'averaging_interval',meta.l18);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'data_set_version',meta.l19);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'data_product_level',meta.l20);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'last_revised_date',datestr(now,'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'project',meta.l22);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'project_principle_investigator',meta.l23);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'project_principle_investigator_contact',meta.l24);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'licence',meta.l25);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'acknowledgement',meta.l26);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_type',meta.l27);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_name',meta.l28);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'title',meta.l29);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'feature_type',meta.l30);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'start_time',datestr(min(data.ST(1)),'YYYY-mm-DDTHH:MM:SS'));	
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'end_time',datestr(max(data.ST(length(data.ST))),'YYYY-mm-DDTHH:MM:SS'));
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_location',meta.l33);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'platform_height',meta.l34);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'location_keywords',meta.l35);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'history',meta.l36);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'comment',meta.l37);
    %flags
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_comment',meta.l38);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_0_description',meta.l39);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_1_description',meta.l40);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_1_assessment',meta.l41);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_2_description',meta.l42);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_2_assessment',meta.l43);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_3_description',meta.l44);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'qc_value_3_assessment',meta.l45);
    