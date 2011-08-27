%% A Fahrenheit temperature or degree in base temperature units
%% Usage
%  T = degF(T_F)
%  dT = T * degF
%  degF('absolutezero')
%
% The delta temperature usage is the same as the unit Fdeg.
% When asking for absolute zero, it is returned in degrees F as -459.67.

function T = degF (T_F)

T0_F = -459.67;

if nargin == 0
    
    T = Fdegree;
    
elseif ischar(T_F) && strcmpi(T_F,'absolutezero')
    
    T = T0_F;
    
else

    % Convert by shifting F to absolute scale R. Convert that scale to current
    % absolute, then shift by current scale's zero.
    
    T = (T_F - T0_F) * Rdegree + deg0;

end
