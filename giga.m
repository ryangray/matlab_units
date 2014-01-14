% prefix giga 10^9
% Converts number to internal units by multplying by it 
% Converts number into giga by dividing value in internal units by it. 
% See also: gibi, yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta

function giga = prefix 

giga = unit_MAKE(1.e+9,'giga','G');
