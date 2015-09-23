%% Units candela in terms of base luminance 
%
% This is the base luminance definition for SI. To make a version for
% another base, change the value (1st parameter) for unit_MAKE to be the
% value of 1 candela in the new system, and change the unit name and symbol
% (2nd and 3rd parameters).
%
% See also: unit_LENGTH, unit_TIME, unit_MASS, unit_TEMPERATURE,
% unit_LUMINANCE, unit_AMOUNT, unit_CURRENT, unit_INFORMATION, unit_MAKE

function candela = unit_LUMINANCE

candela = unit_MAKE(1,'candela','cd','luminance');
