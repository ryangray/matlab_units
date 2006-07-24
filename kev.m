% Unit kev (kilo electron Volt)
% Converts number to internal units by multplying by it 
% Converts number into keV by dividing value in internal units by it. 
% Note this is the approximate value given by NIST. The real value must be
% determined by experiment.
% See also: EV

function kev = unit

kev =  kilo * ev;
