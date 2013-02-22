% prefix milli 10^-3
% Converts number to internal units by multplying by it 
% Converts number into milli by dividing value in internal units by it. 
% See also: yocto, zepto, atto, femto, pico, nano, micro, milli, centi, deci, deca, hecto, kilo, mega, giga, tera, peta, exa, zetta, yotta, kibi

function milli = prefix 

milli = unit_MAKE(1.e-3,'milli','m');
