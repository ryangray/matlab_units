%% A Rankine temperature or degree in base temperature units
%% Usage
%  T = degR(T_R)
%  dT = T * degR
%  degR('absolutezero')
%
% The delta temperature usage is the same as the unit Rdeg.
% When asking for absolute zero, it is returned in degrees R as 0.

function T = degR (T_R)

if nargin == 0
    
    T = Rdegree;
    
elseif ischar(T_R) && strcmpi(T_R,'absolutezero')
    
    T = 0;
    
else

    % Convert absolute scale K to current absolute, then shift 
    % by current scale's zero.
    
    T = T_R * Rdegree + deg0;

end
