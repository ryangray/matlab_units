% meshgrid  for unitvals.

function [X, Y, varargout] = meshgrid (x, y, z)

if nargin == 1
    
    y = x;
end

if nargin > 2
    
    [X, Y, Z] = meshgrid(double(x), double(y), double(z));
    
else
    
    [X, Y] = meshgrid(double(x), double(y));
    
end

if isa(x,'unitval')
    
    X = unitval(X, x);
    
end

if isa(y,'unitval')
    
    Y = unitval(Y, y);

end

if nargin > 2
    
    if isa(z,'unitval')

        Z = unitval(Z, z);

    end
    
    varargout{1} = Z;
    
end
