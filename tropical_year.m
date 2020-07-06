%% Unit tropical year (solar year)
% Time for the Sun to complete one orbit. A calendar_year is an
% approximation of this (365.2425) with leap years.
%
% Ref: Simon, J. L., P. Bretagnon, J. Chapront, M. Chapront-Touzé, 
% G. Francou and J. Laskar: "Numerical expressions for precession formulas 
% and mean elements for the moon and the planets". Astronomy and 
% Astrophysics 282, 663-683, 1994.
%
% See also: year, calendar_year, sidereal_year

function ty = tropical_year

ty = unit_MAKE(365.242190402 * day, 'tropical_year', 'yr_trop');
