%% Unit torr (Torr) = 1/760 th of a standard atmosphere
% See also: mmHg, Pa, bar, atm

function t = torr

t = unit_MAKE(atm / 760, 'torr', 'torr');
