%% A Celcius temperature or degree in base temperature units
%% Usage
%  dT = T * degC % scaling Cdegs to current (also Cdeg)
%  degC('absolutezero') or degC('0') % returns double(-273.15)
%  T = degC(temperature_in_degC) % convert from degC to current
%  T = degC(temperature, 'to') % convert from current to degC
%
% The delta temperature usage is the same as the unit Cdeg.
% When asking for absolute zero, it is returned in degrees C as -273.15.
%
% It is important to think about the unit dimensions, especially when using
% the object units as a base:
%
% * degC()
%
% This gives a value of 1 C degree with a unit dimension of temperature
% expressed in the current temparature units. This is the same as
% Cdegree(). Since Cdegree=Kdegree and Fdegree=Rdegree, then this value is
% really just scaled in size to either a Kdegree or an Rdegree. For a base
% of SI, 2*degC gives 2 (K).
%
% * degC(x)
%
% This declares that x (as a double value) is a temperature in deg C and it
% results in the equivalent temperature in the current units with a unit
% dimension of temperature. For a base of SI, degC(0) gives 273.15 (K).
%
% * degC(T, 'to')
%
% This is equivalent to calling toDegC(T) and converts the temperature
% value T that is in current units to the equivalent value in deg C as a
% magnitude with no units dimension. For a base of SI,
% degC(273.15*degK,'to') gives 0 regardless of the base units.
%
% * degC('absolutezero') or degC('0')
%
% This gives the absolute zero point in deg C, which always returns -273.15
% regardless of the base units. For absolute zero in the current units, use
% deg0.
%
% See also: degF, degK, degR, toDegC

function T = degC (T_C, varargin)

T0_C = -273.15;

if nargin == 0
    
    T = Cdegree;

elseif ischar(T_C)
    
    switch lower(T_C)
        
        case {'0','absolutezero'}
                
            T = T0_C;
            
        otherwise
            
            error('Invalid option: %s', T_C);
    end
    
elseif ~isempty(varargin) && strcmpi(varargin{1},'to')

    T = toDegC(T_C); % In this case T_C is in current units
    
else % degC value given

    % We use double(T_C) in case it is a unitval object whose magnitude we
    % are declaring to be a value in deg C.
    
    T = (double(T_C) - T0_C) * Kdegree + deg0;

end
