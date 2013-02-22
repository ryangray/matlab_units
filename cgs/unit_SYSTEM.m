% Return the unit system name

function varargout = unit_SYSTEM

name = 'CGS (centimeter,gram,second)';

name = [name ' [' class(unit_TIME) ']'];

if nargout == 0
    
    disp(name);
    
else
    
    varargout = name;
    
end
