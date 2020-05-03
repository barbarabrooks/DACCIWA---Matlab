function [xyz]=rotate_to_earth_v2(d1,off)

%d1: data structure 
%off: offset angle


x=d1.xyz(:,1); y=d1.xyz(:,2);

[mws,mwd] = meanwind(x,y);
    
mwd=mwd-off;

ix=find(mwd<0);
if ~isempty(ix)
    mwd(ix)=mwd(ix)+360;
end
[u,v]=uandv(mws,mwd);
xyz(:,1)=u;,xyz(:,2)=v;xyz(:,3)=d1.xyz(:,3);

%w=d1.xyz(:,3);

