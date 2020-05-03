function Wrapper_sodar_219_v1(dn,do)
%dn='E:\WORKING\sodar\reproc';
%n=35;

list=dir(dn);

for n=3:length(list)
    display(['n=',' ',list(n).name]);
    fo=list(n).name;
    [d]=get_FAS_219_mnd_v1(fullfile(dn,list(n).name));
    [data]=parse_sodar_219_mnd_v1(d);
    
    save(fullfile(do,[fo(1:end-4),'.mat']),'data','-v7.3');
    clear d data fo
end