%% Make a base unit value (object version)
% Non-object version just assigns the value.
% Object version creates a unitval and sets the name and symbol.

function unit = unit_MAKE (val, name, symbol, dim)

if nargin < 3

    unit = unitval(val, 'name',name);

elseif nargin < 4
    
    unit = unitval(val, 'name',name, 'symbol',symbol);
    
else
    
    unit = unitval(val, dim, 1, 'name',name, 'symbol',symbol);
    
end

