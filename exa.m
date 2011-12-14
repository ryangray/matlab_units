% prefix exa 10^18
% Converts number to internal units by multplying by it 
% Converts number into centi by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function exa = prefix 

exa = unit_PREFIX(1.e+18,'exa','E');
