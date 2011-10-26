function r = minus (p,q)

% unitval/minus  Implement p - q for unitvals.

if isa(p,'unitval') && isa(q,'unitval')

    if sameDimensions(p, q)
        r = p;
        r.value = p.value - q.value;
    else
        error('Values do not have the same units dimensions.');
    end
    
elseif isa(p,'unitval')
    
    error('Right-hand side is not a units value');
    
elseif isa(q,'unitval')
    
    error('Left-hand side is not a units value');
    
end
