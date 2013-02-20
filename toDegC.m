%% Convert a temperature in base or given temperature units to degrees Celcius (C)
%% Usage
%
%  T_C = toDegC(T)
%
% T is in current units, and the result is the magnitude of that temperature
% converted to deg C.
%
%  T_C = toDegC(T, unit)
%
% T is a temparature magnitude in the units declared in unit, which is a
% character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The result is the magnitude of
% that temperature converted to deg C.
%
% See also: toDegK, toDegF, toDegR, degC

function T_C = toDegC (T, unit)

if nargin > 1
    
    % T contains no units, but it is in units of |unit|. We use double(T)
    % in case it is a unitval object whose magnitude we are declaring to be
    % in the units given.
    
    switch lower(unit)
        
        case 'f'
            
            T_C = (double(T) - degF('absolutezero')) * Fdegree / Cdegree + degC('absoluteZero');
            
        case 'c'
            
            T_C = double(T);
            
        case 'k'
            
            T_C = (double(T) * Kdegree) / Cdegree + degC('absoluteZero');
            
        case 'r'
            
            T_C = (double(T) * Rdegree) / Cdegree + degC('absoluteZero');
            
        otherwise 
            
            error('Unknown temperature units %s', unit);
            
    end
    
else % given temp is in current units
    
    T_C = (T - deg0) / Cdegree + degC('absoluteZero');
    
end
