%% Unit torr (Torr) = 1/760 th of a standard atmosphere
% See also: mmHg, Pa, bar, atm

function torr = unit 

torr = unit_MAKE(atm / 760, 'torr', 'torr');
