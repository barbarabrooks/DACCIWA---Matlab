dn='G:\renfrew\New folder\';
do='G:\renfrew\New folder\';

fn(1,:)='edt_1s_20180301_2047.txt';
fn(2,:)='edt_1s_20180316_1141.txt';
fn(3,:)='edt_1s_20180316_1444.txt';
fn(4,:)='edt_1s_20180317_0850.txt';
fn(5,:)='edt_1s_20180315_2346.txt';

for n=5:5
    
     display(fn(n,:))
           
     [data]=get_Sonde_EDT_MW41_v2(fullfile(dn,fn(n,:)));
     [data]=QC_Sonde_EDT_MW41_v2(data);
    
     fo=fn(n,:);
     save(fullfile(do,[fo(1:end-4),'.mat']),'data','-v7.3');
     clear data fo
end