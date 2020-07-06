%% Unit atm (atmosphere) 1 standard atmosphere = 101325 Pa
%
% See also: kPa, Pa

function a = atm

a = unit_MAKE(1.01325E+05 * Pa, 'atmosphere', 'atm');
