%% Unit Pa (Pascal) = N/m^2
%
% Note: There is no pascal.m in the units library because of the MATLAB
% matrix function pascal.
%
% See also: kPa, torr, psia

function pascal = Pa

pascal = unit_MAKE(newton / meter^2, 'pascal', 'Pa');
