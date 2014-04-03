%% Unit A Rankine temperature or degree in base temperature units
% Absolute temperature unit in the english and customary systems.
%% Usage
%  dT = T * degR % scaling Rdegs to current (also Rdeg)
%  degR('absolutezero') or degR('0') % returns double(0)
%  T = degR(temperature_in_degR) % convert from degR to current
%  T = degR(temperature, 'to') % convert from current to degR
%
% The delta temperature usage is the same as the unit Rdeg.
% When asking for absolute zero, it is returned in degrees R as 0.
%
% It is important to think about the unit dimensions, especially when using
% the object units as a base:
%
% * degR()
%
% This gives a value of 1 R degree with a unit dimension of temperature
% expressed in the current temparature units. This is the same as
% Rdegree(). Since Cdegree=Kdegree and Fdegree=Rdegree, then this value is
% really just scaled in size to either a Kdegree or an Rdegree. For a base
% of SI, 9*degR gives 5 (K).
%
% * degR(x)
%
% This declares that x (as a double value) is a temperature in deg R and it
% results in the equivalent temperature in the current units with a unit
% dimension of temperature. For a base of SI, degR(9) gives 5 (K).
%
% * degR(T, 'to')
%
% This is equivalent to calling toDegR(T) and converts the temperature
% value T that is in current units to the equivalent value in deg R as a
% magnitude with no units dimension. For a base of SI,
% degR(273.15*degK,'to') gives 491.67 regardless of the base units.
%
% * degR('absolutezero') or degR('0')
%
% This gives the absolute zero point in deg R, which always returns 0
% regardless of the base units. For absolute zero in the current units, use
% deg0.
%
% See also: degK, degC, degF, toDegR

function T = degR (T_R, varargin)

if nargin == 0
    
    T = Rdegree;
    
elseif ischar(T_R)
    
    switch lower(T_R)
        
        case {'0','absolutezero'}
                
            T = 0;
            
        otherwise
            
            error('Invalid option: %s', T_R);
    end
    
elseif ~isempty(varargin) && strcmpi(varargin{1},'to')

    T = toDegR(T_R); % In this case T_R is in current units
    
else % degR value given

    % We use double(T_R) in case it is a unitval object whose magnitude we
    % are declaring to be a value in deg R.
    
    T = double(T_R) * Rdegree + deg0;

end
