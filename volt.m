%% Unit volt (V)
%
% See also: watt, ampere

function V = volt

V = unit_MAKE(watt / ampere, 'volt', 'V');
