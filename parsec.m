%% Unit parsec (psc) = 1 au / tan(arcsecond)
%
% Astronomical unit of distance
%
% See also: au, arcsecond

function parsec = unit 

parsec = unit_MAKE(au / tan(arcsecond), 'parsec', 'parsec');
