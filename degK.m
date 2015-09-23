%% Unit A Kelvin temperature or degree in base temperature units
%
% Note that only base temperature units of Kelvin or Rankine are supported
% as they are absolute scales. Values can be in F or C, but they will
% either be delta temperatures (Fdeg or Cdeg) or an absolute temperature
% being displayed in degF or degC.
%
%% Usage
%
%  dT = T * degK % a temperature change (should use Kdeg for better clarity)
%  degK('absolutezero') or degK('0') % returns double(0)
%  T = degK(temperature_in_degK) % convert from degK to current
%  T = degK(temperature, 'to') % convert from current to degK
%  fprintf('Temperature change is: %f K\n', convert(dt,'Kdeg'); % Note unit is not degK
%
% The delta temperature usage is the same as the unit Kdeg.
% When asking for absolute zero, it is returned in degrees K as 0 (double).
%
% It is important to think about the unit dimensions, especially when using
% the object units as a base:
%
% * degK()
%
% This gives a value of 1 K degree with a unit dimension of temperature
% expressed in the current temparature units. This is the same as
% Kdegree(). Since Cdegree=Kdegree and Fdegree=Rdegree, then this value is
% really just scaled in size to either a Kdegree or an Rdegree. For a base
% of SI, 2*degK gives 2 (K).
%
% * degK(x)
%
% This declares that x (as a double value) is a temperature in deg K and it
% results in the equivalent temperature in the current units with a unit
% dimension of temperature. For a base of SI, degK(10) gives 10 (K).
%
% * degK(T, 'to')
%
% This converts the temperature value T that is in current units to the
% equivalent value in deg K as a magnitude with no units dimension. For
% example, degK(degR(491.67),'to') gives 273.15 (unitless).
%
% * degK('absolutezero') or degK('0')
%
% This gives the absolute zero point in deg K, which always returns 0
% (double) regardless of the base units or units class.
%
% See also: degR, degC, degF

function T = degK (T_K, varargin)

if nargin == 0
    
    T = Kdegree;
    
elseif ischar(T_K)

    switch lower(T_K)
        
        case {'0','absolutezero'}
                
            T = 0;
            
        otherwise
            
            error('Invalid option: %s', T_K);
    end
    
elseif ~isempty(varargin) && strncmpi(varargin{1},'to',2)

    T = T_K / Kdegree; % In this case T_K is in current units
    
else % degK value given as a temperature (not a delta temperature)

    T = double(T_K) * Kdegree;

end
