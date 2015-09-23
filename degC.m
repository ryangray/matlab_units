%% Unit A Celcius temperature or degree in base temperature units
%
% Note that only base temperature units of Kelvin or Rankine are supported
% as they are absolute scales. Values can be in F or C, but they will
% either be delta temperatures (Fdeg or Cdeg) or an absolute temperature
% being displayed in degF or degC.
%
%% Usage
%
%  dT = T * degC % a temperature change (should use Cdeg for better clarity)
%  degC('absolutezero') or degC('0') % returns double(-273.15)
%  T = degC(temperature_in_degC) % convert from degC to current
%  T = degC(temperature, 'to') % convert from current to degC
%  fprintf('Temperature change is: %f C°\n', convert(dt,'Cdeg'); % Note unit is not degC
%
% The delta temperature usage is the same as the unit Cdeg.
% When asking for absolute zero, it is returned in degrees C as -273.15 (double).
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
% This converts the temperature value T that is in current units to the
% equivalent value in deg C as a magnitude with no units dimension. For
% example, degC(degK(273.15),'to') gives 0 (unitless).
%
% * degC('absolutezero') or degC('0')
%
% This gives the absolute zero point in deg C, which always returns -273.15
% (double) regardless of the base units or units class.
%
% See also: degF, degK, degR

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
    
elseif ~isempty(varargin) && strncmpi(varargin{1},'to',2)

    T = T_C / Cdegree + T0_C; % In this case T_C is in current units
    
else % degC value given as a temperature (not a delta temperature)

    T = unit_MAKE((double(T_C) - T0_C) * Kdegree, 'celcius', '°C');

end
