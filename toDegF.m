%% A temperature in base or given temperature units to degrees Fahrenheit (F)
%% Usage
%  T_F = toDegF(T)
%  T_F = toDegF(T, unit)
%
% unit is a character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The default is the current 
% temperature units.
%
% See also: toDegK, toDegC, toDegR, degF

function T_F = toDegF (T, unit)

if nargin > 1
    
    switch lower(unit)
        
        case 'f'
            
            T_F = T;
            return
            
        case 'c'
            
            abs0 = degC('absolutezero');
            uval = degC;
            
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

T_F = (T - abs0) * uval / Fdegree + degF('absolutezero');
