%% ne  Implement p ~= q for unitvals.
% Two unitvals must have the same unit dimensions. You can also compare a
% unitval to a double zero or a unitless unitval to a double.
%
% See also: unitval/eq

function r = ne (p,q)

if isa(p,'unitval') && isa(q,'unitval')

    if sameDimensions(p,q)
        r = double(p) ~= double(q);
    else
        error('Values do not have the same units dimensions.');
    end
    
elseif isa(p,'unitval')

    if isa(q,'double') && ~any(q(:))
        
        r = double(p) ~= 0;
        
    elseif isunitless(p)
        
        r = double(p) ~= q;
        
    else
        
        error('Right-hand side has no units');
    end
    
elseif isa(q,'unitval')

    if isa(p,'double') && ~any(p(:))
        
        r = 0 ~= double(q);
        
    elseif isunitless(q)
        
        r = p ~= double(q);
        
    else
        
        error('Left-hand side has no units');
    end
    
end

