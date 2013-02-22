% prefix hecto 10^2
% Converts number to internal units by multplying by it 
% Converts number into centi by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function hecto = prefix 

hecto = unit_MAKE(100,'hecto','h');
