function [runs]=create_runs_v2(sonic,licor,water)
cc=0;
for m=0:23
    ix1=find((licor.DT(:,4)==m)&(licor.DT(:,5)<30));
    ix2=find((licor.DT(:,4)==m)&(licor.DT(:,5)>=30));
        
    if ~isempty(ix1)
        cc=cc+1;
        runs.DT(cc,:,:)=ones(36500,6).*NaN;
        runs.DT(cc,1:length(ix1),:)=sonic.DT(ix1,:);
        DT=sonic.DT(ix1,:);[DoY,ST,ET]=file_times(DT');
        runs.DoY(cc,:)=ones(36500,1).*NaN;
        runs.DoY(cc,1:length(ix1))=DoY';
        runs.ST(cc,:)=ones(36500,1).*NaN;
        runs.ST(cc,1:length(ix1))=ST';
        runs.ET(cc,:)=ones(36500,1).*NaN;
        runs.ET(cc,1:length(ix1))=ET';
        
        runs.start_of_run_DT(cc,:)=ones(1,6).*NaN;
        runs.start_of_run_DT(cc,:)=DT(1,:);
        runs.end_of_run_DT(cc,:)=ones(1,6).*NaN;
        runs.end_of_run_DT(cc,:)=DT(end,:);
        
        runs.start_of_run_DoY(cc,1)=NaN;
        runs.start_of_run_DoY(cc,1)=DoY(1);
        runs.end_of_run_DoY(cc,1)=NaN;
        runs.end_of_run_DoY(cc,1)=DoY(end);
        
        runs.start_of_run_ST(cc,1)=NaN;
        runs.start_of_run_ST(cc,1)=ST(1);
        runs.end_of_run_ST(cc,1)=NaN;
        runs.end_of_run_ST(cc,1)=ST(end);
        
        runs.start_of_run_ET(cc,1)=NaN;
        runs.start_of_run_ET(cc,1)=ET(1);
        runs.end_of_run_ET(cc,1)=NaN;
        runs.end_of_run_ET(cc,1)=ET(end);
        
        runs.length_of_run(cc,1)=NaN;
        runs.length_of_run(cc,1)=ET(end)-ET(1);
        runs.number_of_samples(cc,1)=NaN;
        runs.number_of_samples(cc,1)=length(ix1);
         
        runs.sonic.Ts(cc,:)=ones(36500,1).*NaN;
        runs.sonic.Ts(cc,1:length(ix1))=sonic.Ts(ix1);
        runs.sonic.xyz_measured(cc,:,:)=ones(36500,3).*NaN;
        runs.sonic.xyz_measured(cc,1:length(ix1),:)=sonic.xyz(ix1,:);
        runs.sonic.xyz_earth(cc,:,:)=ones(36500,3).*NaN;
        runs.sonic.xyz_earth(cc,1:length(ix1),:)=sonic.earth_xyz(ix1,:);
        
        runs.sonic.xyz_rotated(cc,:,:)=ones(36500,3).*NaN;
        um=sonic.xyz(ix1,1);vm=sonic.xyz(ix1,2);wm=sonic.xyz(ix1,3);
        [u,v,w,~,~,~]=rotate_to_run_v2(um,vm,wm);
        runs.sonic.xyz_rotated(cc,1:length(ix1),1)=u;
        runs.sonic.xyz_rotated(cc,1:length(ix1),2)=v;
        runs.sonic.xyz_rotated(cc,1:length(ix1),3)=w;
        clear um vm wm u v w
        
        runs.licor.T(cc,:)=ones(36500,1).*NaN;
        runs.licor.T(cc,1:length(ix1))=licor.T(ix1);
        runs.licor.PP(cc,:)=ones(36500,1).*NaN;
        runs.licor.PP(cc,1:length(ix1))=licor.PP(ix1);
        runs.licor.CO2(cc,:,:)=ones(36500,2).*NaN;
        runs.licor.CO2(cc,1:length(ix1),:)=licor.CO2(ix1,:);
        runs.licor.H2O(cc,:,:)=ones(36500,2).*NaN;
        runs.licor.H2O(cc,1:length(ix1),:)=licor.H2O(ix1,:);
        
        runs.water.T(cc,:)=ones(36500,1).*NaN;
        runs.water.T(cc,1:length(ix1))=water.Ts(ix1);
        runs.water.PPwet(cc,:)=ones(36500,1).*NaN;
        runs.water.PPwet(cc,1:length(ix1))=water.PPwet(ix1);
        runs.water.Q(cc,:)=ones(36500,1).*NaN;
        runs.water.Q(cc,1:length(ix1))=water.Q(ix1);
        runs.water.WVMMR(cc,:,:)=ones(36500,2).*NaN;
        runs.water.WVMMR(cc,1:length(ix1),1)=water.Mmr_licor(ix1,:);
        runs.water.WVMMR(cc,1:length(ix1),2)=water.Mmr_sonic(ix1,:);
    end
    
    if ~isempty(ix2)
        cc=cc+1;
        runs.DT(cc,:,:)=ones(36500,6).*NaN;
        runs.DT(cc,1:length(ix2),:)=sonic.DT(ix2,:);
        DT=sonic.DT(ix2,:);[DoY,ST,ET]=file_times(DT');
        runs.DoY(cc,:)=ones(36500,1).*NaN;
        runs.DoY(cc,1:length(ix2))=DoY';
        runs.ST(cc,:)=ones(36500,1).*NaN;
        runs.ST(cc,1:length(ix2))=ST';
        runs.ET(cc,:)=ones(36500,1).*NaN;
        runs.ET(cc,1:length(ix2))=ET';
        
        runs.start_of_run_DT(cc,:)=ones(1,6).*NaN;
        runs.start_of_run_DT(cc,:)=DT(1,:);
        runs.end_of_run_DT(cc,:)=ones(1,6).*NaN;
        runs.end_of_run_DT(cc,:)=DT(end,:);
        
        runs.start_of_run_DoY(cc,1)=NaN;
        runs.start_of_run_DoY(cc,1)=DoY(1);
        runs.end_of_run_DoY(cc,1)=NaN;
        runs.end_of_run_DoY(cc,1)=DoY(end);
        
        runs.start_of_run_ST(cc,1)=NaN;
        runs.start_of_run_ST(cc,1)=ST(1);
        runs.end_of_run_ST(cc,1)=NaN;
        runs.end_of_run_ST(cc,1)=ST(end);
        
        runs.start_of_run_ET(cc,1)=NaN;
        runs.start_of_run_ET(cc,1)=ET(1);
        runs.end_of_run_ET(cc,1)=NaN;
        runs.end_of_run_ET(cc,1)=ET(end);
        
        runs.length_of_run(cc,1)=NaN;
        runs.length_of_run(cc,1)=ET(end)-ET(1);
        runs.number_of_samples(cc,1)=NaN;
        runs.number_of_samples(cc,1)=length(ix1);
        
        runs.sonic.Ts(cc,:)=ones(36500,1).*NaN;
        runs.sonic.Ts(cc,1:length(ix2))=sonic.Ts(ix2);
        runs.sonic.xyz_measured(cc,:,:)=ones(36500,3).*NaN;
        runs.sonic.xyz_measured(cc,1:length(ix2),:)=sonic.xyz(ix2,:);
        runs.sonic.xyz_earth(cc,:,:)=ones(36500,3).*NaN;
        runs.sonic.xyz_earth(cc,1:length(ix2),:)=sonic.earth_xyz(ix2,:);
        
        runs.sonic.xyz_rotated(cc,:,:)=ones(36500,3).*NaN;
        um=sonic.xyz(ix2,1);vm=sonic.xyz(ix2,2);wm=sonic.xyz(ix2,3);
        [u,v,w,~,~,~]=rotate_to_run_v2(um,vm,wm);
        runs.sonic.xyz_rotated(cc,1:length(ix2),1)=u;
        runs.sonic.xyz_rotated(cc,1:length(ix2),2)=v;
        runs.sonic.xyz_rotated(cc,1:length(ix2),3)=w;
        clear um vm wm u v w
        
        runs.licor.T(cc,:)=ones(36500,1).*NaN;
        runs.licor.T(cc,1:length(ix2))=licor.T(ix2);
        runs.licor.PP(cc,:)=ones(36500,1).*NaN;
        runs.licor.PP(cc,1:length(ix2))=licor.PP(ix2);
        runs.licor.CO2(cc,:,:)=ones(36500,2).*NaN;
        runs.licor.CO2(cc,1:length(ix2),:)=licor.CO2(ix2,:);
        runs.licor.H2O(cc,:,:)=ones(36500,2).*NaN;
        runs.licor.H2O(cc,1:length(ix2),:)=licor.H2O(ix2,:);
        
        runs.water.T(cc,:)=ones(36500,1).*NaN;
        runs.water.T(cc,1:length(ix2))=water.Ts(ix2);
        runs.water.PPwet(cc,:)=ones(36500,1).*NaN;
        runs.water.PPwet(cc,1:length(ix2))=water.PPwet(ix2);
        runs.water.Q(cc,:)=ones(36500,1).*NaN;
        runs.water.Q(cc,1:length(ix2))=water.Q(ix2);
        runs.water.WVMMR(cc,:,:)=ones(36500,2).*NaN;
        runs.water.WVMMR(cc,1:length(ix2),1)=water.Mmr_licor(ix2,:);
        runs.water.WVMMR(cc,1:length(ix2),2)=water.Mmr_sonic(ix2,:);   
    end
end
          