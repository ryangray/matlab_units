%% Unit gallon_imperial
%
% See also: gallon_us, gallon

function gal = gallon_imperial

gal = unit_MAKE(4.54609 * liters, 'imperial_gallon','imp_gal'); % Weights and Measures Act of 1985
