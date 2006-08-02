% Unit arcminute
% Converts number to internal units by multplying by it 
% Converts number into deg by dividing value in internal units by it. 
% See also: DEG, ARCSECOND

function arcminute = unit 

arcminute = deg / 60; % defined as a fraction of a degree rather than deg / (hour/minute)
