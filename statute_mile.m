%% Unit statute_mile (mi)
%
% See also: feet

function mi = statute_mile

mi = unit_MAKE(5280 * feet, 'statute_mile', 'mi');
