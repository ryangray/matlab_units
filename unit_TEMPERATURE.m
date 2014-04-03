%% Units kelvin in terms of base temperature 
%
% This is the base temperature definition for SI. To make a version for
% another base, change the value (1st parameter) for unit_MAKE to be the
% value of 1 Kelvin degree in the new system, and change the unit name and
% symbol (2nd and 3rd parameters). For a temperature base change, you
% should also create a version of deg0.m to set the value of absolute zero
% for the system.
%
% See also: unit_LENGTH, unit_TIME, unit_MASS, unit_TEMPERATURE,
% unit_LUMINANCE, unit_AMOUNT, unit_CURRENT, unit_INFORMATION, unit_MAKE

function kelvin = unit_TEMPERATURE (varargin)

if nargin == 0
    
    kelvin = unit_MAKE(1,'Kelvin','K','temperature');
        
elseif ischar(varargin{1}) 
    
    switch lower(varargin{1})
        
        case 'name'
    
            kelvin = 'Kelvin';
    
        case {'0','absolutezero','zero'}
    
            % Absolute zero in Kelvin
    
            kelvin = 0; % degK('absolutezero');

    end
    
end
