%% Unit bar = 100 kPa
%
% Note: There is no bar.m in the units library because of the MATLAB
% plot function.
%
% See also: mbar, kPa, torr, psia

function b = bars

b = unit_MAKE(100000 * Pa, 'bar', 'bar');
