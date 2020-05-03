function [u,v,w,theta,phi,psi] = rotate_to_run_v2(um,vm,wm,doroll)
% [u,v,w,theta,phi,psi] = rotate_to_run(um,vm,wm,doroll)
% Rotates u,v,w wind components into a mean streamline coordinate system
% for a single run.
%
% INPUTS
% um, vm, wm  : measured wind components in sonic reference frame
% doroll      : 1 or 0 (yes or no) (default = 0)
%               Do we do a 3rd rotation so that <w'v> = 0?
%               This can produce odd orientations for z-axis. NOT applying
%               this rotation leaves z-axis aligned close to that expected 
%               for a nominally vertical sonic
%
% u,v,w       : wind components in streamline oriented reference frame
% theta       : angle of rotation um-to-vm (anticlockwise or righthanded)
%               to align u with mean wind (degrees)
% phi         : tilt angle (+ve tilts x-axis upwards) to align streamline
%               x-axis with mean streamline and force <w>=0
% psi         : roll angle about x-axis to required to force <w'v'>=0
%               defaults to zero unless doroll=1
%
% references:
%  Wilczak et al. 2001: sonic anemometer tilt corrections. BLM, 99, 127-150
%  (but beware typos in equations)
%  Kaimal & Finnigan, 1994: Atmospheric Boundary Layer Flows: Their
%  Structure and Measurement. Oxford University Press
%  van Dijk et al. 2004: The principles of surface flux physics: theory,
%  practice and description of the ECPACK library
%  www.met.wau.nl/projects/jep
%
% IMB July 2006

if nargin < 4
  doroll = 0;
  psi = 0;
end

% First rotate to align x-axis with mean wind direction in sonic's
% reference frame

theta=atan2(mean(vm),mean(um));
u1 = um*cos(theta) + vm*sin(theta);
v1 = -um*sin(theta) + vm*cos(theta);
w1 = wm;
clear um vm wm

% Next rotate u and w so that streamline x-axis lies along mean streamline and 
% mean(w) is zero

phi = atan2(mean(w1),mean(u1));
u2 = u1*cos(phi) + w1*sin(phi);
v2 = v1;
w2=  -u1*sin(phi) + w1*cos(phi);
clear u1 v1 w1

% Finally rotate v and w so that the cross-wind stress <w'v'> = 0
% do this ONLY if requested

if doroll
  wprime = w2-mean(w2);
  vprime = v2-mean(v2);
  psi = 0.5*atan2(2*mean(wprime.*vprime),...
              (mean(vprime.^2) - mean(wprime.^2)) );

  u = u2;
  v = v2*cos(psi) + w2*sin(psi);
  w = -v2*sin(psi) + w2*cos(psi);
  
  psi = psi*180/pi;
else
  u = u2;
  v = v2;
  w = w2;
end

theta = theta*180/pi;
phi = phi*180/pi;
