%% Unit nautical_mile (nmi)
%
% See also: nmile, nmi

function nautical_mile = unit 

nautical_mile = unit_MAKE(1852 * meter, 'nautical_mile', 'nmi'); % International Nautical Mile, NIST
