% prefix nano 10^-9
% Converts number to internal units by multplying by it 
% Converts number into pico by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function nano = prefix 

nano = unit_PREFIX(1.e-9,'nano','n');
