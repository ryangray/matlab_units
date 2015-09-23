%% Unit A Rankine temperature or degree in base temperature units
%
% Absolute temperature unit in the english and customary systems.
%
% Note that only base temperature units of Kelvin or Rankine are supported
% as they are absolute scales. Values can be in F or C, but they will
% either be delta temperatures (Fdeg or Cdeg) or an absolute temperature
% being displayed in degF or degC.
%
%% Usage
%
%  dT = T * degR % a temperature change (should use Rdeg for better clarity)
%  degR('absolutezero') or degR('0') % returns double(0)
%  T = degR(temperature_in_degR) % convert from degR to current
%  T = degR(temperature, 'to') % convert from current to degR
%  fprintf('Temperature change is: %f R°\n', convert(dt,'RRdeg'); % Note unit is not degR
%
% The delta temperature usage is the same as the unit Rdeg.
% When asking for absolute zero, it is returned in degrees R as 0 (double).
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
% This converts the temperature value T that is in current units to the
% equivalent value in deg R as a magnitude with no units dimension. For
% example, degR(degK(273.15),'to') gives 491.67 (unitless).
%
% * degR('absolutezero') or degR('0')
%
% This gives the absolute zero point in deg R, which always returns 0
% (double) regardless of the base units or units class.
%
% See also: degK, degC, degF

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
    
elseif ~isempty(varargin) && strncmpi(varargin{1},'to',2)

    T = T_R / Rdegree; % In this case T_R is in current units
    
else % degR value given as a temperature (not a delta temperature)

    T = double(T_R) * Rdegree;

end
