%% A Kelvin temperature or degree in base temperature units
%% Usage
%  T = degK(T_K)
%  dT = T * degK
%  degK('absolutezero')
%
% The delta temperature usage is the same as the unit Kdeg.
% When asking for absolute zero, it is returned in degrees K as 0.

function T = degK (T_K)

if nargin == 0
    
    T = Kdegree;
    
elseif ischar(T_K) && strcmpi(T_K,'absolutezero')
    
    T = 0;
    
else

    % Convert absolute scale K to current absolute, then shift 
    % by current scale's zero.
    
    T = T_K * Kdegree + deg0;

end
