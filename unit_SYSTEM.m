% Return the unit system name

function varargout = unit_SYSTEM

name = ['SI (meter,kg,second) [' class(unit_TIME) ']'];

if nargout == 0
    
    disp(name);
    
else
    
    varargout = {name};
    
end
