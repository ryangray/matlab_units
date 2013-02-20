% lt  Implement p < q for unitvals.

function r = lt (p,q)

if isa(p,'unitval') && isa(q,'unitval')

    if sameDimensions(p,q)
        r = double(p) < double(q);
    else
        error('Values do not have the same units dimensions.');
    end
    
elseif isa(p,'unitval')

    if isa(q,'double') && ~any(q(:))
        
        r = p < 0;
        
    elseif isunitless(p)
        
        r = double(p) < q;
        
    else
        
        error('Right-hand side has no units');
    end
    
elseif isa(q,'unitval')

    if isa(p,'double') && ~any(p(:))
        
        r = 0 < q;
        
    elseif isunitless(q)
        
        r = p < double(q);
        
    else
        
        error('Left-hand side has no units');
    end
    
end

