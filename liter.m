%% Unit liter (L)
%
% One cubic decimeter. Originally, the volume of 1kg of water at standard
% temperature and pressure, but now no longer part of SI, although accepted
% for use with SI. -- Wikipedia
%
% Note: units('L') is supported.
%
% See also: ml, meter

function L = liter

L = unit_MAKE(1e-3 * meter^3, 'liter', 'L'); % exact definition
