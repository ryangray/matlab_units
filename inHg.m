%% Unit inHg = inches of mercury
%
% See also: mmHg

function iHg = inHg

iHg = unit_MAKE(inch/mm * mmHg, 'inches of mercury', 'inHg');
