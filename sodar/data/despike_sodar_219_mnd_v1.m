function [B1]=despike_sodar_219_mnd_v1(B1,err_code)

[dur,alt]=size(B1);

B1(:,1)=B1(:,1).*NaN;
B1(:,6)=B1(:,6).*NaN;
B1(:,8)=B1(:,8).*NaN;
B1(:,11)=B1(:,11).*NaN;
B1(:,17)=B1(:,17).*NaN;
B1(:,19)=B1(:,19).*NaN;

ix=find(err_code>7);
B1(ix)=B1(ix).*NaN;

for n=1:dur
    tp=B1(n,:);
    ix=find(~isnan(tp)==1);
    if length(ix)>2
        Y1=tp(ix);
        X1=ix;
        X2=1:alt;
        tp=interp1(X1,Y1,X2);
        B1(n,:)=tp;
    end
    clear ix tp
end    