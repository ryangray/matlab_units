%% Unit furlong
%
% Base unit of length in the FFF system.
% <http://en.wikipedia.org/wiki/FFF_system FFF System - Wikipedia>
%
% See also: statute_mile, feet, fortnight

function furlong = unit 

furlong = unit_MAKE(660 * feet, 'furlong', 'furlong');
