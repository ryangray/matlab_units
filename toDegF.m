%% Convert a temperature in base or given temperature units to degrees Fahrenheit (F)
%% Usage
%
%  T_F = toDegF(T)
%
% T is in current units, and the result is the magnitude of that temperature
% converted to deg F.
%
%  T_F = toDegF(T, unit)
%
% T is a temparature magnitude in the units declared in unit, which is a
% character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The result is the magnitude of
% that temperature converted to deg F.
%
% See also: toDegK, toDegC, toDegR, degF

function T_F = toDegF (T, unit)

if nargin > 1
    
    % T contains no units, but it is in units of |unit|. We use double(T)
    % in case it is a unitval object whose magnitude we are declaring to be
    % in the units given.
    
    switch lower(unit)
        
        case 'f'
            
            T_F = double(T);
            
        case 'c'
            
            T_F = (double(T) - degC('absolutezero')) * Cdegree / Fdegree + degF('absoluteZero');
            
        case 'k'
            
            T_F = (double(T) * Kdegree) / Fdegree + degF('absoluteZero');
            
        case 'r'
            
            T_F = (double(T) * Rdegree) / Fdegree + degF('absoluteZero');
            
        otherwise 
            
            error('Unknown temperature units %s', unit);
            
    end
    
else % given temp is in current units
    
    T_F = (T - deg0) / Fdegree + degF('absolutezero');

end

