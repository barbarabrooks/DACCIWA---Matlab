function QC_sodar_v1(dn)

list=dir(dn);

for n=3:length(list)
    load(fullfile(dn,list(n).name));

    %deband backscatter
    [data.B]=despike_sodar_219_mnd_v1(data.B,data.err_code);
    [data.B_avg]=despike_sodar_219_mnd_v1(data.B_avg,data.err_code);
    [data.B_bck]=despike_sodar_219_mnd_v1(data.B_bck,data.err_code);
    %set flags
    [data.flag.winds]=QC_sodar_winds_v1(data);
    [data.flag.components]=QC_sodar_turb_v1(data);
    [data.flag.backscatter]=QC_sodar_BCK_v1(data);
    [data.flag.background_noise]=QC_sodar_BCK_noise_v1(data);
   
    save(fullfile(dn,list(n).name),'data','-v7.3');
    clear data
end