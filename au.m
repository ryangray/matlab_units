%% Unit au (astronomical unit)
%
% See also: meters

function a = au

a = unit_MAKE(149597870700 * meter, 'astronomical_unit', 'au'); % Exact: IAU 2012, via Wikipedia
