% prefix atto 10^-18
% Converts number to internal units by multplying by it 
% Converts number into pico by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function atto = prefix 

atto = unit_MAKE(1.e-18,'atto','a');
