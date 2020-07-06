%% Unit ohm = volt / amp
%
% See also: volt, ampere

function o = ohm

o = unit_MAKE(volt / ampere, 'ohm', [char(3) char(169)]); % &#937;
