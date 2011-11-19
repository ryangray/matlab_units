function r = mtimes (p, q)

% unitval/mtimes  Implement p * q for unitvals.
% unitval * unitval = value fields multiply, unit fields add.
% unitval * double  = value field times double with same units
% double * unitval = same as above

if isa(p,'unitval') && isa(q,'unitval')

    dims = unitval.dimensions;
    N = length(dims);

    r = unitval(double(p) * double(q));
    
    for jj = 1:N
        r.(dims{jj}) = p.(dims{jj}) + q.(dims{jj});
    end
    
elseif isa(p,'unitval')
    
    r = unitval(double(p) * q, p);
    
else
    
    r = unitval(p * double(q), q);
    
end
