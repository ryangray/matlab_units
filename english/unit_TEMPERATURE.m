% Units kelvin in terms of base temerature 

function kelvin = unit_TEMPERATURE (varargin)

if nargin == 0
    
    kelvin = 9/5; % Rankine degrees
        
elseif ischar(varargin{1}) 
    
    switch lower(varargin{1})
        
        case 'name'
    
            kelvin = 'Rankine';
    
        case {'0','absolutezero','zero'}
    
            % Absolute zero in Rankine
    
            kelvin = 0; % degR('absolutezero')

    end
    
end
