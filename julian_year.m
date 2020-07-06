%% Unit Julian year = 365.25 * days
% Astronomical unit
%
% See also: calendar_year, tropical_year

function jy = julian_year

jy = unit_MAKE(365.25 * day, 'julian_year', 'yr_jul');
