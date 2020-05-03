function [MRR,fo]=parse_MRR_v1(fn)

%fn='E:\raw\mrr\ProcessedData\201606\0611.pro';

fid=fopen(fn);XX=textscan(fid,'%3s  %*[^\n]');fclose('all');

xx=XX{1};
for m=1:length(xx)
    IX(m,:)=xx{m}(1);
end
ix_M=find(IX=='M');
    
MRR.DT=ones(length(ix_M),6).*NaN;
MRR.H=ones(length(ix_M),31).*NaN;
MRR.TF=ones(length(ix_M),31).*NaN;
MRR.F=ones(length(ix_M),64,31).*NaN;
MRR.D=ones(length(ix_M),64,31).*NaN;
MRR.N=ones(length(ix_M),64,31).*NaN;
MRR.PIA=ones(length(ix_M),31).*NaN;
MRR.z=ones(length(ix_M),31).*NaN;
MRR.Z=ones(length(ix_M),31).*NaN;
MRR.RR=ones(length(ix_M),31).*NaN;
MRR.LWC=ones(length(ix_M),31).*NaN;
MRR.W=ones(length(ix_M),31).*NaN;
    
fid=fopen(fn);cc=0;
while ~feof(fid)
    junk=fgetl(fid);
    if ~isempty(junk)
       if strcmp(junk(1),'M')==1;cc=cc+1;[MRR.DT(cc,:)]=get_MMR_v1(junk);end;
       if strcmp(junk(1),'H')==1;[MRR.H(cc,:)]=get_Line_v1(junk);end;
       if strcmp(junk(1),'T')==1;[MRR.TF(cc,:)]=get_Line_v1(junk);end;
       if strcmp(junk(1),'P')==1;[MRR.PIA(cc,:)]=get_Line_v1(junk);end;
       if strcmp(junk(1),'z')==1;[MRR.z(cc,:)]=get_Line_v1(junk);end;
       if strcmp(junk(1),'Z')==1;[MRR.Z(cc,:)]=get_Line_v1(junk);end 
       if strcmp(junk(1),'R')==1;[MRR.RR(cc,:)]=get_Line_v1(junk);end
       if strcmp(junk(1),'L')==1;[MRR.LWC(cc,:)]=get_Line_v1(junk);end
       if strcmp(junk(1),'W')==1;[MRR.W(cc,:)]=get_Line_v1(junk);end
            
       if strcmp(junk(1),'F')==1;
           [F,IX]=get_Spec_v1(junk);
           if IX<=63;MRR.F(cc,IX+1,:)=F;end;clear IX F
       end
       if strcmp(junk(1),'D')==1;
           [D,IX]=get_Spec_v1(junk);
           if IX<=63;MRR.D(cc,IX+1,:)=D;end;clear IX D
       end
       if strcmp(junk(1),'N')==1;
           [N,IX]=get_Spec_v1(junk);
           if IX<=63;MRR.N(cc,IX+1,:)=N;end;clear IX N
       end     
    end
    clear junk
end
fclose('all');

[DoY,ST,ET]=file_times(MRR.DT');
MRR.DoY=DoY';MRR.ET=ET';

%yyyymmmdd
fo=datestr(MRR.ST(1),'YYYYmmDD');
   
    

