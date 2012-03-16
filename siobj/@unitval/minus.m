% minus  Implement p - q for unitvals.

function r = minus (p,q)

if isa(p,'unitval') && isa(q,'unitval')

    if sameDimensions(p, q)
        r = unitval(double(p) - double(q), p);
    else
        error('Values do not have the same units dimensions.');
    end
    
elseif isa(p,'unitval')
    
    error('Right-hand side is not a units value');
    
elseif isa(q,'unitval')
    
    error('Left-hand side is not a units value');
    
end
