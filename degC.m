%% A Celcius temperature or degree in base temperature units
%% Usage
%  dT = T * degC % scaling Cdegs to current (also Cdeg)
%  degC('absolutezero') or degC('0') % returns -273.15
%  T = degC(temperature_in_degC) % convert from degC to current
%  T = degC(temperature, 'to') % convert from current to degC
%
% The delta temperature usage is the same as the unit Cdeg.
% When asking for absolute zero, it is returned in degrees C as -273.15.
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

    % Convert by shifting C to absolute scale K. Convert that scale to current
    % absolute, then shift by current scale's zero.
    
    T = (T_C - T0_C) * Kdegree + deg0;

end
