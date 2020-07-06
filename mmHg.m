%% Unit mmHg (millimeters of Mercury) = 101325/760 * Pa
%
% Ref: BS 350: Part 1: 1974 - Conversion factors and tables. British
% Standards Institution. 1974. p. 49.
%
% See also: torr, kPa, Pa, atm

function m = mmHg

m = unit_MAKE(133.322387415 * Pa, 'millimeters_mercury', 'mmHg');
