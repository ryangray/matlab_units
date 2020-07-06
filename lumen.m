%% Unit lumen (lm = cd*sr) SI derived units of luminous flux
%
% The total quantity of visible light emitted by a source. Luminous flux
% ($\phi_v$) differs from power (radiant flux) in that radiant flux
% includes all electromagnetic waves emitted, while luminous flux is
% weighted according to a model of the human eye's sensitivity to various
% wavelengths.
%
% See also: lux, candela, steradian

function lm = lumen

lm = unit_MAKE(candela * steradian, 'lumen', 'lm');
