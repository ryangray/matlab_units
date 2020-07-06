%% Unit parsec (psc) = 1 au / tan(arcsecond)
%
% Astronomical unit of distance
%
% See also: au, arcsecond

function pc = parsec

pc = unit_MAKE(au / tan(arcsecond), 'parsec', 'pc');
