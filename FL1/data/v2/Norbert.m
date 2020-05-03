dn='F:\WORKING\Flux1\V_2\fluxes';
list=dir(dn);

for n=24:29
    display(['n=',num2str(n),' ',list(n).name]);
    load(fullfile(dn,list(n).name));
    if n==24    
        DT=data.runs.end_of_run_DT;
        SHF=data.runs.flux_estimates.SHF;
        LHF=data.runs.flux_estimates.LHF;
        B=data.runs.flux_estimates.B;
    else
        DT=[DT;data.runs.end_of_run_DT];
        SHF=[SHF;data.runs.flux_estimates.SHF];
        LHF=[LHF;data.runs.flux_estimates.LHF];
        B=[B;data.runs.flux_estimates.B];
    end
    clear data
end
[DoY,ST,ET]=file_times(DT');

figure
plot(ST,SHF,'b',ST,LHF,'r');
grid
set(gca,'tickdir','out')
set(gca,'xticklabel',datestr(get(gca,'Xtick'),'DD/mm'))
xlabel('Date');ylabel ('Heat Flux (W m^-^2)');legend('Sensible Heat Flux', 'Latent Heat Flux')
