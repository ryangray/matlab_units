%% Unit erg (energy) = dyne * cm = 1e-7 J
%
% The CGS unit of energy.
%
% See also: joule, dyne, cm

function erg = unit

erg = unit_MAKE(1.0e-7 * joules, 'erg', 'erg');
