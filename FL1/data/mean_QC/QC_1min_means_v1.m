function QC_1min_means_v1(dn,do)
%dn='E:\WORKING\Flux1\1_min\'
%do='E:\WORKING\Flux1\QC_data\1_min\matlab';
list=dir(dn);

for n=3:length(list)
    load(fullfile(dn,list(n).name));
    din=data;clear data
    %sonic
    ix=find(~isnan(din.sonic.mean_T)==1);
    ix2=ix(end);
    
    data.sonic.DT=      din.DT(ix(1):ix2,:);
    [DoY, ST, ET]=file_times(data.sonic.DT');
    data.sonic.DoY=DoY';data.sonic.ST=ST';data.sonic.ET=ET';clear DoY ST ET
    data.sonic.mean_T=  din.sonic.mean_T(ix(1):ix2);
    data.sonic.std_T=   din.sonic.std_T(ix(1):ix2);
    data.sonic.mean_uvw=din.sonic.mean_uvw(ix(1):ix2,:);
    data.sonic.std_uvw= din.sonic.std_uvw(ix(1):ix2,:);
    data.sonic.mean_WS= din.sonic.mean_WS(ix(1):ix2);
    data.sonic.mean_WD= din.sonic.mean_WD(ix(1):ix2);
    data.sonic.gust_WS= din.sonic.gust_WS(ix(1):ix2,:);
    data.sonic.gust_WD= din.sonic.gust_WD(ix(1):ix2,:);
    
    data.sonic.flag.T=ones(size(data.sonic.mean_T));
    data.sonic.flag.uvw=ones(size(data.sonic.mean_uvw));
    data.sonic.flag.WS=ones(size(data.sonic.mean_WS));
    data.sonic.flag.WD=ones(size(data.sonic.mean_WD));
    
    ix=find((data.sonic.mean_T<=-30)|(data.sonic.mean_T>=50));
    if ~isempty(ix)
        data.sonic.flag.T(ix)=2;
    end
    clear ix
    ix=find((data.sonic.mean_uvw<=-50)|(data.sonic.mean_uvw>=50));
    if ~isempty(ix)
        data.sonic.flag.uvw(ix)=2;
    end
    clear ix
    ix=find((data.sonic.mean_WS<=0)|(data.sonic.mean_WS>=50));
    if ~isempty(ix)
        data.sonic.flag.WS(ix)=2;
    end
    clear ix
    ix=find(data.sonic.mean_WS==0);
    if ~isempty(ix)
        data.sonic.flag.WS(ix)=3;
        data.sonic.flag.WD(ix)=3;
    end
    clear ix
    ix=find((data.sonic.mean_WD<=0)|(data.sonic.mean_WD>=360));
    if ~isempty(ix)
        data.sonic.flag.WD(ix)=2;
    end
    clear ix 
    
    %licor
    ix=find(~isnan(din.licor.mean_T)==1);
    data.licor.DT=      din.DT(ix(1):ix2,:);
    [DoY, ST, ET]=file_times(data.licor.DT');
    data.licor.DoY=DoY';data.licor.ST=ST';data.licor.ET=ET';clear DoY ST ET
    data.licor.mean_T=  din.licor.mean_T(ix(1):ix2);
    data.licor.std_T=   din.licor.std_T(ix(1):ix2);
    data.licor.mean_DPT=din.licor.mean_DPT(ix(1):ix2);
    data.licor.std_DPT= din.licor.std_DPT(ix(1):ix2);
    data.licor.mean_PP= din.licor.mean_PP(ix(1):ix2)./10;
    data.licor.std_PP=  din.licor.std_PP(ix(1):ix2);
    data.licor.mean_CO2=din.licor.mean_CO2(ix(1):ix2,:);
    data.licor.std_CO2= din.licor.std_CO2(ix(1):ix2,:);
    data.licor.mean_H2O=din.licor.mean_H2O(ix(1):ix2,:);
    data.licor.std_H2O= din.licor.std_H2O(ix(1):ix2,:);
    
    data.licor.flag.T=ones(size(data.licor.mean_T));
    data.licor.flag.PP=ones(size(data.licor.mean_PP));
    data.licor.flag.DPT=ones(size(data.licor.mean_DPT));
    data.licor.flag.CO2=ones(size(data.licor.mean_PP));
    data.licor.flag.H2O=ones(size(data.licor.mean_PP));
    
    ix=find((data.licor.mean_T<=-25)|(data.licor.mean_T>=50));
    if ~isempty(ix)
        data.licor.flag.T(ix)=2;
        data.licor.flag.DPT(ix)=2;
    end
    clear ix 
    ix=find((data.licor.mean_PP<=650)|(data.licor.mean_PP>=115000));
    if ~isempty(ix)
        data.licor.flag.PP(ix)=2;
        data.licor.flag.DPT(ix)=2;
    end
    clear ix 
    ix=find((data.licor.mean_CO2(:,3)<=0)|(data.licor.mean_CO2(:,3)>=3000));
    if ~isempty(ix)
        data.licor.flag.CO2(ix)=2;
    end
    clear ix 
    ix=find(data.licor.mean_CO2(:,3)==0);
    if ~isempty(ix)
        data.licor.flag.CO2(ix)=3;
    end
    clear ix 
    ix=find((data.licor.mean_H2O(:,3)<=0)|(data.licor.mean_H2O(:,3)>=60));
    if ~isempty(ix)
        data.licor.flag.H2O(ix)=2;
    end
    clear ix 
    ix=find(data.licor.mean_H2O(:,3)==0);
    if ~isempty(ix)
        data.licor.flag.H2O(ix)=3;
    end
    clear ix 
    save(fullfile(do,list(n).name),'data','-v7.3');
    
    clear data din
end