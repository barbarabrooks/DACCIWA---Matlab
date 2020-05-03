% MATLAB FUNCTION DENSITY
%
% function rho=density(rstat,atb,q)   
%
% Routine to calculate air density
% inputs rstat : static pressure (mb)
%        atb   : air temperature (K)
%        q     : specific humidity (kg/kg) or MMR (kg/kg)
%
% output in kg/m**3
% DPR

function rho=density(rstat,atb,q)

k=find(atb<100);
atb(k)=atb(k)+273.16;
l=find(q>0.1);
q(l)=q(l)/1000.;
Rd=287.0;
rho=1./((Rd.*atb).*(1.+0.61.*q)).*rstat.*100;
