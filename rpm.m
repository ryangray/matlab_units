%% Unit rpm (revolutions/minute)
%
% See also: hertz

function r = rpm

r = unit_MAKE(Hz / 60, 'rpm', 'rpm');
