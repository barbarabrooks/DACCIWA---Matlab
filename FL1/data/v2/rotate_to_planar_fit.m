function [u,v,w,gamma] = rotate_to_planar_fit(um,vm,wm,CDt)
% [u,v,w,gamma] = rotate_to_planar_fit(um,vm,wm,CDt)
%               Rotates individual u,v,w components into a reference frame 
%               defined by planar fit, and with u aligned with direction of
%               mean wind for this run.
%
% um,vm,wm    : measured wind compenents in arbitrary reference frame
% CDt         : untilt matrix from planar fit
%
% u,v,w       : tilt corrected velocity compenents in vertically aligned
%               frame. u aligned with sonic x-axis
% gamma	      : orientation of mean wind wrt original reference frame x-axis
%               (NB this is vector direction...direction wind is TO)
%
% IMB : July 2006

% pre-allocate space for u,v,w arrays - makes this MUCH faster
u = ones(size(um))*NaN;
v = u; 
w= u;

for n = 1:length(um)
  UVW = CDt*[um(n);vm(n);wm(n)];
  u(n) = UVW(1);  % These wind components are now in a tilt-corrected
  v(n) = UVW(2);  % sonic-oriented reference frame with u aligned with
  w(n) = UVW(3);  % sonic's x-axis
end

% rotate u and v to axis aligned with mean wind for run.
% rotate_wind.m does this & returns a direction of mean wind as optional 
% output, gamma. NB direction is met convention (direction wind if FROM), and 
% assumes geophysical reference frame (u +ve east, v +ve north). 
% We want vector direction (dir TO) in sonic reference frame = 90+gamma

[u,v,gamma] = rotate_wind(u,v);
gamma = 90+gamma;
ii = gamma > 180;
gamma(ii) = 360-gamma(ii); % force to range +/- 180

