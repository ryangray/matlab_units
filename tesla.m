%% Unit tesla (T), SI derived unit of magnetic flux density
% tesla = weber / m^2
% Note: units('T') is supported.
%
% See also: weber

function T = tesla

T = unit_MAKE(weber / meter^2, 'tesla', 'T');
