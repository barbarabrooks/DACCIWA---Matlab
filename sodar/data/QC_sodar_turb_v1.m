function [c]=QC_sodar_turb_v1(d)

c.U=ones(size(d.U));
c.V=ones(size(d.V));
c.W=ones(size(d.W));

ix=find(d.errU>7);
if ~isempty(ix)
    c.U(ix)=3;
end
clear ix

ix=find(d.errV>7);
if ~isempty(ix)
    c.V(ix)=3;
end
clear ix

ix=find(d.errW>7);
if ~isempty(ix)
    c.W(ix)=3;
end
clear ix

% -20 ms-1 < U > 20 ms-1
ix=find((d.U>20) | (d.U<-20));
if ~isempty(ix)
    c.U(ix)=2;
end
clear ix

% -20 ms-1 < V > 20 ms-1
ix=find((d.V>20) | (d.V<-20));
if ~isempty(ix)
    c.V(ix)=2;
end
clear ix

% -5 ms-1 < W > 5 ms-1
ix=find((d.W>5) | (d.W<-5));
if ~isempty(ix)
    c.W(ix)=2;
end
clear ix
