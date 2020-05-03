function kurt=kurtosis(x);
% kurt = kurtosis(x)
%
% calculates the Fisher kurtosis of data in an array x
%   Fisher Kurtosis: gaussian has kurtosis of 0
%     = Pearson kurtosis - 3 (where gaussian has P-kurtosis of 3)
%
%  F-Kurtosis > 0 -- distribution is (usually but not invariably) sharper than gaussian
%             < 0 -- distribution is flatter than gaussian
%
% IMB : 5th Jan 1995


N=length(x);
xbar=mean(x);
sigma=std(x);

% Fisher Kurtosis: gaussian has kurtosis of 0
%   = Pearson kurtosis - 3 (where gaussian has P-kurtosis of 3)
kurt=(1/N)*sum((x-xbar).^4)/sigma.^4 - 3; 

