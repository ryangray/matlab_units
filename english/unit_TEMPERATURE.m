% Units kelvin in terms of base temperature 

function kelvin = unit_TEMPERATURE (varargin)

if nargin == 0
    
    kelvin = unit_MAKE(9/5,'rankine','°R','temperature');
        
elseif ischar(varargin{1}) 
    
    switch lower(varargin{1})
        
        case 'name'
    
            kelvin = 'rankine';
    
        case {'0','absolutezero','zero'}
    
            % Absolute zero in Rankine
    
            kelvin = 0; % degR('absolutezero')

    end
    
end
