%% Unit light-year
%
% See also: lightday, lighthour, lightminute, julian_year, c0

function ly = lightyear

ly = unit_MAKE(c0 * julian_year, 'lightyear', 'lightyear');
