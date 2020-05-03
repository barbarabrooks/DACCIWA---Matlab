function [d1]=QC_MRR_v1(d1)

d1.flag.line=ones(size(d1.Z));
d1.flag.spec=ones(size(d1.N));

%no radar return
ix=find(isnan(d1.z)==1);
if ~isempty(ix)
    d1.flag.line(ix)=2;
end
clear ix

%error n rain rate
ix=find(d1.RR<0);
if ~isempty(ix)
    d1.flag.line(ix)=3;
end
clear ix

%error n rain rate
ix=find(d1.RR>300);
if ~isempty(ix)
    d1.flag.line(ix)=4;
end
clear ix

%error in fall velocty
ix=find(d1.W<0);
if ~isempty(ix)
    d1.flag.line(ix)=5;
end
clear ix

%zero rain
ix=find(d1.RR==0);
if ~isempty(ix)
    d1.flag.line(ix)=6;
end
clear ix

%noise
[dur,rag]=size(d1.RR);
for n=1:rag
    tmp=d1.flag.line(:,n);
    for m=2:dur-1
        if ((tmp(m-1)~=1)&(tmp(m)==1)&(tmp(m+1)~=1))
            d1.flag.line(m,n)=7;
            d1.flag.spec(m,:,n)=ones(1,64).*7;
        end
    end
end

%neg size
ix=find(d1.D<0);
if ~isempty(ix)
    d1.flag.spec(ix)=2;
end
clear ix

%zero size
ix=find(d1.D==0);
if ~isempty(ix)
    d1.flag.spec(ix)=3;
end
clear ix

%neg number
ix=find(d1.N<0);
if ~isempty(ix)
    d1.flag.spec(ix)=4;
end
clear ix

%too big number
ix=find(d1.N>10000);
if ~isempty(ix)
    d1.flag.spec(ix)=5;
end
clear ix

%zero number
ix=find(d1.N==0);
if ~isempty(ix)
    d1.flag.spec(ix)=6;
end
clear ix

