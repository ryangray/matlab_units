%% Convert a temperature in base or given temperature units to degrees Kelvin (K)
%% Usage
%
%  T_K = toDegK(T)
%
% T is in current units, and the result is the magnitude of that temperature
% converted to deg K.
%
%  T_K = toDegK(T, unit)
%
% T is a temparature magnitude in the units declared in unit, which is a
% character string indicating the units of the given temperature:
% 'F','C','K' or 'R' (not case sensitive). The result is the magnitude of
% that temperature converted to deg K.
%
% See also: toDegF, toDegC, toDegR, degK

function T_K = toDegK (T, unit)

if nargin > 1
    
    % T contains no units, but it is in units of |unit|. We use double(T)
    % in case it is a unitval object whose magnitude we are declaring to be
    % in the units given.
    
    switch lower(unit)
        
        case 'f'
            
            T_K = (double(T) - degF('absolutezero')) * Fdegree / Kdegree;
            
        case 'c'
            
            T_K = (double(T) - degC('absolutezero')) * Cdegree / Kdegree;
            
        case 'k'
            
            T_K = double(T);
            
        case 'r'
            
            T_K = (double(T) * Rdegree) / Kdegree;
            
        otherwise 
            
            error('Unknown temperature units %s', unit);
            
    end
    
else % given temp is in current units
    
    T_K = (T - deg0) / Kdegree;
    
end

