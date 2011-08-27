%% A temperature in base temperature units to degrees Rankine (R)
%% Usage
%  T_R = toDegR(T)
%  T_R = toDegR(T, unit)
%
% unit is a character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The default is the current 
% temperature units.
%
% See also: toDegF, toDegC, toDegK, degR


function T_R = toDegR (T, unit)

if nargin > 1
    
    switch lower(unit)
        
        case 'f'
            
            abs0 = degF('absolutezero');
            uval = degF;
            
        case 'c'
            
            abs0 = degC('absolutezero');
            uval = degC;
            
        case 'k'
            
            abs0 = 0;
            uval = degK;
            
        case 'r'
            
            T_R = T;
            return
            
        otherwise 
            
            error('Unknown temperature units %s', unit);
            
    end
    
else % given temp is in current units
    
    abs0 = deg0;
    uval = 1;
    
end

T_R = (T - abs0) * uval / Rdegree;
