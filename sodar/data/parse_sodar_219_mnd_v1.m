function [S]=parse_sodar_219_mnd_v1(D)
AL=(30:10:1000);
[~,height,duration]=size(D.temp);

%set up arrays & separate out data
S.DT=ones(duration,6).*NaN;
S.DoY=ones(duration,1).*NaN;
S.ST=ones(duration,1).*NaN;
S.ET=ones(duration,1).*NaN;
S.Z=ones(duration,length(AL)).*NaN;          ZZ=reshape(D.temp(1,:,:),height,duration);%height
S.WS=ones(duration,length(AL)).*NaN;         FF=reshape(D.temp(2,:,:),height,duration);%wind speed
S.WD=ones(duration,length(AL)).*NaN;         DD=reshape(D.temp(3,:,:),height,duration);%direction
S.U=ones(duration,length(AL)).*NaN;          UU=reshape(D.temp(4,:,:),height,duration);%ucomponent
S.V=ones(duration,length(AL)).*NaN;          VV=reshape(D.temp(5,:,:),height,duration);%vcomponent
S.W=ones(duration,length(AL)).*NaN;          WW=reshape(D.temp(6,:,:),height,duration);%wcomponent
S.SH=ones(duration,length(AL)).*NaN;         SH=reshape(D.temp(7,:,:),height,duration);%shear
S.sigU=ones(duration,length(AL)).*NaN;       SU=reshape(D.temp(8,:,:),height,duration);%sig_u
S.sigV=ones(duration,length(AL)).*NaN;       SV=reshape(D.temp(9,:,:),height,duration);%sig_v
S.sigW=ones(duration,length(AL)).*NaN;       SW=reshape(D.temp(10,:,:),height,duration);%sig_w
S.sigD=ones(duration,length(AL)).*NaN;       SD=reshape(D.temp(11,:,:),height,duration);%sig_d
S.errU=ones(duration,length(AL)).*NaN;       EU=reshape(D.temp(16,:,:),height,duration);%err_u
S.errV=ones(duration,length(AL)).*NaN;       EV=reshape(D.temp(17,:,:),height,duration);%err_v
S.errW=ones(duration,length(AL)).*NaN;       EW=reshape(D.temp(18,:,:),height,duration);%err_w
S.B=ones(duration,length(AL)).*NaN;          B=reshape(D.temp(28,:,:),height,duration);%B
S.B_bck=ones(duration,length(AL)).*NaN;      B_bck=reshape(D.temp(29,:,:),height,duration);%B_bck
S.B_avg=ones(duration,length(AL)).*NaN;      B_avg=reshape(D.temp(30,:,:),height,duration);%B_avg
S.err_code=ones(duration,length(AL)).*NaN;   err_code=reshape(D.temp(38,:,:),height,duration);%err code

S.DT=D.TIME;
[DOY, ST, ET]=file_times(S.DT');
S.DoY=DOY'; S.ST=ST'; S.ET=ET'; 

for n=1:duration
    S.Z(n,:)=AL;
    for m=1:length(AL)
        ix=find(ZZ(:,n)==S.Z(n,m));
        if ~isempty(ix)
            S.WS(:,m)   =FF(ix,:);   S.WD(:,m)      =DD(ix,:);   S.U(:,m)    =UU(ix,:); 
            S.V(:,m)    =VV(ix,:);   S.W(:,m)       =WW(ix,:);   S.SH(:,m)   =SH(ix,:);
            S.sigU(:,m) =SU(ix,:);   S.sigV(:,m)    =SV(ix,:);   S.sigW(:,m) =SW(ix,:);
            S.sigD(:,m) =SD(ix,:);   S.errU(:,m)    =EU(ix,:);   S.errV(:,m) =EV(ix,:);
            S.errW(:,m) =EW(ix,:);   S.B(:,m)       =B(ix,:);    S.B_bck(:,m)=B_bck(ix,:);
            S.B_avg(:,m)=B_avg(ix,:);S.err_code(:,m)=err_code(ix,:);
        end
        clear ix
    end
end
