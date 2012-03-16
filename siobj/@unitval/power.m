% power Implement p.^q for unitvals.
% Only support plain power values -- not unitval powers
% Power can be a single value or the same size as the number.
% UNTESTED

function r = power (p,q)

if isa(q,'unitval')
    
    error('Raise to unitval power is not supported');
    
end

if numel(p) ~= numel(q) || numel(q) > 1
    
    error('Can only raise unitval to scalar power or a matrix the same size as the unitval.');
    
end

r = unitval(double(p).^q);

dims = unitval.dimensions;
N = length(dims);

for jj = 1:N
    r.(dims{jj}) = p.(dims{jj}) * q;
end
