%% A Fahrenheit temperature or degree in base temperature units
%% Usage
%  dT = T * degF % scaling Fdegs to current (also Fdeg)
%  degF('absolutezero') or degF('0') % returns double(-459.67)
%  T = degF(temperature_in_degF) % convert from degF to current
%  T = degF(temperature, 'to') % convert from current to degF
%
% The delta temperature usage is the same as the unit Fdeg.
% When asking for absolute zero, it is returned in degrees F as -459.67.
%
% It is important to think about the unit dimensions, especially when using
% the object units as a base:
%
% * degF()
%
% This gives a value of 1 F degree with a unit dimension of temperature
% expressed in the current temparature units. This is the same as
% Fdegree(). Since Cdegree=Kdegree and Fdegree=Rdegree, then this value is
% really just scaled in size to either a Kdegree or an Rdegree. For a base
% of SI, 9*degF gives 5 (K).
%
% * degF(x)
%
% This declares that x (as a double value) is a temperature in deg F and it
% results in the equivalent temperature in the current units with a unit
% dimension of temperature. For a base of SI, degF(32) gives 273.15 (K).
%
% * degF(T, 'to')
%
% This is equivalent to calling toDegF(T) and converts the temperature
% value T that is in current units to the equivalent value in deg F as a
% magnitude with no units dimension. For a base of SI,
% degF(273.15*degK,'to') gives 32 regardless of the base units.
%
% * degF('absolutezero') or degF('0')
%
% This gives the absolute zero point in deg F, which always returns -459.67
% regardless of the base units. For absolute zero in the current units, use
% deg0.
%
% See also: degR, degC, degK, toDegF

function T = degF (T_F, varargin)

T0_F = -459.67;

if nargin == 0
    
    T = Fdegree;
    
elseif ischar(T_F)

    switch lower(T_F)
        
        case {'0','absolutezero'}
                
            T = T0_F;
            
        otherwise
            
            error('Invalid option: %s', T_F);
    end
    
elseif ~isempty(varargin) && strcmpi(varargin{1},'to')

    T = toDegF(T_F); % In this case T_F is in current units
    
else % degF value given

    % We use double(T_F) in case it is a unitval object whose magnitude we
    % are declaring to be a value in deg C.
    
    T = (double(T_F) - T0_F) * Rdegree + deg0;

end
