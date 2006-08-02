% Unit parsec
% Converts number to internal units by multplying by it 
% Converts number into deg by dividing value in internal units by it. 
% See also: AU, ARCSECOND

function parsec = unit 

parsec = au / tan(arcsecond);
