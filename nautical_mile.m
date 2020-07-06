%% Unit nautical_mile (nmi)
%
% See also: nmile, nmi

function nmi = nautical_mile

nmi = unit_MAKE(1852 * meter, 'nautical_mile', 'nmi'); % International Nautical Mile, NIST
