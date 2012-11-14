%% A Fahrenheit temperature or degree in base temperature units
%% Usage
%  dT = T * degF
%  degF('absolutezero')
%  T = degF(temperature_in_degF)
%
% The delta temperature usage is the same as the unit Fdeg.
% When asking for absolute zero, it is returned in degrees F as -459.67.
%
% See also: degR, degC, degK, toDegF

function T = degF (T_F)

T0_F = -459.67;

if nargin == 0
    
    T = Fdegree;
    
elseif ischar(T_F) && strcmpi(T_F,'absolutezero')
    
    T = T0_F;
    
else % degF value given

    % Convert by shifting F to absolute scale R. Convert that scale to current
    % absolute, then shift by current scale's zero.
    
    T = (T_F - T0_F) * Rdegree + deg0;

end
