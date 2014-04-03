%% Units ampere in terms of base current unit
%
% This is the base current definition for SI. To make a version for another
% base, change the value (1st parameter) for unit_MAKE to be the value of 1
% ampere in the new system, and change the unit name and symbol (2nd and
% 3rd parameters).
%
% See also: unit_LENGTH, unit_TIME, unit_MASS, unit_TEMPERATURE,
% unit_LUMINANCE, unit_AMOUNT, unit_CURRENT, unit_INFORMATION, unit_MAKE

function ampere = unit_CURRENT

ampere = unit_MAKE(1,'ampere','A','current');
