function Wrapper_Parse_ceilometer_v1(dn,do)

%dn: directory of daily data containing hourly files
%do: out put for daily matlab file

list=dir(dn);

for n=3:length(list)
    [data]=Parse_Ceilometer_v1(fullfile(dn,list(n).name));
    save(fullfile(do,[list(n).name,'.mat']),'data','-v7.3');
    clear data
end