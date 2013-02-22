% prefix tera 10^12
% Converts number to internal units by multplying by it 
% Converts number into tera by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function tera = prefix 

tera = unit_MAKE(1.e+12,'tera','T');
