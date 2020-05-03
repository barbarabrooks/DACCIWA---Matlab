function wrapper_HATPRO_v1(dn,do)
%dn - input dorectory should be the year Ynnnn
%do - output directory
%code assumes standard HATPRO data structure

%dn='E:\ACSE - radiometer\raw\Y2014';
%do='E:\ACSE - radiometer\matlab';

list_month=dir(dn);
for n=5:5%length(list_month)
    list_day=dir(fullfile(dn,list_month(n).name));
    for m=3:length(list_day)
        display(fullfile(fullfile(dn,list_month(n).name),list_day(m).name))
        [data, fo]=parse_HATPRO_v1(fullfile(fullfile(dn,list_month(n).name),list_day(m).name));
        [data]=QC_HATPRO_v1(data);
        
        save(fullfile(do,fo),'data','-v7.3')
        clear data fo
    end
    clear list_day
end