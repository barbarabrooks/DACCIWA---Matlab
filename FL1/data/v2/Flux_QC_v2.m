function Flux_QC_v2(dn,do,sf,Z,off)
%sf=20;
%Z=3.5;
%off=6;

%dn='F:\WORKING\Flux1\V_2\dailys';
%do='F:\WORKING\Flux1\V_2\fluxes';
%sf=sample frequency Hz
%Z = measurement height m
list=dir(dn);
for n=3:length(list)
    display(['n=',num2str(n),' ',list(n).name]);
    load(fullfile(dn,list(n).name));
    d1=data.raw.sonic;d2=data.raw.licor;
    
    %clean sonic & Licor
    [sonic, licor]=clean_sonic_and_licor_v2(d1,d2);
    data.sonic=sonic;data.licor=licor;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %correct temperature
    [sonic.Ts] = Ts_sidewind_correction_v2(sonic.Ts,sonic.xyz(:,1),sonic.xyz(:,2),sonic.xyz(:,3),'metek');
    data.sonic=sonic;data.licor=licor;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %correct for licor delay
    [licor.DT]=correct_for_delay_v2(licor);
    data.sonic=sonic;data.licor=licor;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %interpolate licor
    [licor]=interpolate_licor_v2(sonic,licor);
    data.sonic=sonic;data.licor=licor;
    %save(fullfile(do,list(n).name),'data','-v7.3') 

    %rotate to earth frame
    [sonic.earth_xyz]=rotate_to_earth_v2(sonic,off);
    data.sonic=sonic;data.licor=licor;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %calculate specific Humidity Q
    [water]=water_content_v2(sonic,licor);
    data.water=water;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %1 minute means
    [means]=means_1min_v2(sonic,licor,water);
    data.means=means;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %QC means
    [means]=QC_1min_means_v2(means);
    data.means=means;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %separate to runs add times and rotate to run
    [runs]=create_runs_v2(sonic,licor,water);
    %data.runs=runs;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
     %QC flux component for each run
    [runs.QC]=flux_stats_v2(runs,sf,Z);    
    %data.runs=runs;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %Generate flux components for each run
    [runs.flux_components]=flux_components_v2(runs);
    %data.runs=runs;
    %save(fullfile(do,list(n).name),'data','-v7.3')
    
    %caculate flux estimates for each run
    [runs.flux_estimates]=flux_estimates_v2(runs);
    
    data.runs=runs;
    
    save(fullfile(do,list(n).name),'data','-v7.3')
end   