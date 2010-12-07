% Unit galileo (Gal, acceleration)
% Converts number to internal units by multplying by it 
% Converts number into kgf by dividing value in internal units by it. 
% The cga system unit of acceleration: 1 cm per second per second.
% Not to be confused with the gallon (gal, lowercase), so there is not 
% a gal.m unit in this library.
% See also: cm, second
% References: <http://en.wikipedia.org/wiki/Gal_(acceleration) Wikipedia : Gal (unit)>

function galileo = unit

% cgs unit of acceleration

galileo = cm / second^2;
