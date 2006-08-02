% Unit arcsecond
% Converts number to internal units by multplying by it 
% Converts number into deg by dividing value in internal units by it. 
% See also: DEG, ARCMINUTE

function arcsecond = unit 

arcsecond = deg / 3600; % defined as a fraction of a degree rather than arcminute / (minute/second)
