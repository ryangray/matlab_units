% Units
% Prints the units system in use:  units
% Other usage gives the base dimensions:
%  units('length')
%  units('time')
%  units('mass')
%  etc.

function x = units (varargin)

if nargin == 0
    
    x = 'mks (si)';
    
else
    
    switch lower(varargin{1})
        
        case 'length'
            
            x = 'meter';
            
        case 'time'
            
            x = 'second';
            
        case 'mass'
            
            x = 'kilogram';
            
    end
    
end

