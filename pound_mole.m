%% Unit pound_mole (lb-mol)
% The number of entities in 12 lb of carbon-12. One lb-mol is equal to
% 453.59237 mol. <http://en.wikipedia.org/wiki/Pound_mole#Other_units_called_.22mole.22 Wikipedia>
%
% See also: mole, pound

function p = pound_mole

p = unit_MAKE(453.59237 * mole, 'pound_mole', 'pound_mole');
