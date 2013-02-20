%% Convert a temperature in base or given temperature units to degrees Rankine (R)
%% Usage
%
%  T_R = toDegR(T)
%
% T is in current units, and the result is the magnitude of that temperature
% converted to deg R.
%
%  T_R = toDegR(T, unit)
%
% T is a temparature magnitude in the units declared in unit, which is a
% character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The result is the magnitude of
% that temperature converted to deg R.
%
% See also: toDegF, toDegC, toDegK, degR


function T_R = toDegR (T, unit)

if nargin > 1
    
    % T contains no units, but it is in units of |unit|. We use double(T)
    % in case it is a unitval object whose magnitude we are declaring to be
    % in the units given.
    
    switch lower(unit)
        
        case 'f'
            
            T_R = (double(T) - degF('absolutezero')) * Fdegree / Rdegree;
            
        case 'c'
            
            T_R = (double(T) - degC('absolutezero')) * Cdegree / Rdegree;
            
        case 'k'
            
            T_R = (double(T) * Kdegree) / Rdegree;
            
        case 'r'
            
            T_R = double(T);
            
        otherwise 
            
            error('Unknown temperature units %s', unit);
            
    end
    
else % given temp is in current units
    
    T_R = (T - deg0) / Rdegree;
    
end

