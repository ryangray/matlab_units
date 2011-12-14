% prefix micro 10^-6
% Converts number to internal units by multplying by it 
% Converts number into micro by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function micro = prefix 

micro = unit_PREFIX(1.e-6,'micro','u');
