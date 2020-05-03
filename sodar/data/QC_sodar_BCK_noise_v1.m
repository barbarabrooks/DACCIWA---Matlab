function [bn]=QC_sodar_BCK_noise_v1(d)

bn=ones(size(d.DoY));

[dur,alt]=size(d.B);

for n=1:dur
    
   tp=log10(d.B(n,:));
   
   ix=find(tp>5);
   tp(ix)=tp(ix).*NaN;
   clear ix
   
   tp2=tp(80:end);
   ix=find(~isnan(tp2)==1);
   if ~isempty(ix)       
       mean_tp2=mean(tp2(ix));
       if mean_tp2>2
           bn(n)=2;
       end
   end
end
   

