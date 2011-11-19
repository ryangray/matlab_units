function r = rdivide (p,q)

% unitval/rdivide  Implement p ./ q for unitvals.
% unitval ./ unitval = value fields divide, unit fields subtract.
% unitval ./ double  = value field divided by double value, same units
% double ./ unitval = same as above

dims = unitval.dimensions;
N = length(dims);

if isa(p,'unitval') && isa(q,'unitval')

    r = unitval(double(p) ./ double(q));
    
    for jj = 1:N
        r.(dims{jj}) = p.(dims{jj}) - q.(dims{jj});
    end
    
elseif isa(p,'unitval')
    
    r = unitval(double(p) ./ q, p);
    
else
    
    r = unitval(p ./ double(q));
    
    for jj = 1:N
        r.(dims{jj}) = -q.(dims{jj});
    end
    
end
