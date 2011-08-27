%% A temperature in base or given temperature units to degrees Celcius (C)
%% Usage
%  T_C = toDegC(T)
%  T_C = toDegC(T, unit)
%
% unit is a character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The default is the current 
% temperature units.
%
% See also: toDegK, toDegF, toDegR, degC

function T_C = toDegC (T, unit)

if nargin > 1
    
    switch lower(unit)
        
        case 'f'
            
            abs0 = degF('absolutezero');
            uval = degF;
            
        case 'c'
            
            T_C = T;
            return
            
        case 'k'
            
            abs0 = 0;
            uval = degK;
            
        case 'r'
            
            abs0 = 0;
            uval = degR;
            
        otherwise 
            
            error('Unknown temperature units %s', unit);
            
    end
    
else % given temp is in current units
    
    abs0 = deg0;
    uval = 1;
    
end

T_C = (T - abs0) * uval / Cdegree + degC('absoluteZero');
