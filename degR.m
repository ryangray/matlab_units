%% A Rankine temperature or degree in base temperature units
%% Usage
%  dT = T * degR
%  degR('absolutezero')
%  T = degR(temperature_in_degR)
%
% The delta temperature usage is the same as the unit Rdeg.
% When asking for absolute zero, it is returned in degrees R as 0.
%
% See also: degK, degC, degF, toDegR

function T = degR (T_R)

if nargin == 0
    
    T = Rdegree;
    
elseif ischar(T_R) && strcmpi(T_R,'absolutezero')
    
    T = 0;
    
else % degR value given

    % Convert absolute scale R to current absolute, then shift 
    % by current scale's zero.
    
    T = T_R * Rdegree + deg0;

end
