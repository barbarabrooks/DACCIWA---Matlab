function Wrapper_Parse_Sonde_EDT_MW41_v2(dn,do)

%dn: directory of EDT files - one matlab per sounding
%do: out put for daily matlab file

list=dir(dn);
msg = 'edt_1s_';
for n=3:length(list)
    list2 = dir(fullfile(dn,list(n).name));
    for m = 3 : length(list2)
        if strfind(list2(m).name,msg)
            display(fullfile(dn,fullfile(list(n).name,list2(m).name)))
           
            [data]=get_Sonde_EDT_MW41_v2(fullfile(dn,fullfile(list(n).name,list2(m).name)));
            [data]=QC_Sonde_EDT_MW41_v2(data);
    
            fo=list2(m).name;
            save(fullfile(do,[fo(1:end-4),'.mat']),'data','-v7.3');
            clear data fo
        end
        
    end
end