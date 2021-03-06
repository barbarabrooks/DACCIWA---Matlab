function write_NC_header_HATPRO_STAB(fn_nc, meta, data)
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
    %flags - temperature
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_comment',meta.l38);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_0_description',meta.l39);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_1_description',meta.l40);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_1_assessment',meta.l41);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_2_description',meta.l42);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_2_assessment',meta.l43);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_3_description',meta.l44);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'temperature_qc_value_3_assessment',meta.l45);
    %flags - RH
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_comment',meta.l46);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_0_description',meta.l47);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_1_description',meta.l48);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_1_assessment',meta.l49);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_2_description',meta.l50);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_2_assessment',meta.l51);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_3_description',meta.l52);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'relative_humidity_qc_value_3_assessment',meta.l53);
    %flags - pressure
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_comment',meta.l54);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_0_description',meta.l55);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_1_description',meta.l56);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_1_assessment',meta.l57);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_2_description',meta.l58);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_2_assessment',meta.l59);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_3_description',meta.l60);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'pressure_qc_value_3_assessment',meta.l61);
    %flags - precipitation
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_comment',meta.l62);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_0_description',meta.l63);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_1_description',meta.l64);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_1_assessment',meta.l65);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_2_description',meta.l66);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_2_assessment',meta.l67);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_3_description',meta.l68);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'precipitation_qc_value_3_assessment',meta.l69);
    %flags - ch1
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_comment',meta.l70);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_0_description',meta.l71);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_1_description',meta.l72);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_1_assessment',meta.l73);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_2_description',meta.l74);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_2_assessment',meta.l75);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_3_description',meta.l76);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH1_failure_qc_value_3_assessment',meta.l77);
    %flags - ch2
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_comment',meta.l78);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_0_description',meta.l79);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_1_description',meta.l80);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_1_assessment',meta.l81);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_2_description',meta.l82);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_2_assessment',meta.l83);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_3_description',meta.l84);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH2_failure_qc_value_3_assessment',meta.l85);
    %flags - ch3
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_comment',meta.l86);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_0_description',meta.l87);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_1_description',meta.l88);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_1_assessment',meta.l89);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_2_description',meta.l90);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_2_assessment',meta.l91);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_3_description',meta.l92);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH3_failure_qc_value_3_assessment',meta.l93);
    %flags - ch4
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_comment',meta.l94);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_0_description',meta.l95);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_1_description',meta.l96);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_1_assessment',meta.l97);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_2_description',meta.l98);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_2_assessment',meta.l99);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_3_description',meta.l100);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH4_failure_qc_value_3_assessment',meta.l101);
    %flags - ch5
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_comment',meta.l102);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_0_description',meta.l103);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_1_description',meta.l104);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_1_assessment',meta.l105);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_2_description',meta.l106);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_2_assessment',meta.l107);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_3_description',meta.l108);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH5_failure_qc_value_3_assessment',meta.l109);
    %flags - ch6
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_comment',meta.l110);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_0_description',meta.l111);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_1_description',meta.l112);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_1_assessment',meta.l113);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_2_description',meta.l114);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_2_assessment',meta.l115);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_3_description',meta.l116);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH6_failure_qc_value_3_assessment',meta.l117);
    %flags - ch7
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_comment',meta.l118);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_0_description',meta.l119);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_1_description',meta.l120);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_1_assessment',meta.l121);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_2_description',meta.l122);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_2_assessment',meta.l123);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_3_description',meta.l124);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH7_failure_qc_value_3_assessment',meta.l125);
    %flags - ch8
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_comment',meta.l126);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_0_description',meta.l127);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_1_description',meta.l128);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_1_assessment',meta.l129);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_2_description',meta.l130);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_2_assessment',meta.l131);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_3_description',meta.l132);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH8_failure_qc_value_3_assessment',meta.l133);
    %flags - ch9
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_comment',meta.l134);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_0_description',meta.l135);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_1_description',meta.l136);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_1_assessment',meta.l137);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_2_description',meta.l138);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_2_assessment',meta.l139);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_3_description',meta.l140);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH9_failure_qc_value_3_assessment',meta.l141);
    %flags - ch10
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_comment',meta.l142);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_0_description',meta.l143);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_1_description',meta.l144);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_1_assessment',meta.l145);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_2_description',meta.l146);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_2_assessment',meta.l147);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_3_description',meta.l148);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH10_failure_qc_value_3_assessment',meta.l149);
    %flags - ch11
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_comment',meta.l150);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_0_description',meta.l151);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_1_description',meta.l152);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_1_assessment',meta.l153);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_2_description',meta.l154);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_2_assessment',meta.l155);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_3_description',meta.l156);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH11_failure_qc_value_3_assessment',meta.l157);
    %flags - ch12
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_comment',meta.l158);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_0_description',meta.l159);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_1_description',meta.l160);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_1_assessment',meta.l161);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_2_description',meta.l162);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_2_assessment',meta.l163);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_3_description',meta.l164);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH12_failure_qc_value_3_assessment',meta.l165);
    %flags - ch13
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_comment',meta.l166);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_0_description',meta.l167);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_1_description',meta.l168);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_1_assessment',meta.l169);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_2_description',meta.l170);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_2_assessment',meta.l171);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_3_description',meta.l172);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH13_failure_qc_value_3_assessment',meta.l173);
    %flags - ch14
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_comment',meta.l174);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_0_description',meta.l175);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_1_description',meta.l176);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_1_assessment',meta.l177);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_2_description',meta.l178);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_2_assessment',meta.l179);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_3_description',meta.l180);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'CH14_failure_qc_value_3_assessment',meta.l181);
    %flags T stability
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_comment',meta.l182);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_0_description',meta.l183);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_1_description',meta.l184);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_1_assessment',meta.l185);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_2_description',meta.l186);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_2_assessment',meta.l187);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_3_description',meta.l188);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_3_assessment',meta.l189);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_4_description',meta.l190);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_4_assessment',meta.l191);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_5_description',meta.l192);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_5_assessment',meta.l193);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_6_description',meta.l194);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_6_assessment',meta.l195);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_7_description',meta.l196);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_t_receiver_qc_value_7_assessment',meta.l197);
    %flags RH stability
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_comment',meta.l198);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_0_description',meta.l199);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_1_description',meta.l200);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_1_assessment',meta.l201);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_2_description',meta.l202);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_2_assessment',meta.l203);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_3_description',meta.l204);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_3_assessment',meta.l205);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_4_description',meta.l206);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_4_assessment',meta.l207);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_5_description',meta.l208);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_5_assessment',meta.l209);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_6_description',meta.l210);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_6_assessment',meta.l211);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_7_description',meta.l212);
    nc_attput(fn_nc,netcdf.getConstant('NC_GLOBAL'),'thermal_stability_rh_receiver_qc_value_7_assessment',meta.l213);