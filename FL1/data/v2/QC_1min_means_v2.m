function [means]=QC_1min_means_v2(means)
    
    means.sonic.flag.T=ones(size(means.sonic.mean_T));
    means.sonic.flag.uvw=ones(size(means.sonic.mean_uvw));
    means.sonic.flag.WS=ones(size(means.sonic.mean_WS));
    means.sonic.flag.WD=ones(size(means.sonic.mean_WD));
    
    means.licor.flag.T=ones(size(means.licor.mean_T));
    means.licor.flag.PP=ones(size(means.licor.mean_PP));
    means.licor.flag.CO2=ones(size(means.licor.mean_PP));
    means.licor.flag.H2O=ones(size(means.licor.mean_PP));
    
    means.water.flag.T=ones(size(means.licor.mean_T));
    means.water.flag.PP=ones(size(means.licor.mean_PP));
    means.water.flag.PPwet=ones(size(means.licor.mean_PP));
    means.water.flag.Q=ones(size(means.licor.mean_PP));
    means.water.flag.WVMMR=ones(size(means.licor.mean_PP));
    
    ix=find((means.sonic.mean_T<=-30)|(means.sonic.mean_T>=50));
    if ~isempty(ix)
        means.sonic.flag.T(ix)=2;
        means.water.flag.T(ix)=2;
        means.water.flag.Q(ix)=2;
        means.water.flag.WVMMR(ix)=2;
    end
    clear ix
    ix=find((means.sonic.mean_uvw<=-50)|(means.sonic.mean_uvw>=50));
    if ~isempty(ix)
        means.sonic.flag.uvw(ix)=2;
    end
    clear ix
    ix=find((means.sonic.mean_WS<=0)|(means.sonic.mean_WS>=50));
    if ~isempty(ix)
        means.sonic.flag.WS(ix)=2;
    end
    clear ix
    ix=find(means.sonic.mean_WS==0);
    if ~isempty(ix)
        means.sonic.flag.WS(ix)=3;
        means.sonic.flag.WD(ix)=3;
    end
    clear ix
    ix=find((means.sonic.mean_WD<=0)|(means.sonic.mean_WD>=360));
    if ~isempty(ix)
        means.sonic.flag.WD(ix)=2;
    end
    clear ix 
    
    %licor
    
    ix=find((means.licor.mean_T<=-25)|(means.licor.mean_T>=50));
    if ~isempty(ix)
        means.licor.flag.T(ix)=2;
        means.water.flag.T(ix)=2;
        means.water.flag.Q(ix)=2;
        means.water.flag.WVMMR(ix)=2;
    end
    clear ix 
    ix=find((means.licor.mean_PP<=650)|(means.licor.mean_PP>=115000));
    if ~isempty(ix)
        means.licor.flag.PP(ix)=2;
        means.water.flag.PP(ix)=2;
        means.water.flag.Q(ix)=2;
        means.water.flag.WVMMR(ix)=2;
    end
    clear ix 
    ix=find((means.licor.mean_CO2(:,2)<=0)|(means.licor.mean_CO2(:,2)>=3000));
    if ~isempty(ix)
        means.licor.flag.CO2(ix)=2;
    end
    clear ix 
    ix=find(means.licor.mean_CO2(:,2)==0);
    if ~isempty(ix)
        means.licor.flag.CO2(ix)=3;
    end
    clear ix 
    ix=find((means.licor.mean_H2O(:,2)<=0)|(means.licor.mean_H2O(:,2)>=60));
    if ~isempty(ix)
        means.licor.flag.H2O(ix)=2;
        means.water.flag.PPwet(ix)=2;
        means.water.flag.Q(ix)=2;
        means.water.flag.WVMMR(ix)=2;
    end
    clear ix 
    ix=find(means.licor.mean_H2O(:,2)==0);
    if ~isempty(ix)
        means.licor.flag.H2O(ix)=3;
        means.water.flag.PPwet(ix)=3;
        means.water.flag.Q(ix)=3;
        means.water.flag.WVMMR(ix)=3;
    end
    clear ix 
    
    
end