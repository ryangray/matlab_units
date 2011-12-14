% prefix peta 10^15
% Converts number to internal units by multplying by it 
% Converts number into centi by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function peta = prefix 

peta = unit_PREFIX(1.e+15,'peta','P');
