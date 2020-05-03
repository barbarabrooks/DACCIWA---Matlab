function [d]=QC_ceilometer_v1(d)
d.flag=ones(size(d.BB));
%
ix=find(d.BB<=0);
if ~isempty(ix)
    d.flag(ix)=2;
    d.BB(ix)=d.BB(ix).*NaN;
end
clear ix

ix=find(log10(d.BB)<=-6.5);
if ~isempty(ix)
    d.flag(ix)=2;
end
clear ix

ix=find(log10(d.BB)>=0);
if ~isempty(ix)
    d.flag(ix)=2;
end
clear ix

[dur,gates]=size(d.flag);
for n=1:gates
    for m=3:dur-2
        if( (d.flag(m,n)==1)&(d.flag(m-2,n)~=1)&(d.flag(m+2,n)~=1) )
            d.flag(m,n)=2;
        end
    end
end
for n=1:gates
    for m=2:dur-1
        if( (d.flag(m,n)==1)&(d.flag(m-1,n)~=1)&(d.flag(m+1,n)~=1) )
            d.flag(m,n)=2;
        end
    end
end
for n=1:dur
    for m=3:gates-2
        if( (d.flag(n,m)==1)&(d.flag(n,m-2)~=1)&(d.flag(n,m+2)~=1) )
            d.flag(n,m)=2;
        end
    end
end
for n=1:dur
    for m=2:gates-1
        if( (d.flag(n,m)==1)&(d.flag(n,m-1)~=1)&(d.flag(n,m+1)~=1) )
            d.flag(n,m)=2;
        end
    end
end  