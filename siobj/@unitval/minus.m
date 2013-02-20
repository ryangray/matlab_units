% minus  Implement p - q for unitvals.

function r = minus (p,q)

if isa(p,'unitval') && isa(q,'unitval')

    if sameDimensions(p, q)
        r = unitval(double(p) - double(q), p);
    else
        error('Values do not have the same units dimensions.');
    end
    
elseif isa(p,'unitval')
    
    if isa(q,'double') && q == 0
        
        r = p;
        
    elseif isunitless(p)
        
        r = unitval(double(p) - q, p);
        
    else
        
        error('Right-hand side has no units');
    end
    
elseif isa(q,'unitval')
    
    if isa(p,'double') && p == 0
        
        r = q;
        
    elseif isunitless(q)
        
        r = unitval(p - double(q), q);
        
    else
        
        error('Left-hand side has no units');
    end
    
end
