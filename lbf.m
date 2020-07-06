%% Unit lbf (pound force) =  lbm * g0
%
% See also: lbm, slug, lbf, kgf, kgm

function p = lbf

p = unit_MAKE(lbm * g0, 'pound_force', 'lbf');
