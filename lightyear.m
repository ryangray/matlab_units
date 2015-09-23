%% Unit lightyear
%
% See also: lightday, lighthour, lightminute, julian_year, c0

function lightyear = unit 

lightyear = unit_MAKE(c0 * julian_year, 'lightyear', 'lightyear');
