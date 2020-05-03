function T = Ts_sidewind_correction_v2(Ts,u,v,w,model)
% T = Ts_sidewind_correction(Ts,u,v,w,model)
% 
%     Correct contamination of sonic temperature measurement for lengthening of
%     sonic path by sidewind. 
%
% INPUTS
%  Ts    : sonic temperature (K)
%  u,v,w : wind components in sonic measurement frame (before any rotations,
%          motion correction, etc) (m/s)
%  model : sonic anemometer model 'gill','metek'
%          NB later model Gill's do correction internally (R3, R3A), don't
%          do it again!
%
% OUTPUT
%  T     : corrected temperature (K)
%
%     Correction follows van Dijk et al. 2004: The
%     principles of surface flux physics: theory, practice and description of
%     the ECPACK library (www.met.wau.nl/projects/jep). See also: Liu et al.
%     2001: BLM, 100, 459-468, and Schotanus et al. 1983: BLM, 26, 81-93.
%
% IMB : July 2007


%switch lower(model) % ensure lower case)
  %case 'gill'
    %vn2 = (3/4)*(u.^2 + v.^2) + 0.5*w.^2;
  %case 'metek'
    vn2 = (3/4)*(u.^2 + v.^2) + 0.5*w.^2;
    %return;
%end

T = Ts + vn2/403;