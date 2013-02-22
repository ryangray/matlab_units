% mrdivide  Implement p / q for unitvals.

function r = mrdivide (p,q)

dims = unitval.dimensions;
N = length(dims);

if isa(p,'unitval') && isa(q,'unitval')

    r = unitval(double(p) / double(q));
    
    for jj = 1:N
        r.(dims{jj}) = p.(dims{jj}) - q.(dims{jj});
    end
    
elseif isa(p,'unitval')
    
    r = unitval(double(p) / q, p);
    
else % q is a unitval
    
    r = unitval(p / double(q));
    
    for jj = 1:N
        r.(dims{jj}) = -q.(dims{jj});
    end
    
end

% if isunitless(r)
%     
%     r = double(r);
% end
