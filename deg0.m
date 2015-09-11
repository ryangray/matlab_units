%% Absolute Zero temperature in base temperature units
%
% This function will be overridden in base systems that use a different
% base temperature. for example, in a degC base, this would be
% -273.15*Kdegree.
%
% A useful expression is T_absolute = T - deg0, which converts temperature
% T that is in current temperature units to an absolute temperature. If
% current units are degK, or degR, then deg0 equals zero.

function T = deg0

T = unit_TEMPERATURE('0');
