function sk=skewk(x);
% sk = skew(x)
%
% calculates skewness of data in an array x
% IMB : 5th Jan 1995


N=length(x);
xbar=mean(x);
sigma=std(x);

sk=(1/N)*sum((x-xbar).^3)/sigma.^3;
