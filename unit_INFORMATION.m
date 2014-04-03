%% Unit bit in terms of base information unit
%
% This is the base information definition. To make a version for another
% base, change the value (1st parameter) for unit_MAKE to be the value of 1
% bit in the new system, and change the unit name and symbol (2nd and 3rd
% parameters).
%
% See also: unit_LENGTH, unit_TIME, unit_MASS, unit_TEMPERATURE,
% unit_LUMINANCE, unit_AMOUNT, unit_CURRENT, unit_INFORMATION, unit_MAKE
%
% If you defined this as = 8, then your base would be in bytes since byte =
% 8 * bit = 8 * unit_INFORMATION

function bit = unit_INFORMATION

bit = unit_MAKE(1,'bit','b','info');
