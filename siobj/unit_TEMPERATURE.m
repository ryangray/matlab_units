% Units kelvin in terms of base temerature 

function kelvin = unit_TEMPERATURE (varargin)

if nargin == 0
    
    kelvin = unitval(1,'temperature',1); % Kelvin degree
        
elseif ischar(varargin{1}) 
    
    switch lower(varargin{1})
        
        case 'name'
    
            kelvin = 'Kelvin';
    
        case {'0','absolutezero','zero'}
    
            % Absolute zero in Kelvin
    
            kelvin = unitval(0,'temperature',1); % degK('absolutezero');

    end
    
end
