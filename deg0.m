%% Absolute Zero temperature in base temperature units
%
% Obsolete: was used for returning the absolute zero temperature value in
% the current base, but since C or F will not be supported, this is no
% longer needed, so you should remove it from your expressions.

function T = deg0

T = 0 * unit_TEMPERATURE;

warning('deg0 is obsolete; you should remove it from your expressions. It is always zero now since C or F bases are not supported.');
