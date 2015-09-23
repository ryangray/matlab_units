%% Unit mbar (millibar) = 100 Pa
%
% Note: There is no bar.m in the units library because of the MATLAB
% plot function. There is not mb.m since there is already MB.m
%
% See also: kPa, torr, psia

function mbar = unit 

mbar = unit_MAKE(100 * Pa, 'millibar', 'mbar'); % = 1 hPa
