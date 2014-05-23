%% Unit A Kelvin temperature or degree in base temperature units
%% Usage
%  dT = T * degK % scaling Kdegs to current (also Kdeg)
%  degK('absolutezero') or degK('0') % returns double(0)
%  T = degK(temperature_in_degK) % convert from degK to current
%  T = degK(temperature, 'to') % convert from current to degK
%
% The delta temperature usage is the same as the unit Kdeg.
% When asking for absolute zero, it is returned in degrees K as 0.
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
% This is equivalent to calling toDegK(T) and converts the temperature
% value T that is in current units to the equivalent value in deg K as a
% magnitude with no units dimension. For a base of SI,
% degK(491.67*degR,'to') gives 273.15 regardless of the base units.
%
% * degK('absolutezero') or degK('0')
%
% This gives the absolute zero point in deg K, which always returns 0
% regardless of the base units. For absolute zero in the current units, use
% deg0.
%
% See also: degR, degC, degF, toDegK

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

    T = toDegK(T_K); % In this case T_K is in current units
    
else % degK value given

    % We use double(T_K) in case it is a unitval object whose magnitude we
    % are declaring to be a value in deg K.
    
    T = double(T_K) * Kdegree + deg0;

end
