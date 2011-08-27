%% A temperature in base or given temperature units to degrees Kelvin (K)
%% Usage
%  T_K = toDegK(T)
%  T_K = toDegK(T, unit)
%
% unit is a character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The default is the current 
% temperature units.
%
% See also: toDegF, toDegC, toDegR, degK

function T_K = toDegK (T, unit)

if nargin > 1
    
    switch lower(unit)
        
        case 'f'
            
            abs0 = degF('absolutezero');
            uval = degF;
            
        case 'c'
            
            abs0 = degC('absolutezero');
            uval = degC;
            
        case 'k'
            
            T_K = T;
            return
            
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

T_K = (T - abs0) * uval / Kdegree;
