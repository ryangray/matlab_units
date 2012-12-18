%% A Fahrenheit temperature or degree in base temperature units
%% Usage
%  dT = T * degF % scaling Fdegs to current (also Fdeg)
%  degF('absolutezero') or degF('0') % returns -459.67
%  T = degF(temperature_in_degF) % convert from degF to current
%  T = degF(temperature,'to') % convert from current to degF
%
% The delta temperature usage is the same as the unit Fdeg.
% When asking for absolute zero, it is returned in degrees F as -459.67.
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

    % Convert by shifting F to absolute scale R. Convert that scale to current
    % absolute, then shift by current scale's zero.
    
    T = (T_F - T0_F) * Rdegree + deg0;

end
