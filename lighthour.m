%% Unit light-hour (distance)
%
% See also: lightyear, hour, c0

function lh = lighthour

lh = unit_MAKE(c0 * hour, 'lighthour', 'lighthour');
