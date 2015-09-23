%% Unit volt (V)
%
% See also: watt, ampere

function volt = unit 

volt = unit_MAKE(watt / ampere, 'volt', 'V');
