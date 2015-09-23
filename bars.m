%% Unit bar = 100 kPa
%
% Note: There is no bar.m in the units library because of the MATLAB
% plot function. There is not mb.m since there is already MB.m
%
% See also: kPa, torr, psia

function bar = unit 

bar = unit_MAKE(100000 * Pa, 'bar', 'bar');
