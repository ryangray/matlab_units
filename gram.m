%% Unit gram (g)
%
% The unit_ALIASES supports 'g' which is gram and NOT g0 or gee
%
% See also: kilogram, g0

function g = gram

g = unit_MAKE(milli * kg, 'gram', 'g');
