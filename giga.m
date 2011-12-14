% prefix giga 10^9
% Converts number to internal units by multplying by it 
% Converts number into giga by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function giga = prefix 

giga = unit_PREFIX(1.e+9,'giga','G');
