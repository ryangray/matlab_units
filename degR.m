%% A Rankine temperature or degree in base temperature units
%% Usage
%  dT = T * degR % scaling Rdegs to current (also Rdeg)
%  degR('absolutezero') or degR('0') % returns 0
%  T = degR(temperature_in_degR) % convert from degR to current
%  T = degR(temperature, 'to') % convert from current to degR
%
% The delta temperature usage is the same as the unit Rdeg.
% When asking for absolute zero, it is returned in degrees R as 0.
%
% See also: degK, degC, degF, toDegR

function T = degR (T_R, varargin)

if nargin == 0
    
    T = Rdegree;
    
elseif ischar(T_R)
    
    switch lower(T_R)
        
        case {'0','absolutezero'}
                
            T = 0;
            
        otherwise
            
            error('Invalid option: %s', T_R);
    end
    
elseif ~isempty(varargin) && strcmpi(varargin{1},'to')

    T = toDegR(T_R); % In this case T_R is in current units
    
else % degR value given

    % Convert absolute scale R to current absolute, then shift 
    % by current scale's zero.
    
    T = T_R * Rdegree + deg0;

end
