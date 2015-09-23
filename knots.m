%% Unit knots (kts) Nautical mile per hour
%
% There is no 'knot' unit as it conflicts with a Matlab demo, but
% unit('knot') supports it.
%
% See also: knots, kts

function knots = unit 

knots = unit_MAKE(nmiles / hour, 'knot', 'kts');
