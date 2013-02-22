% Units kelvin in terms of base temperature 

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
