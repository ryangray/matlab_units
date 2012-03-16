% plus  Implement p + q for unitvals.

function r = plus (p,q)

if isa(p,'unitval') && isa(q,'unitval')

    if sameDimensions(p,q)
        r = unitval(double(p) + double(q), p);
    else
        error('Values do not have the same units dimensions.');
    end
    
elseif isa(p,'unitval')

    if isa(q,'double') && q == 0
        
        r = p;
        
    else
        
        error('Right-hand side is not a units value');
        
    end
    
elseif isa(q,'unitval')

    if isa(p,'double') && p == 0
        
        r = q;
        
    else
        
        error('Left-hand side is not a units value');

    end
    
end

