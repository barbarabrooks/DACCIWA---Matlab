function [DT] =correct_for_delay_v2(licor)

licor.doy=licor.doy-(0.130/(24*60*60));
year=licor.DT(1,1);
DT=datevec(licor.doy);
DT(:,1)=year;