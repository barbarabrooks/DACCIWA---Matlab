function [fc]=flux_estimates_v2(runs)
R=8.314; % universal gas constant J mol-1 K-1
mw=18.02; %molecular weight of water (g) 
md=28.97; %molecular weight dry air (g)
MW=0.01802; %kg mol-1
MD=0.02897; %kg mol-1
Rd=R/MD;   % gas constant for dry air J K-1 kg-1
Rw=R/MW;   % gas constant for water vapour J K-1 kg-1
C=2.16679; % g K J-1


%water.Ts: water and side wind corrected sonic temperature (K)
%water.PPwet: water vapor partial pressure (Pa)

[no_runs,~]=size(runs.DT);

for m=1:no_runs
    %Absolute Humidity (kg K J-1)
    %water.T: water and side wind corrected sonic temperature (K)
    %water.PPwet: water vapor partial pressure (Pa)
    A=C.*runs.water.PPwet(m,:)./runs.water.T(m,:); %(g K J-1)
    A=A./1000;%(kg K J-1)
    ix=find(~isnan(A)==1);
    if ~isempty(ix)
        ABar=mean(A(ix));
    end
    clear ix
    
    %air density (kg m-3)
    %water.T: water and side wind corrected sonic temperature (K)
    %water.Q: specific humidity (kg/kg)
    pp_mb=(runs.licor.PP(m,:)).*10; %licor pressure in mb, KPa in file
    rho=density(pp_mb,runs.water.T(m,:),runs.water.Q(m,:));
    ix=find(~isnan(rho)==1);
    if ~isempty(ix)
        rhoBar=mean(rho(ix));
    end
    clear ix
    
    %heat capacity (J kg-1 K-1)
    cp=1.005+(1.82.*A); %(kJ kg-1 K-1)
    cp=cp.*1000; %(J kg-1 K-1)
    ix=find(~isnan(cp)==1);
    if ~isempty(ix)
        cpBar=mean(cp(ix));
    end
    clear ix
    
    %bouyancy flux (BF) rho.*cp <w'Ts'>
    fc.PF(m,:)=rhoBar.*cpBar.*runs.flux_components.wPrimeTsPrimeBar(m,:);

	%kinematic humidity flux (KHF) <w'Q'> (kg/kg ms-1)
    fc.KHF(m,:)=runs.flux_components.wPrimeQPrimeBar(m,:);

    %kinematic sonic temperature flux  (KSTF) <w'Ts'> (K ms-1)
    fc.KSTF(m,:)=runs.flux_components.wPrimeTsPrimeBar(m,:);
    
    %sensible heat flux (SHF)(W m-2)
    fc.SHF(m,:)=rhoBar.*cpBar.*runs.flux_components.wPrimeThetaPrimeBar(m,:);

    %Latent heat flux LHF (W m-2)
    LHV=3147.5-(2.372.*runs.flux_components.ThetaBar(m,:));%latent heat of vaporisation of water (J kg-1)
    PPdry=(runs.licor.PP(m,:).*1000)-runs.water.PPwet(m,:);
    ix=find(~isnan(PPdry)==1);
    if ~isempty(ix)
        PPdryBar=mean(PPdry(ix));
    end
    clear ix
    fc.LHF(m,:)=LHV.*((md.*PPdryBar)./(R.*runs.flux_components.ThetaBar(m,:))).*...
        runs.flux_components.wPrimeWVMMRPrimeBar(m,2);
    
    %Bowen ratio B
    fc.B(m,:)=fc.SHF(m,:)./fc.LHF(m,:);

    %momnetum flux (MOMFU, MONFV)-rho*<w'u'>, -rho*<w'v'>
    fc.MOMFU(m,:)=(-1).*rhoBar.*runs.flux_components.wPrimeuPrimeBar(m,:);
    fc.MOMFV(m,:)=(-1).*rhoBar.*runs.flux_components.wPrimevPrimeBar(m,:);
    
end