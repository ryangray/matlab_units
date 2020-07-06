%% Unit calendar year = 365.2425 * days
%
% See also: year, solar_year

function yr = calendar_year

yr = unit_MAKE(365.2425 * day, 'calendar_year', 'yr_cal'); 
