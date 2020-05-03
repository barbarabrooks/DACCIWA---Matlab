function Wrapper_Parse_Sonde_EDT_v1(dn,do)

%dn: directory of EDT files - one matlab per sounding
%do: out put for daily matlab file

list=dir(dn);

for n=3:length(list)
    display(['n= ',num2str(n),' ',list(n).name])
    [data]=get_Sonde_EDT_v1(fullfile(dn,list(n).name));
    [data]=QC_Sonde_EDT_v1(data);
    
    fo=list(n).name;
    save(fullfile(do,[fo(1:end-4),'.mat']),'data','-v7.3');
    clear data fo
end