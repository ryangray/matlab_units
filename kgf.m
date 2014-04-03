%% Unit kgf (kilogram-force) = kgm * g0
% This unit is not actually part of the SI unit set.
% The familiar conversion of kg = lb * 2.2 is actually kgm = lbm * 2.2
%
% See also: kg, lbm, slug, lbf, kgm
%
% References: <http://en.wikipedia.org/wiki/Kilogram-force Wikipedia : Kilogram-force>

function kgf = unit

kgf = kg * g0; % f = m*a
