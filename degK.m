%% A Kelvin temperature or degree in base temperature units
%% Usage
%  dT = T * degK % scaling Kdegs to current (also Kdeg)
%  degK('absolutezero') % returns 0
%  T = degK(temperature_in_degK) % convert from degK to current
%  T = degK(temperature, 'to') % convert from current to degK
%
% The delta temperature usage is the same as the unit Kdeg.
% When asking for absolute zero, it is returned in degrees K as 0.
%
% See also: degR, degC, degF, toDegK

function T = degK (T_K, varargin)

if nargin == 0
    
    T = Kdegree;
    
elseif ischar(T_K) && strcmpi(T_K,'absolutezero')
    
    T = 0;
    
elseif ~isempty(varargin) && strcmpi(varargin{1},'to')

    T = toDegK(T_K); % In this case T_K is in current units
    
else % degK value given

    % Convert absolute scale K to current absolute, then shift 
    % by current scale's zero.
    
    T = T_K * Kdegree + deg0;

end
