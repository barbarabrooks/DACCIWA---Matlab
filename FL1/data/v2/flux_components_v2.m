function [fc]=flux_components_v2(runs)
[rr,xx]=size(runs.sonic.Ts);

%means
fc.uBar=ones(rr,1).*NaN;    %<u>
fc.vBar=ones(rr,1).*NaN;    %<v>
fc.wBar=ones(rr,1).*NaN;    %<w>
fc.TsBar=ones(rr,1).*NaN;   %<Ts> side wind only
fc.CO2Bar=ones(rr,2).*NaN;  %<CO2>
fc.H2OBar=ones(rr,2).*NaN;  %<H2O>
fc.QBar=ones(rr,1).*NaN;    %<Q>
fc.WVMMRBar=ones(rr,2).*NaN;%<WVMMR>
fc.ThetaBar=ones(rr,1).*NaN;%<Theta> sonic temperature corrected for moisture

%primes
fc.uPrime=ones(rr,xx).*NaN;      %u - <u>
fc.vPrime=ones(rr,xx).*NaN;      %v - <v>
fc.wPrime=ones(rr,xx).*NaN;      %w - <w>
fc.TsPrime=ones(rr,xx).*NaN;     %Ts - <Ts>
fc.CO2Prime=ones(rr,xx,2).*NaN;  %CO2 - <CO>
fc.H2OPrime=ones(rr,xx,2).*NaN;  %H2O - <H2O>
fc.QPrime=ones(rr,xx).*NaN;      %Q - <Q>
fc.WVMMRPrime=ones(rr,xx,2).*NaN;%WVMMR - <WVMMR>
fc.ThetaPrime=ones(rr,xx).*NaN;  %Theta - <Theta>

%crossproducts
fc.wPrimeuPrime=ones(rr,xx).*NaN;       %w'u'
fc.wPrimevPrime=ones(rr,xx).*NaN;       %w'v'
fc.wPrimewPrime=ones(rr,xx).*NaN;       %w'w'
fc.uPrimeuPrime=ones(rr,xx).*NaN;       %u'u'
fc.vPrimevPrime=ones(rr,xx).*NaN;       %v'v'
fc.wPrimeTsPrime=ones(rr,xx).*NaN;      %w'Ts'
fc.wPrimeCO2Prime=ones(rr,xx,2).*NaN;   %w'CO2'
fc.wPrimeH2OPrime=ones(rr,xx,2).*NaN;   %w'H2O'
fc.wPrimeQPrime=ones(rr,xx).*NaN;       %w'Q'
fc.wPrimeWVMMRPrime=ones(rr,xx,2).*NaN; %w'WVMMR'
fc.wPrimeThetaPrime=ones(rr,xx).*NaN;   %w'Theta'

%crossproduct means
fc.wPrimeuPrimeBar=ones(rr,1).*NaN;       %<w'u'>
fc.wPrimevPrimeBar=ones(rr,1).*NaN;       %<w'v'>
fc.wPrimewPrimeBar=ones(rr,1).*NaN;       %<w'w'>
fc.uPrimeuPrimeBar=ones(rr,1).*NaN;       %<u'u'>
fc.vPrimevPrimeBar=ones(rr,1).*NaN;       %<v'v'>
fc.wPrimeTsPrimeBar=ones(rr,1).*NaN;      %<w'Ts'>
fc.wPrimeCO2PrimeBar=ones(rr,2).*NaN;     %<w'CO2'>
fc.wPrimeH2OPrimeBar=ones(rr,2).*NaN;     %<w'H2O'>
fc.wPrimeQPrimeBar=ones(rr,1).*NaN;       %<w'Q'>
fc.wPrimeWVMMRPrimeBar=ones(rr,2).*NaN;   %<w'WVMMR'>
fc.wPrimeThetaPrimeBar=ones(rr,1).*NaN;   %<w'Theta'>

for cc=1:rr
    u=reshape(runs.sonic.xyz_rotated(cc,:,1),xx,1);
    v=reshape(runs.sonic.xyz_rotated(cc,:,2),xx,1);
    w=reshape(runs.sonic.xyz_rotated(cc,:,3),xx,1);
    Ts=runs.sonic.Ts(cc,:)+273.15;
    CO2_1=reshape(runs.licor.CO2(cc,:,1),xx,1);
    CO2_2=reshape(runs.licor.CO2(cc,:,2),xx,1);
    H2O_1=reshape(runs.licor.H2O(cc,:,1),xx,1);
    H2O_2=reshape(runs.licor.H2O(cc,:,2),xx,1);
    Q=runs.water.Q(cc,:);
    WVMMR_1=reshape(runs.water.WVMMR(cc,:,1),xx,1);
    WVMMR_2=reshape(runs.water.WVMMR(cc,:,2),xx,1);
    theta=runs.water.T(cc,:);
    
    %means
    ix=find(~isnan(u)==1);mu=mean(u(ix));clear ix
    ix=find(~isnan(v)==1);mv=mean(v(ix));clear ix
    ix=find(~isnan(w)==1);mw=mean(w(ix));clear ix
    ix=find(~isnan(Ts)==1);mTs=mean(Ts(ix));clear ix
    ix=find(~isnan(CO2_1)==1);mCO2(1)=mean(CO2_1(ix));clear ix
    ix=find(~isnan(CO2_2)==1);mCO2(2)=mean(CO2_2(ix));clear ix
    ix=find(~isnan(H2O_1)==1);mH2O(1)=mean(H2O_1(ix));clear ix
    ix=find(~isnan(H2O_2)==1);mH2O(2)=mean(H2O_2(ix));clear ix
    ix=find(~isnan(Q)==1);mQ=mean(Q(ix));clear ix
    ix=find(~isnan(WVMMR_1)==1);mWVMMR(1)=mean(WVMMR_1(ix));clear ix
    ix=find(~isnan(WVMMR_2)==1);mWVMMR(2)=mean(WVMMR_2(ix));clear ix
    ix=find(~isnan(theta)==1);mtheta=mean(theta(ix));clear ix
    
    fc.uBar(cc,:)=mu;fc.vBar(cc,:)=mv;fc.wBar(cc,:)=mw;fc.TsBar(cc,:)=mTs;
    fc.CO2Bar(cc,:)=mCO2;fc.H2OBar(cc,:)=mH2O;fc.QBar(cc,:)=mQ;
    fc.WVMMRBar(cc,:)=mWVMMR;fc.ThetaBar(cc,:)=mtheta;
    
    %primes
    uprime=u-mu;
    vprime=v-mv;
    wprime=w-mw;
    Tsprime=Ts-mTs;
    CO2prime1=CO2(1)-mCO2_1;
    CO2prime2=CO2(2)-mCO2_2;
    H2Oprime1=H2O(1)-mH2O_1;
    H2Oprime2=H2O(2)-mH2O_2;
    Qprime=Q-mQ;
    WVMMRprime1=WVMMR(1)-mWVMMR_1;
    WVMMRprime2=WVMMR(2)-mWVMMR_2;
    thetaprime=theta-mtheta;
    
    fc.uPrime(cc,1:length(uprime))=uprime;
    fc.vPrime(cc,1:length(vprime))=vprime;
    fc.wPrime(cc,1:length(wprime))=wprime;
    fc.TsPrime(cc,1:length(Tsprime))=Tsprime;
    fc.CO2Prime(cc,1:length(CO2prime1),1)=CO2prime1;
    fc.CO2Prime(cc,1:length(CO2prime2),2)=CO2prime2;
    fc.H2OPrime(cc,1:length(H2Oprime1),1)=H2Oprime1;
    fc.H2OPrime(cc,1:length(H2Oprime2),2)=H2Oprime2;
    fc.QPrime(cc,1:length(Qprime))=Qprime;
    fc.WVMMRPrime(cc,1:length(WVMMRprime1),1)=WVMMRprime1;
    fc.WVMMRPrime(cc,1:length(WVMMRprime2),2)=WVMMRprime2;
    fc.ThetaPrime(cc,1:length(thetaprime))=thetaprime;
    
    %crossproducts
    wprimeuprime=wprime.*uprime;
    wprimevprime=wprime.*vprime;
    wprimewprime=wprime.*wprime;
    uprimeuprime=uprime.*uprime;
    vprimevprime=vprime.*vprime;
    wprimeTsprime=wprime.*Tsprime';
    wprimeCO2prime1=wprime.*CO2prime1;wprimeCO2prime2=wprime.*CO2prime2;
    wprimeH2Oprime1=wprime.*H2Oprime1;wprimeH2Oprime2=wprime.*H2Oprime2;
    wprimeQprime=wprime.*Qprime';
    wprimeWVMMRprime1=wprime.*WVMMRprime1; wprimeWVMMRprime2=wprime.*WVMMRprime2;
    wprimethetaprime=wprime.*thetaprime';
    
    fc.wPrimeuPrime(cc,1:length(wprimeuprime))=wprimeuprime;
    fc.wPrimevPrime(cc,1:length(wprimevprime))=wprimevprime;
    fc.wPrimewPrime(cc,1:length(wprimewprime))=wprimewprime;
    fc.uPrimeuPrime(cc,1:length(uprimeuprime))=uprimeuprime;
    fc.vPrimevPrime(cc,1:length(vprimevprime))=vprimevprime;
    fc.wPrimeTsPrime(cc,1:length(wprimeTsprime))=wprimeTsprime;
    fc.wPrimeCO2Prime(cc,1:length(wprimeCO2prime1),1)=wprimeCO2prime1;
    fc.wPrimeCO2Prime(cc,1:length(wprimeCO2prime2),2)=wprimeCO2prime2;   
    fc.wPrimeH2OPrime(cc,1:length(wprimeH2Oprime1),1)=wprimeH2Oprime1;
    fc.wPrimeH2OPrime(cc,1:length(wprimeH2Oprime2),2)=wprimeH2Oprime2;
    fc.wPrimeQPrime(cc,1:length(wprimeQprime))=wprimeQprime;
    fc.wPrimeWVMMRPrime(cc,1:length(wprimeWVMMRprime1),1)=wprimeWVMMRprime1;
    fc.wPrimeWVMMRPrime(cc,1:length(wprimeWVMMRprime2),2)=wprimeWVMMRprime2;
    fc.wPrimewThetaPrime(cc,1:length(wprimethetaprime))=wprimethetaprime;
    
    %mean of cross products
    ix=find(~isnan(wprimeuprime)==1);mwprimeuprime=mean(wprimeuprime(ix));clear ix
    ix=find(~isnan(wprimevprime)==1);mwprimevprime=mean(wprimevprime(ix));clear ix
    ix=find(~isnan(wprimewprime)==1);mwprimewprime=mean(wprimewprime(ix));clear ix
    ix=find(~isnan(uprimeuprime)==1);muprimeuprime=mean(uprimeuprime(ix));clear ix
    ix=find(~isnan(vprimevprime)==1);mvprimevprime=mean(vprimevprime(ix));clear ix
    ix=find(~isnan(wprimeTsprime)==1);mwprimeTsprime=mean(wprimeTsprime(ix));clear ix
    
    ix=find(~isnan(wprimeCO2prime1)==1);mwprimeCO2prime(1)=mean(wprimeCO2prime1(ix));clear ix
    ix=find(~isnan(wprimeCO2prime2)==1);mwprimeCO2prime(2)=mean(wprimeCO2prime2(ix));clear ix
    ix=find(~isnan(wprimeH2Oprime1)==1);mwprimeH2Oprime(1)=mean(wprimeH2Oprime1(ix));clear ix
    ix=find(~isnan(wprimeH2Oprime2)==1);mwprimeH2Oprime(2)=mean(wprimeH2Oprime2(ix));clear ix
    
    ix=find(~isnan(wprimeQprime)==1);mwprimeQprime=mean(wprimeQprime(ix));clear ix
    ix=find(~isnan(wprimeWVMMRprime1)==1);mwprimeWVMMRprime(1)=mean(wprimeWVMMRprime1(ix));clear ix
    ix=find(~isnan(wprimeWVMMRprime2)==1);mwprimeWVMMRprime(2)=mean(wprimeWVMMRprime2(ix));clear ix
    ix=find(~isnan(wprimethetaprime)==1);mwprimethetaprime=mean(wprimethetaprime(ix));clear ix
    
    fc.wPrimeuPrimeBar(cc,:)=mwprimeuprime;
    fc.wPrimevPrimeBar(cc,:)=mwprimevprime;
    fc.wPrimewPrimeBar(cc,:)=mwprimewprime;
    fc.uPrimeuPrimeBar(cc,:)=muprimeuprime;
    fc.vPrimevPrimeBar(cc,:)=mvprimevprime;
    fc.wPrimeTsPrimeBar(cc,:)=mwprimeTsprime;
    fc.wPrimeCO2PrimeBar(cc,:)=mwprimeCO2prime;
    fc.wPrimeH2OPrimeBar(cc,:)=mwprimeH2Oprime;
    fc.wPrimeQPrimeBar(cc,:)=mwprimeQprime;
    fc.wPrimeWVMMRPrimeBar(cc,:)=mwprimeWVMMRprime;
    fc.wPrimeThetaPrimeBar(cc,:)=mwprimethetaprime;
end    
    