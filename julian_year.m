%% Unit Julian year = 365.25 * days
% Astronomical unit
%
% See also: calendar_year, tropical_year

function julian_year = unit 

julian_year = unit_MAKE(365.25 * day, 'julian_year', 'yr_jul');
