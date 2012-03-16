% mpower  Implement p^q for unitvals.
% Only support double power values -- not unitval powers
% Only supports a single power value.
% UNTESTED

function r = mpower (p,q)

if isa(q,'unitval')
    
    error('Raise to unitval power is not supported');
    
end

if numel(q) > 1
    
    error('Can only raise unitval to scalar power');
    
end

r = unitval(double(p).^q);

dims = unitval.dimensions;
N = length(dims);

for jj = 1:N
    r.(dims{jj}) = p.(dims{jj}) * q;
end
