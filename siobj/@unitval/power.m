% power Implement p.^q for unitvals.
% Power can be a single value or array the same size as the number.
% Can be double or a unitless unitval.

function r = power (p,q)

if isa(q,'unitval')
    
    if isunitless(q)
        
        q = double(q);
        
    else
    
        error('Raise to a (non-unitless) unitval power is not supported');
    end
        
end

if numel(q) > 1 && numel(p) ~= numel(q)
    
    error('Can only raise a unitval to a scalar power or a matrix the same size as the unitval.');
    
end

r = unitval(double(p).^q);

dims = unitval.dimensions;
N = length(dims);

for jj = 1:N
    r.(dims{jj}) = p.(dims{jj}) * q;
end
